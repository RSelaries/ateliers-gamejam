# <div class="icon" style="mask-image: url(./medias/icons/plateformer-icon.svg)"></div> Jeu de plateforme

Dans cet atelier, on va créer un jeu de plateforme 2D [side-scroller](#ressources-suplementaires/lexique-game-dev.md#side-scroller) en [TileSet](#ressources-suplementaires/lexique-game-dev.md#tileset).

## Préparation de la scène

Comme la dernière fois, on vas **créer un nouveau projet**. On lui donne un **nom** et un **emplacement** puis on choisi **compatibility** pour le [renderer](#godot/godot.md#renderer).

<img src="./medias/jeu-de-plateforme/plateformer-start-1.png">

Cette fois-ci on va créer une **scène 2D**.

<img src="./medias/jeu-de-plateforme/plateformer-start-2.png">

Je vais l'appeller *Game*. <span style="color: var(--body-text-color-faded); font-size: .8em">(N'oubliez pas d'**enregistrer la scène** et d'**enregistrer souvent** votre travail !)</span>

<div class="side-by-side">
<img src="./medias/jeu-de-plateforme/plateformer-start-3.png">
<img src="./medias/jeu-de-plateforme/plateformer-start-4.png">
</div>

### Télécharger les assets

Pour ce jeu, on va utiliser un [![Godot - TileSet](../../medias/godot-icons/TileSet.svg) tileset](#ressources-suplementaires/lexique-game-dev.md#tileset). On pourrait le **dessiner à la main** avec par exemple [Pixelorama](#ressources-suplementaires/pixelorama.md) mais c'est **plus simple** pour aujourd'hui d'en **télécharger** un déjà fait.

Vous pouvez utiliser le même que moi en le **téléchargant** à ce <a class="external-link" href="https://downgit.github.io/#/home?url=https://github.com/RSelaries/ateliers-gamejam/blob/main/projets/jeu_de_plateforme/assets">lien</a>. Ou bien en **télécharger un autre**, par exemple en cherchant <a class="external-link" href="https://itch.io/game-assets/tag-side-scroller/tag-tileset">ici</a>.

<br>

Une fois ça fait vous pouvez ajouter le dossier *assets* à votre projet *(ou bien le créer)*.

<img src="./medias/jeu-de-plateforme/plateformer-start-5.png">

Ici, on vient d'ajouter une **image** <span style="color: var(--body-text-color-faded); font-size: .8em">(une texture)</span> d'un **tileset** <span style="color: var(--body-text-color-faded); font-size: .8em">(une texture atlas)</span>. Mais pour qu'il soit **utilisable** par Godot il faut créer une **ressource** [![Godot - TileSet](../../medias/godot-icons/TileSet.svg) TileSet](#ressources-suplementaires/lexique-game-dev.md#tileset).

### Création du TileSet

<div class="side-by-side content">
<img src="./medias/jeu-de-plateforme/plateformer-start-6.png">
<img src="./medias/jeu-de-plateforme/plateformer-start-7.png">
</div>

On peut alors l'**enregistrer**, je l'ai appelé simplement *"tileset"*. Cela nous **ouvre** alors l'**onglet** de [![Godot - TileSetPanel](../../medias/godot-icons/TileSet.svg) TileSet](#godot/interface.md#tileset) en bas de l'écran où l'on peut **paramétrer** notre ![Godot - TileSetPanel](../../medias/godot-icons/TileSet.svg) TileSet.

<img src="./medias/jeu-de-plateforme/plateformer-start-8.png">

Il faut maintenant ajouter la texture atlas <span style="color: var(--body-text-color-faded); font-size: .8em">(notre image *tileset_atlas.png*)</span>.

<img src="./medias/jeu-de-plateforme/plateformer-start-9.png">

<img src="./medias/jeu-de-plateforme/plateformer-start-10.png">

Godot vas alors nous proposer de **créer automatiquement** les **Tiles** pour nous. **On vas répondre non** étant donné que ce tileset fait **12x12** au lieu des **16x16** traditionnels. <span style="color: var(--body-text-color-faded); font-size: .8em">(Si vous avez téléchargé un tileset 16x16 ou 32x32 vous pouvez répondre oui, il y a plus de chance que cela fonctionne pour vous)</span>

<img src="./medias/jeu-de-plateforme/plateformer-start-11.png">

On se retrouve alors devant cet écran, on doit maintenant paramétrer notre tileset.

<img src="./medias/jeu-de-plateforme/plateformer-start-12.png">

Le plus **important** est le **paramètre** `texture_region`. Il est par défaut en **16x16**, je vais donc le mettre à **12x12**.

<img src="./medias/jeu-de-plateforme/plateformer-start-13.png">

<div class="side-by-side">
<img src="./medias/jeu-de-plateforme/plateformer-start-15.png">
<img src="./medias/jeu-de-plateforme/plateformer-start-16.png">
</div>

Une fois ça fait, il faut définir les tuiles (Tiles) qui peuvent être utilisées.

Pour cela, il suffit de cliquer sur les tuiles que l'on va utiliser en étant en mode ![Godot - Tools](../../medias/godot-icons/Tools.svg) Setup

<img src="./medias/jeu-de-plateforme/plateformer-start-14.gif">

## Création de la TileMap

Pour cela, il faut ajouter un [![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer) à notre scène.

<div class="side-by-side two-to-one">
<img src="./medias/jeu-de-plateforme/plateformer-tilemap-1.png">
<img src="./medias/jeu-de-plateforme/plateformer-tilemap-2.png">
<img src="./medias/jeu-de-plateforme/plateformer-tilemap-3.png">
</div>

Ensuite on ajoute le **TileSet** que l'on a créé dans le **paramètre** `tileset` de le [![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer).

On clique dessus puis sur *"Quick load"* et on sélectionne le **TileSet** que l'on a créé.

<img src="./medias/jeu-de-plateforme/plateformer-tilemap-4.gif">

Cela nous ouvre alors l'onglet [![Godot - TileMap](../../medias/godot-icons/TileMapPanel.svg) TileMap](#godot/interface.md#tilemap) avec notre TileSet de sélectionné.

<img src="./medias/jeu-de-plateforme/plateformer-tilemap-5.png">

## Création d'un niveau

Maintenant il nous suffit de **cliquer sur une tuile** dans cette fenêtre et on peut commencer à **peindre notre niveau**:

<img src="./medias/jeu-de-plateforme/plateformer-level-1.gif">

Mais on a un petit **soucis**: les **pixels** des tuiles sont **flous**.

<div class="side-by-side">
<img src="./medias/jeu-de-plateforme/plateformer-level-2.png">
<img src="./medias/jeu-de-plateforme/plateformer-level-3.png">
</div>

Par défaut Godot **lisse les textures**, c'est l'*anti-aliasing*.

Pour palier à cela, il faut modifier les **paramètres du projet**. Plus précisément: mettre le **paramètre** `default_texture_filter` sur `Nearest`.

<img src="./medias/jeu-de-plateforme/plateformer-level-4.gif">

Maintenant on peut **créer notre premier niveau**. <span style="color: var(--body-text-color-faded); font-size: .8em">Pour plus de précision sur la peinture des Tiles rendez vous sur la page [![Godot - TileMap](../../medias/godot-icons/TileMapPanel.svg) TileMap](#godot/interface.md#tilemap).</span>

### Niveau de test

Je vais faire mon niveau sur plusieurs *"calques"*, pour cela il me suffit d'utiliser un [![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer) par *"calque"*. Je vais les renommer pour plus de clarté.

<div class="side-by-side">
<img src="./medias/jeu-de-plateforme/plateformer-level-test-1.png">
<img src="./medias/jeu-de-plateforme/plateformer-level-test-2.png">
</div>

<div class="side-by-side">
<img src="./medias/jeu-de-plateforme/plateformer-level-test-3.png">
<img src="./medias/jeu-de-plateforme/plateformer-level-test-4.png">
</div>

Je vais aussi **modifier** la **couleur de fond** pour la mettre en noir.

<img src="./medias/jeu-de-plateforme/plateformer-level-test-5.gif">

