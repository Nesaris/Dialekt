// La calculatrice exacte : mêmes essais que dans SYNAPSE (src/calcul.test.js).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { calculer, trouverCalculs } from '../src/calcul.js';

test('calculatrice : le calcul de référence, écrit de toutes les façons', () => {
  for (const e of ['10XpiX324000', '10 × π × 324 000', '10 fois pi fois 324000'])
    assert.ok(calculer(e).valeur.startsWith('10178760.19763093009261896456'), e);
});
test('calculatrice : exacte, priorités justes, refus propres', () => {
  assert.equal(calculer('0,1 + 0,2').valeur, '0.3');
  assert.equal(calculer('2^100').valeur, '1267650600228229401496703205376');
  assert.equal(calculer('-2^2').valeur, '-4');
  assert.equal(calculer('1/0').erreur, 'division par zéro');
  assert.equal(calculer('process.exit(1)').ok, false);
});
test('calculatrice : dans une phrase, pas les dates ni les nombres seuls', () => {
  assert.deepEqual(trouverCalculs('combien font 10XpiX324000 ?').map(r => r.expression), ['10XpiX324000']);
  assert.deepEqual(trouverCalculs('rdv le 12/11 à 14:30, port 8120'), []);
});
