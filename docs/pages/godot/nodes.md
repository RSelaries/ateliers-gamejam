# Les Nodes de Godot

Cette page contient une explication courte et simple des Nodes que nous allons utiliser. Pour plus d'informations vous pouvez aller directement sur la <a href="https://docs.godotengine.org/en/stable/classes/index.html#nodes" class="external-link">documentation officielle de Godot</a>.

<!-- Node -->

## ![Godot - Node](../../medias/godot-icons/Node.svg) Node

Le ![Godot - Node](../../medias/godot-icons/Node.svg) Node le plus simple, il fonctionne dans le ![Godot - SceneTree](../../medias/godot-icons/PackedScene.svg) [SceneTree](#godot/godot.md#scenetree). Et implémente les fonctions `_ready` et `_process`.

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_node.html" class="external-link">Documentation officielle</a></span>

<!-- Node2D -->

## ![Godot - Node2D](../../medias/godot-icons/Node2D.svg) Node2D

La famille des ![Godot - Node2D](../../medias/godot-icons/Node2D.svg) Node2D représente tous les [![Godot - Node](../../medias/godot-icons/Node.svg) Nodes](#godot/nodes.md#node) utilisés pour tous les éléments de jeu en 2D (sauf les éléments d'[interfaces utilisateur](#godot/control.md)).

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html" class="external-link">Documentation officielle</a></span>

### ![Godot - CharacterBody2D](../../medias/godot-icons/CharacterBody2D.svg) CharacterBody2D

Un ![Godot - CharacterBody2D](../../medias/godot-icons/CharacterBody2D.svg) CharacterBody2D est un [![Godot - Node2D](../../medias/godot-icons/Node2D.svg) Node2D](#godot/nodes.md#node) utilisé pour créer des **personnages** qui subissent la **physique**. (Gravité, collisions avec les murs...)

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html" class="external-link">Documentation officielle</a></span>

### ![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer

Un ![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer est un [![Godot - Node2D](../../medias/godot-icons/Node2D.svg) Node2D](#godot/nodes.md#node) qui permet d'arranger des tuiles d'un <a class="external-link" href="https://docs.godotengine.org/en/stable/classes/class_tileset.html#tileset"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"> TileSet</a>

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html" class="external-link">Documentation officielle</a></span>

<!-- Control -->

## ![Godot - Control](../../medias/godot-icons/Control.svg) Control

La famille des ![Godot - Control](../../medias/godot-icons/Control.svg) Control représente tous les [![Godot - Node](../../medias/godot-icons/Node.svg) Nodes](#godot/nodes.md#node) utilisés pour les [interfaces utilisateur](#godot/control.md).

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_control.html" class="external-link">Documentation officielle</a></span>

### ![Godot - Label](../../medias/godot-icons/Label.svg) Label

Un ![Godot - Label](../../medias/godot-icons/Label.svg) Label est un [![Godot - Node](../../medias/godot-icons/Node.svg) Node](#godot/nodes.md#node) permettant d'**afficher du texte**. On peut modifier la taille de la police, la fonte, la couleur, le contour et plus.

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_label.html" class="external-link">Documentation officielle</a></span>

### ![Godot - Button](../../medias/godot-icons/Button.svg) Button

Un ![Godot - Button](../../medias/godot-icons/Button.svg) Button est un [![Godot - Node](../../medias/godot-icons/Node.svg) Node](#godot/nodes.md#node) qui permet de créer un bouton clickable.

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_button.html" class="external-link">Documentation officielle</a></span>

### ![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit

Un ![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit est un [![Godot - Node](../../medias/godot-icons/Node.svg) Node](#godot/nodes.md#node) qui permet à l'utilisateur de rentrer du texte qui peut être récupéré par code.

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_lineedit.html" class="external-link">Documentation officielle</a></span>

### ![Godot - SpinBox](../../medias/godot-icons/SpinBox.svg) SpinBox

Un ![Godot - SpinBox](../../medias/godot-icons/SpinBox.svg) SpinBox est un [![Godot - Node](../../medias/godot-icons/Node.svg) Node](#godot/nodes.md#node) qui permet çà l'utilisateur de rentrer un nombre qui peut être récupéré par code.

> <span style="font-size: 0.8em; align-items:center; display: flex; gap: 8px"><img style="height:16px; margin: 0px;" src="./medias/godot-docs-icon.ico"><a href="https://docs.godotengine.org/en/stable/classes/class_spinbox.html" class="external-link">Documentation officielle</a></span>
