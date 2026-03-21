# Lexique du Game dev

## FPS

First Person Shooter *(jeu de tir à la première personne)*. Le terme est aujourd'hui souvent utilisé pour définir les jeux 3D à la première personne, même si ce ne sont pas des jeux de tir.

## Frame

Une frame est une **image**. Plus précisément, à chaque fois que l'**image change** dans le jeu, c'est une **nouvelle frame** qui est générée.

> C'est de là que vient le terme *FPS* pour **frames per second**, donc le nombre d'images différentes à la seconde. Un écran classique peut afficher 60 images par secondes.<br>
<span style="font-size: 0.8em">/!\ Attention à ne pas confondre FPS qui désigne les images par secondes et [FPS](#ressources-suplementaires/lexique-game-dev.md#fps), un jeu à la première personne.</span>

## Low Poly

Désigne des modèles 3D *(ou [meshs](#ressources-suplementaires/lexique-game-dev.md#mesh))* qui ont peu de polygones. C'est aujourd'hui un style artistique mais il sagissait avant d'une contrainte technique (tout comme pour le [pixel art](#ressources-suplementaires/lexique-game-dev.md#pixel-art)).

## Mesh

De l'anglais mesh *(maillage)*, un mesh est une collection de points dans un espace 3D.<br>
Autrement dit: **un modèle 3D**.

## Pixel Art

**Medium artistique** découlant des mediums **numériques** où la dimmension *(en pixels)* de l'image est très limitée. Il s'agissait à l'origine d'une contrainte technique. 

## Side Scroller

Jeu en 2D avec la camera en vue de coté. Les personnages se déplacent de gauche à droite et sont affectés par la gravité.

## Sprite

**Image** représentant le plus souvent un **personnage** ou un **objet** dans un jeu 2D.

## Tilemap

Agencement de tuiles *(à partir d'un [tileset](#ressources-suplementaires/lexique-game-dev.md#tileset))* pour former des décors.

> Dans Godot, on utiliserais le node [![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer)

## Tileset

Ensemble de tuiles *(tiles)* regroupées sur une même image. Souvent utilisé pour les environements.

> Dans Godot, on utiliserais une ressource <a class="external-link" href="https://docs.godotengine.org/en/stable/classes/class_tileset.html#tileset">TileSet</a>

## Version Control

Le **version control** est le fait de garder une trace de chaque modification apportée aux lignes de code. Cela permet de revenir en arrière très facilement en cas de problème et c'est un très bon outil pour travailler à plusieurs. **Git** est l'outil de version control le plus utilisé *(~90%)* dans le monde. **Github** est une des plateformes qui permettent d'héberger un projet **git** gratuitement (Ce site par exemple).<br>

> Google doc contient d'ailleurs une fonctionnalité de version control !

> Le **version controling** est **extrèmement utile** ! Je recommande de l'**utiliser pour tous vos projets** qui se composent de fichiers textes (programmation, docummentation, etc...)