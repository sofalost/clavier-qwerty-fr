# Clavier QWERTY (US) pour joueurs français

Un petit `.bat` interactif qui ajoute le clavier **anglais QWERTY (US)** en plus du français — pour les jeux qui ne gèrent pas l'AZERTY — avec une option pour tout remettre comme avant.

## Ce qu'il fait

Un menu, trois choix :

1. **Ajouter le QWERTY (US)** en plus du français. Le français AZERTY reste ton clavier par défaut ; tu bascules FR / EN à la volée avec **Win + Espace** (pratique juste avant de lancer un jeu).
2. **Revenir au français seul** + masquer l'icône de langue dans la barre des tâches.
3. **Quitter.**

La méthode utilisée est `Set-WinUserLanguageList` (PowerShell), bien plus fiable que le réglage via Paramètres, qui échoue souvent ou laisse revenir le clavier US tout seul. L'ajout ne change **que** l'entrée clavier, pas la langue d'affichage de Windows.

## Pas besoin d'administrateur

Changer de clavier est un réglage **par utilisateur** : le script ne demande **aucune** élévation (UAC). Le lancer en non-admin garantit même que le changement s'applique bien à **ta** session ouverte.

## Comment l'utiliser

1. Sauvegarde le `.bat` en **ANSI / Windows-1252** (pas UTF-8).
2. Double-clic.
3. Choisis ton option. Une **fermeture / réouverture de session** (ou un redémarrage) applique le changement.


Fait avec [Claude.ai](https://claude.ai).
