# <div class="icon" style="mask-image: url(./medias/icons/visual-novel.svg)"></div> Atelier 3 - Visual Novel

Dans cet atelier, on va apprendre à utiliser le [![plugin](../../medias/godot-icons/PluginScript.svg) Plugin](#godot/plugins.md) ![dialogue manager](../../medias/dialogue-manager.svg) **Dialogue Manager** pour créer un visual novel !

<details class="learning-details">
    <summary>Concepts Abordés</summary>
    <ul>
        <li>Les <a href="#godot/plugins.md">plugins</a></li>
        <li>Le plugin Dialogue Manager</li>
    </ul>
</details>

## Jeu

<iframe-player launchFullscreen="false" title="Jeu de Plateforme" class="game" src="./game-builds/visual-novel/index.html"></iframe-player>

## Création du projet

On commence en créant notre projet, je vais l'appeler *"Atelier Visual Novel"*. À ce projet on ajoute le fichier *"/assets/"* que vous pouvez télécharger <a href="https://downgit.github.io/#/home?url=https://github.com/RSelaries/ateliers-gamejam/tree/main/projets/visual_novel/assets" class="external-link">ici</a>. (Vous pouvez égallement vous rendre sur <a href="https://itch.io/game-assets/genre-visual-novel/tag-no-ai" class="external-link">cette page</a> pour chercher d'autres images)

> Si vous avez oublié comment faire, vous pouvez relire la partie [Création du projet](#ateliers/jeu-de-plateforme.md#creation-du-projet) du deuxième atelier.

<viewable-image src="./medias/visual-novel/creation-projet-1.png"></viewable-image>

## Installation du Plugin

Parfois il est inutile de réinventer la roue. C'est pour cela qu'au lieu de coder un système de dialogue complexe et sûrement bancal, on va installer un plugin qui va tout gérer pour nous.

<br>

Les plugins sont accessibles directement dans Godot via l'onglet ![AssetLib](../../medias/godot-icons/AssetLib.svg) AssetLib.

On cherche *"Dialogue Manager"* puis on l'installe.

<viewable-image src="./medias/visual-novel/download-plugin-1.gif"></viewable-image>

Une fois le plugin installé, il faut l'activer dans les paramètres de projet: *Project > Project Settings > Plugin > Dialogue Manager*.

<viewable-image src="./medias/visual-novel/download-plugin-2.gif"></viewable-image>

## Création du premier dialogue

On peut dès à présent créer notre premier dialogue. Pour cela on se rend sur l'onglet <span style="white-space: nowrap">![dialogue manager](../../medias/icons/visual-novel.svg) Dialogue</span>, puis on sélectionne <span style="white-space: nowrap">![Newfile](../../medias/godot-icons/New.svg) New Dialogue...</span>. On peut enregistrer ce nouveau dialogue dans un dossier *"/dialogues/"*.

<viewable-image src="./medias/visual-novel/create_diag_file-1.gif"></viewable-image>
