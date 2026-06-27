# Clavier QWERTY (US) pour joueurs français

Un petit `.bat` interactif qui ajoute le clavier **anglais QWERTY (US)** en plus du français — pour les jeux qui ne gèrent pas l'AZERTY — avec une option pour tout remettre comme avant.

## Ce qu'il fait

Un menu, trois choix :

1. **Ajouter le QWERTY (US)** en plus du français. Le français AZERTY reste ton clavier par défaut, et le script **désactive les raccourcis Ctrl+Maj et Alt-gauche+Maj** qui changent le clavier par erreur (anti-missclick en jeu). Tu bascules FR / EN volontairement en cliquant sur l'icône de langue dans la barre des tâches.
2. **Revenir au français seul** + restaurer les raccourcis par défaut + masquer l'icône de langue dans la barre des tâches.
3. **Quitter.**

La méthode utilisée est `Set-WinUserLanguageList` (PowerShell), bien plus fiable que le réglage via Paramètres, qui échoue souvent ou laisse revenir le clavier US tout seul. L'ajout ne change **que** l'entrée clavier, pas la langue d'affichage de Windows.

## Pas besoin d'administrateur

Changer de clavier est un réglage **par utilisateur** : le script ne demande **aucune** élévation (UAC). Le lancer en non-admin garantit même que le changement s'applique bien à **ta** session ouverte.

## Comment l'utiliser

1. Sauvegarde le `.bat` en **ANSI / Windows-1252** (pas UTF-8).
2. Double-clic.
3. Choisis ton option. Une **fermeture / réouverture de session** (ou un redémarrage) applique le changement.

## Note honnête sur Win + Espace

Le script désactive Ctrl+Maj et Alt-gauche+Maj, mais **il ne peut pas désactiver Win + Espace** : c'est un raccourci système protégé par Windows, automatiquement actif dès qu'au moins deux dispositions sont installées. Aucune clé de registre ne le neutralise de façon fiable (Microsoft confirme qu'il n'existe aucune option intégrée). Si tu veux vraiment le couper, remappe-le avec **Microsoft PowerToys** (Keyboard Manager → Remap a shortcut → Win+Espace).

## Note honnête sur l'icône

Avec un seul clavier, l'icône de langue disparaît normalement d'elle-même ; le script force aussi `ShowStatus=3` en renfort. **Si** Windows 11 24H2 l'affiche encore (bug connu), le contournement manuel fiable : *Paramètres -> Heure et langue -> Saisie -> Paramètres avancés du clavier* -> coche « Utiliser la barre de langue du Bureau » puis passe-la en « Masqué » (paradoxalement, ça retire l'icône).

Fait avec [Claude.ai](https://claude.ai).
