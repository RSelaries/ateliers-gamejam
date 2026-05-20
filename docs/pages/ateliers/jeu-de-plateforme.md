# <div class="icon" style="mask-image: url(./medias/icons/plateformer-icon.svg)"></div> Atelier 2 - Jeu de plateforme

Dans cet atelier, on va créer un jeu de plateforme 2D [side-scroller](#ressources-suplementaires/lexique-game-dev.md#side-scroller) en [![Godot - TileSet](../../medias/godot-icons/TileSet.svg) TileSet](#ressources-suplementaires/lexique-game-dev.md#tileset).

<details class="learning-details">
    <summary>Concepts Abordés</summary>
    <ul>
        <li><a href="#godot/nodes.md#tilemaplayer"><img src="./medias/godot-icons/TileMapLayer.svg"> TileMapLayer</a></li>
        <li><a href="#godot/nodes.md#characterbody2d"><img src="./medias/godot-icons/CharacterBody2D.svg"> CharacterBody2D</a></li>
        <li>La physique de Godot</li>
    </ul>
</details>

## Jeu

<iframe-player launchFullscreen="true" title="Jeu de Plateforme" class="game" src="./game-builds/jeu-de-plateforme-v2/index.html"></iframe-player>

## Création du projet

Comme la dernière fois, on va créer un **nouveau projet**.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-start-1.gif"></viewable-image>

<span style="color: var(--body-text-color-faded); font-size: .8em">Pensez à utiliser le renderer "<em>Compatibility</em>" !</span>

<br>

Une fois le projet créé, on va télécharger les assets de notre jeu. Vous pouvez directement télécharger le dossier */assets/* de mon projet <a class="external-link" href="https://downgit.github.io/#/home?url=https://github.com/RSelaries/ateliers-gamejam/tree/main/projets/jeu_de_plateforme_v2/assets" target="blank" download>ici</a>.

> <span style="color: var(--body-text-color-faded); font-size: .8em">Je vous coneille fortement d'utiliser le dossier /assets/ que je fourni, mais vous pouvez également chercher un tileset vous même. Vous pouvez par exemple chercher <a class="external-link" href="https://itch.io/game-assets/tag-side-scroller/tag-tileset" target="blank">ici</a>.</span>

Il nous suffit ensuite de **decompresser** le fichier *zip*, puis de le glisser dans notre projet.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-start-2.gif"></viewable-image>

Le dossier */assets/* contient plusieurs sous-dossiers et fichiers. Pour l'instant le plus important pour nous est le fichier *tileset_texture.png*.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-start-3.png"></viewable-image>

## Création du tileset

Pour ce second jeu, nous allons utiliser la technique de création d'environement appelé [Tileset](#ressources-suplementaires/lexique-game-dev.md#tileset). Pour pouvoir utiliser le tileset que l'on a téléchargé <span style="color: var(--body-text-color-faded); font-size: .8em">(*/tileset_texture.png*)</span> dans Godot, il faut créer une resource ![Tileset](../../medias/godot-icons/TileSet.svg) **Tileset**.

<br>

Pour créer une resource, il suffit de faire *clic-droit* dans le [![FileSys](../../medias/godot-icons/Folder.svg) FileSystem](), puis "![Res](../../medias/godot-icons/Object.svg) New Resource..." et enfin chercher la resource ![Tileset](../../medias/godot-icons/TileSet.svg) **Tileset**.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-start-4.gif"></viewable-image>





