# syntax=docker/dockerfile:1
# DIALEKT 2 : Node seul, aucune dépendance d'exécution. L'image de base est
# épinglée par empreinte (index multi-architecture amd64 + arm64) : une étiquette
# peut être déplacée, une empreinte non.
ARG NODE_IMAGE=node:24.22.1-bookworm-slim@sha256:be8204d4bd327363357f532187b752ff62759c31bedf98e9e18fc08c9cbd605c

# Claude Code, pour l'adversaire « claude-code » : version exacte, depuis le
# verrou. Aucun script d'installation n'est exécuté à l'aveugle ; le seul
# nécessaire (copie du binaire natif de la plateforme) est lancé explicitement.
FROM ${NODE_IMAGE} AS claude
WORKDIR /opt/claude-code
COPY deploy/claude-code/package.json deploy/claude-code/package-lock.json ./
ENV DISABLE_AUTOUPDATER=1 CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
RUN npm ci --ignore-scripts --no-audit --no-fund \
 && node node_modules/@anthropic-ai/claude-code/install.cjs \
 && cp node_modules/@anthropic-ai/claude-code/bin/claude.exe /opt/claude \
 && HOME=/tmp /opt/claude --version

FROM ${NODE_IMAGE}
# Paquets du système à jour, et pas de npm, npx, corepack ni yarn : le service
# n'a aucune dépendance npm, ils n'ont rien à faire dans l'image.
RUN apt-get update && apt-get upgrade -y --no-install-recommends && rm -rf /var/lib/apt/lists/* \
 && rm -rf /usr/local/lib/node_modules/npm /usr/local/lib/node_modules/corepack /usr/local/bin/npm /usr/local/bin/npx /usr/local/bin/corepack /opt/yarn-* /usr/local/bin/yarn /usr/local/bin/yarnpkg
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates tzdata \
 && rm -rf /var/lib/apt/lists/*
COPY --from=claude /opt/claude /usr/local/bin/claude
WORKDIR /app
COPY package.json nouveautes.json ./
COPY socle ./socle
COPY src ./src
COPY web ./web
RUN mkdir -p /app/data && chown node:node /app/data
USER node
ENV NODE_ENV=production DATA_DIR=/app/data DISABLE_AUTOUPDATER=1
EXPOSE 8112
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD ["node", "-e", "fetch('http://127.0.0.1:8112/healthz').then(r => process.exit(r.ok ? 0 : 1), () => process.exit(1))"]
CMD ["node", "--disable-warning=ExperimentalWarning", "src/main.js"]
