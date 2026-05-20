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

Une fois le ![Tileset](../../medias/godot-icons/TileSet.svg) Tileset créé, un onglet "![Tileset](../../medias/godot-icons/TileSet.svg) Tileset" s'ouvre automatiquement dans la fenêtre du bas. Si ce n'est pas le cas, il suffit de re-sélectionner le fichier *"tileset.tres"*.

Dans la fenêtre ![Tileset](../../medias/godot-icons/TileSet.svg) Tileset, il faut ajouter notre *"tileset_texture.png"*, pour cela on clique sur ![Add](../../medias/godot-icons/Add.svg) puis sur *"atlas"* et enfin on sélectionne notre fichier.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-start-5.gif"></viewable-image>

Godot nous informe:

> The atlas's texture was modified.<br>Would you like to automatically create tiles in the atlas ?

Si on répond "Yes", Godot vas tenter de **détecter automatiquements les tuiles**. On peut sélectionner "Yes".

## Création du premier niveau

On peut maintenant commencer à créer notre premier niveau !

<br>

On va créer une scène *"level_1"* de type [![Node2D](../../medias/godot-icons/Node2D.svg) Node2D](#godot/nodes.md#node2d) que l'on va ranger dans un dossier *"/levels/"*.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-1.gif"></viewable-image>

### Peinture des tuiles

On peut ajouter un node [![TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer) à notre scène.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-2.gif"></viewable-image>

On va ensuite utiliser notre "![Tileset](../../medias/godot-icons/TileSet.svg) tileset.tres" pour la propriété `tile_set` du [![TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer).

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-3.gif"></viewable-image>

Dans la fenêtre "![Tilemap](../../medias/godot-icons/TileMapPanel.svg) TileMap", on peut utiliser l'outil "![Paint](../../medias/godot-icons/Edit.svg)" pour peindre des tuiles.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-4.gif"></viewable-image>

Je vais créer un petit niveau de test.

<div class="side-by-side">
    <viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-5.gif"></viewable-image>
    <viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-6.png"></viewable-image>
</div>

**Super !** On a un magnifique niveau, mais deux problèmes:

- Le fond est gris et moche.

- Les textures sont étrangement floues.

### Changer la couleur de fond

Pour changer la couleur de fond, il faut changer les paramètres de projet: *"Project > Project Settings..."*. Puis dans les paramètres: *"Rendering > Environment > Default Clear Color"* qu'on modifie pour du noir.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-7.gif"></viewable-image>

### Textures "pixélisées"

Pour que nos textures soient bien pixélisées il faut également modifier un paramètre de projet: *"Rendering > Textures > Canvas Textures > Default Texture Filter"* > *Nearest*.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-8.gif"></viewable-image>

<div class="side-by-side">
    <viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-9.png"></viewable-image>
    <viewable-image src="./medias/jeu-de-plateforme-v2/platformer-level1-10.png"></viewable-image>
</div>

<span style="color: var(--body-text-color-faded); font-size: .8em">Comparaison AVANT - APRÈS</span>

## Création du personnage

Maintenant que l'on a créé *le meilleur niveau de l'histoire du jeu vidéo*, il nous faut un **personnage** qui puisse se déplacer dans ce niveau.

<br>

Pour cela, on va créer une nouvelle scène *"player.tscn"* de type [![CharacterBody2D](../../medias/godot-icons/CharacterBody2D.svg) CharacterBody2D](#godot/nodes.md#characterbody2d) que l'on va ranger dans un dossier *"/player/"*.

<viewable-image src="./medias/jeu-de-plateforme-v2/platformer-player-1.gif"></viewable-image>




