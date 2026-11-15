<p align="center"><img src="medias/icone.svg" alt="" width="72" height="72"></p>

<p align="center"><img src="medias/affiche.png" alt="Banner — DIALEKT" width="100%"></p>

# Dialekt

**Pit your local AI (Ollama) against Claude, ChatGPT, Gemini, Mistral and more — and let a deterministic judge, never a model, pick the winner.**

<p align="center">

[![Stars](https://img.shields.io/github/stars/Nesaris/Dialekt?style=flat&logo=github&label=stars)](https://github.com/Nesaris/Dialekt/stargazers)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
![Node.js 24](https://img.shields.io/badge/Node.js-24-339933?logo=node.js&logoColor=white)
![Zero npm dependencies](https://img.shields.io/badge/npm%20dependencies-0-brightgreen)
![Docker](https://img.shields.io/badge/Docker-ready-2496ED?logo=docker&logoColor=white)
![Ollama](https://img.shields.io/badge/Ollama-local%20AI-000000?logo=ollama&logoColor=white)

</p>

<p align="center"><a href="README.fr.md">🇫🇷 Documentation complète en français</a> · <a href="https://nesaris.github.io">Nesaris Network</a></p>

## Why Dialekt?

Is your local model actually good enough? Dialekt sends the same question to both, streams the answers side by side, and scores them on measurable criteria — so you can see when local is enough and when it isn't.

## Features

- **Duels** — same question to both models, in parallel and streamed; the judge scores substance, richness, structure, concision and latency.
- **Any opponent** — Claude, ChatGPT, Kimi, Mistral, DeepSeek, Gemini, Groq, OpenRouter or any OpenAI-compatible API.
- **Local-only mode**, private conversations, search, pinning, projects, Markdown export.
- **Rich rendering** — Markdown, tables, code, math (KaTeX); web search per message; text attachments.
- **Pull models from the UI** and **duel statistics**.

## Screenshots

<table>
<tr><td align="center" width="50%"><img src="medias/capture-1.png" alt="A duel and its verdict"><br><sub>A duel and its verdict</sub></td><td align="center" width="50%"><img src="medias/capture-2.png" alt="Conversations"><br><sub>Conversations</sub></td></tr>
<tr><td align="center" width="50%"><img src="medias/capture-3.png" alt="Duel statistics"><br><sub>Duel statistics</sub></td></tr>
</table>

## Quick start

```bash
git clone https://github.com/Nesaris/Dialekt && cd Dialekt
cp .env.example .env
docker compose up -d --build
docker compose logs dialekt | grep "Jeton d'installation"   # one-time setup token
```

Open `http://<host>:8112`, paste the setup token and create your account. Without Docker: Node 24.7+, then `npm start`.

Full documentation (configuration, backups, key rotation, reverse proxy, upgrades) is in **[README.fr.md](README.fr.md)** (French).

## Part of Nesaris Network

Dialekt is one of the self-hosted tools of **[Nesaris Network](https://nesaris.github.io)**. Every service shares the same hardened core (accounts, passkeys, TOTP, audit log, encrypted secrets), runs on Node.js 24 with **zero npm dependencies**, and can be installed in one click from the **[Nesaris Hub](https://github.com/Nesaris/Hub)**.

Other projects: [Hub](https://github.com/Nesaris/Hub) · [MapMyLAN](https://github.com/Nesaris/MapMyLAN) · [NexArc](https://github.com/Nesaris/NexArc) · [ProxLab](https://github.com/Nesaris/ProxLab) · [Vigie](https://github.com/Nesaris/Vigie) · [Relay](https://github.com/Nesaris/Relay) · [Nesmail](https://github.com/Nesaris/Nesmail) · [Synapse](https://github.com/Nesaris/Synapse)

## Contributing

Issues and pull requests are welcome. If Dialekt is useful to you, a ⭐ helps a lot — it's how other people find the project.

## License

[MIT](LICENSE) — made by [CodeX64](https://codexx64.github.io).
