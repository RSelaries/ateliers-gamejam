# L'Interface de Godot

## Project Manager

C'est la **première fenêtre** qui s'ouvre quand on ouvre l'exécutable [![Godot Logo](../../medias/godot-logo.svg) Godot](#godot/godot.md).

<img src="./medias/interface-godot/interface-project-manager-1.png">

C'est ici que l'on va retrouver **tous nos projets**. À partir de cette fenêtre **on peut**: **créer** un nouveau projet, **éditer** un projet, **lancer** une preview du projet.

<img src="./medias/interface-godot/interface-project-manager-2.png">

En haut, on retrouve les boutons:

- **![Godot - Add](../../medias/godot-icons/Add.svg) Create**: Ce bouton ouvre la fenêtre de création de projet

<img width="300px" src="./medias/interface-godot/interface-project-manager-3.png">

- **![Godot - Load](../../medias/godot-icons/Load.svg) Import**: Ce bouton permet d'**importer** un projet.

- **![Godot - Search](../../medias/godot-icons/Search.svg) Scan**: Ce bouton permet de **scanner un dossier entier** pour importer **plusieurs projets d'un coup**.

Ensuite on a une liste de tous nos projets.

<img src="./medias/interface-godot/interface-project-manager-4.png">

## Onglets principaux

La fenêtre principale de [![Godot Logo](../../medias/godot-logo.svg) Godot](#godot/godot.md) se compose par défaut de 5 onglets: [![Godot - 2D Panel](../../medias/godot-icons/2D.svg) 2D](#godot/interface.md#onglet-2d), [![Godot - 3D Panel](../../medias/godot-icons/3D.svg) 3D](#godot/interface.md#onglet-3d), [![Godot - Script Panel](../../medias/godot-icons/Script.svg) Script](#godot/interface.md#onglet-script), [![Godot - Game Panel](../../medias/godot-icons/Game.svg) Game](#godot/interface.md#onglet-game), [![Godot - AssetLib Panel](../../medias/godot-icons/AssetLib.svg) AssetLib](#godot/interface.md#onglet-assetlib).

Certains [plugins](#godot/godot.md#plugins) peuvent ajouter de **nouveaux onglets**.

<img src="./medias/interface-godot/interface-main-panels-1.png">

On retrouve à chaque fois les [![Godot - PackedScene](../../medias/godot-icons/PackedScene.svg) scènes](#godot/godot.md#scenes) que l'on a ouvert.

<img src="./medias/interface-godot/interface-main-panels-2.png">

### Onglet ![Godot - 2D Panel](../../medias/godot-icons/2D.svg) 2D

Permet d'**éditer** tous les **élements 2D** (les [![Godot - Node2D](../../medias/godot-icons/Node2D.svg) Node2D](#godot/nodes.md#node2d) et [![Godot - Control](../../medias/godot-icons/Control.svg) Control](#godot/nodes.md#control)).

<img src="./medias/interface-godot/interface-2d-1.png">

#### Outils 2D

<img src="./medias/interface-godot/interface-2d-2.png">

Dans l'ordre:

- ![Godot - ToolSelect](../../medias/godot-icons/ToolSelect.svg) Sélection

- ![Godot - ToolMove](../../medias/godot-icons/ToolMove.svg) Déplacement

- ![Godot - ToolRotate](../../medias/godot-icons/ToolRotate.svg) Rotation

- ![Godot - ToolScale](../../medias/godot-icons/ToolScale.svg) Échelle

- ![Godot - ListSelect](../../medias/godot-icons/ListSelect.svg) Sélection Liste <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de sélectionner un objet précis quand plusieurs objets se superposent)</span>

- ![Godot - EditPivot](../../medias/godot-icons/EditPivot.svg) Point de Pivot

- ![Godot - ToolPan](../../medias/godot-icons/ToolPan.svg) Panorama <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de déplacer la vue)</span>

- ![Godot - Ruler](../../medias/godot-icons/Ruler.svg) Règle <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de mesurer des distances)</span>

- ![Godot - Object](../../medias/godot-icons/Object.svg) Espace Local <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de modifier l'obect dans son espace local et non plus dans l'espace global)</span>

- ![Godot - Snap](../../medias/godot-icons/Snap.svg) Magnétisme

- ![Godot - SnapGrid](../../medias/godot-icons/SnapGrid.svg) Magnétisme de Grille

- ![Godot - GuiTabMenuHl](../../medias/godot-icons/GuiTabMenuHl.svg) Options de Magnétisme et de Grille

- ![Godot - Lock](../../medias/godot-icons/Lock.svg) Vérouiller les Nodes

- ![Godot - Group](../../medias/godot-icons/Group.svg) Grouper les Nodes <span style="font-size: .8em; color: var(--body-text-color-faded)">(Si un des nodes enfant est selectioné, le parent sera selectionné)</span>

- ![Godot - Bone](../../medias/godot-icons/Bone.svg) Options de Squellette

- Options d'affichage

### Onglet ![Godot - 3D Panel](../../medias/godot-icons/3D.svg) 3D

Permet d'**éditer** tous les **élements 3D** (les [![Godot - Node3D](../../medias/godot-icons/Node3D.svg) Node3D](#godot/nodes.md#node3d)).

<img src="./medias/interface-godot/interface-3d-1.png">

#### Outils 3D

<img src="./medias/interface-godot/interface-3d-2.png">

Dans l'ordre:

- ![Godot - ToolTransform](../../medias/godot-icons/ToolTransform.svg) Transformation

- ![Godot - ToolMove](../../medias/godot-icons/ToolMove.svg) Déplacement

- ![Godot - ToolRotate](../../medias/godot-icons/ToolRotate.svg) Rotation

- ![Godot - ToolScale](../../medias/godot-icons/ToolScale.svg) Échelle

- ![Godot - ToolSelect](../../medias/godot-icons/ToolSelect.svg) Sélection

- ![Godot - ListSelect](../../medias/godot-icons/ListSelect.svg) Sélection Liste <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de sélectionner un objet précis quand plusieurs objets se superposent)</span>

- ![Godot - Lock](../../medias/godot-icons/Lock.svg) Vérouiller les Nodes

- ![Godot - Group](../../medias/godot-icons/Group.svg) Grouper les Nodes <span style="font-size: .8em; color: var(--body-text-color-faded)">(Si un des nodes enfant est selectioné, le parent sera selectionné)</span>

- ![Godot - Ruler](../../medias/godot-icons/Ruler.svg) Règle <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de mesurer des distances)</span>

- ![Godot - Object](../../medias/godot-icons/Object.svg) Espace Local <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de modifier l'obect dans son espace local et non plus dans l'espace global)</span>

- ![Godot - Snap](../../medias/godot-icons/Snap.svg) Magnétisme

- ![Godot - PreviewSun](../../medias/godot-icons/PreviewSun.svg) Prévisualisation Soleil <span style="font-size: .8em; color: var(--body-text-color-faded)">(Voir [![Godot - DirectionalLight3D](../../medias/godot-icons/DirectionalLight3D.svg) DirectionalLight3D](#godot/nodes.md#directionallight3d))</span>

- ![Godot - Environment](../../medias/godot-icons/Environment.svg) Prévisualisation Environement <span style="font-size: .8em; color: var(--body-text-color-faded)">(Voir [![Godot - WorldEnvironment](../../medias/godot-icons/WorldEnvironment.svg) WorldEnvironment](#godot/nodes.md#worldenvironment))</span>

- ![Godot - GuiTabMenuHl](../../medias/godot-icons/GuiTabMenuHl.svg) Options de Soleil et Environement

- Options de transformation

- Options d'affichage

### Onglet ![Godot - Script Panel](../../medias/godot-icons/Script.svg) Script

Permet d'**éditer** les scripts de nos [![Godot - node](../../medias/godot-icons/Node.svg) Nodes](#godot/nodes.md#node).

<img src="./medias/interface-godot/interface-script-1.png">

On y retrouve en **haut à gauche** la liste des **scripts ouverts**. En **bas à gauche** la **liste des fonctions** du script actuel. Enfin la **fenêtre de droite** où on retrouve le **script en lui-même**.

### Onglet ![Godot - Game Panel](../../medias/godot-icons/Game.svg) Game

Cette fenêtre permet d'**intéragir avec le jeu** quand on le lance.

<div class="side-by-side">
    <img src="./medias/interface-godot/interface-game-1.png">
    <img src="./medias/interface-godot/interface-game-2.png">
</div>

Quand le jeu est lancé on peut voir que l'[Output](#godot/interface.md#output) s'ouvre automatiquement.

#### Outils Game

<img src="./medias/interface-godot/interface-game-3.png">

Dans l'ordre:

- ![Godot - Suspend](../../medias/godot-icons/Suspend.svg) Play / Pause

- ![Godot - NextFrame](../../medias/godot-icons/NextFrame.svg) Prochaine [Frame](#ressources-suplementaires/lexique-game-dev.md#frame) <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet d'avancer d'une frame quand le jeu est en pause)</span>

- 1.0x Vitesse du jeu

- ![Godot - Reload](../../medias/godot-icons/Reload.svg) Réinitialiser la vitesse du jeu <span style="font-size: .8em; color: var(--body-text-color-faded)">(Remet la vitesse du jeu à 1.0x)</span>

- ![Godot - InputEventJoypadMotion](../../medias/godot-icons/InputEventJoypadMotion.svg) Intéragir avec le jeu <span style="font-size: .8em; color: var(--body-text-color-faded)">(Les appuies de touches et les clics de souris seronts captés par le jeu)</span>

- ![Godot - 2DNodes](../../medias/godot-icons/2DNodes.svg) Sélection 2D <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de sélectionner les [![Godot - Node2D](../../medias/godot-icons/Node2D.svg) Node2D](#godot/nodes.md#node2d) et [![Godot - Control](../../medias/godot-icons/Control.svg) Control](#godot/nodes.md#control))</span>

- ![Godot - Node3D](../../medias/godot-icons/Node3D.svg) Sélection 3D <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de sélectionner les [![Godot - Node3D](../../medias/godot-icons/Node3D.svg) Node3D](#godot/nodes.md#node3d))</span>

- ![Godot - ToolSelect](../../medias/godot-icons/ToolSelect.svg) Sélection

- ![Godot - ListSelect](../../medias/godot-icons/ListSelect.svg) Sélection Liste <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet de sélectionner un objet précis quand plusieurs objets se superposent)</span>

- ![Godot - GuiVisibilityVisible](../../medias/godot-icons/GuiVisibilityVisible.svg) Affichage de la sélection <span style="font-size: .8em; color: var(--body-text-color-faded)">(Permet d'afficher ou non le rectangle jaune autour de l'objet sélectionné)</span>

- ![Godot - GuiTabMenuHl](../../medias/godot-icons/GuiTabMenuHl.svg) Paramètres de sélection

- ![Godot - AudioStreamPlayer](../../medias/godot-icons/AudioStreamPlayer.svg) Couper le son

- ![Godot - Camera](../../medias/godot-icons/Camera.svg) Camera Libre

- ![Godot - GuiTabMenuHl](../../medias/godot-icons/GuiTabMenuHl.svg) Paramètres de camera

- ![Godot - KeepAspect](../../medias/godot-icons/KeepAspect.svg) Paramètres d'Affichage

### Onglet ![Godot - AssetLib Panel](../../medias/godot-icons/AssetLib.svg) AssetLib

L'onglet **AssetLib** permet d'accéder aux **créations** et [plugins](#godot/godot.md#plugins) de la **communauté**.

<img src="./medias/interface-godot/interface-assetlib-1.png">

## SceneTree

Le SceneTree permet de **visualiser** et **modifer** l'**arborescence de la scène** actuellement ouverte.

<img src="./medias/interface-godot/interface-scene-tree-1.png">

Les [![Godot - Node](../../medias/godot-icons/Node.svg) nodes](#godot/nodes.md#node) en **bas** de la liste sont au **premier plan**. Les **enfants** d'un [![Godot - Node](../../medias/godot-icons/Node.svg) node](#godot/nodes.md#node) sont représentés **en dessous** et **décalés à droite**.

## FileSystem

Le FileSystem permet d'**accéder à tous les fichiers de notre projet**. Il se situe par défaut en bas à gauche en forme de liste, mais il est possible de **changer son emplacement et son affichage**.

<div class="side-by-side content">
    <img src="./medias/interface-godot/interface-filesystem-1.png">
    <img src="./medias/interface-godot/interface-filesystem-2.png">
</div>

## Inspecteur

L'inspecteur permet de **modifier** les **propriétés** d'un [![Godot - Node](../../medias/godot-icons/Node.svg) Node](#godot/nodes.md#node) ou d'une [![Godot - Object](../../medias/godot-icons/Object.svg) Ressource](#godot/godot.md#ressources).

<div class="side-by-side">
    <img src="./medias/interface-godot/interface-inspector-1.png">
    <img src="./medias/interface-godot/interface-inspector-2.png">
</div>

## Onglets en bas

Par défaut, le menu du bas contient 5 onglets: [![Godot - OutputPanel](../../medias/godot-icons/OutputPanel.svg) Output](#godot/interface.md#output), [![Godot - Debug](../../medias/godot-icons/Debug.svg) Debugger](#godot/interface.md#debugger), [![Godot - AudioStreamPlayer](../../medias/godot-icons/AudioStreamPlayer.svg) Audio](#godot/interface.md#audio), [![Godot - Animation](../../medias/godot-icons/Animation.svg) Animation](#godot/interface.md#animation), [![Godot - ShaderPanel](../../medias/godot-icons/ShaderPanel.svg) Shader Editor](#godot/interface.md#shader-editor). En modifiant **certains [![Godot - Node](../../medias/godot-icons/Node.svg) Node](#godot/nodes.md#node)** ou **[![Godot - Object](../../medias/godot-icons/Object.svg) Ressource](#godot/godot.md#ressources)**, ou bien avec certains **plugins**, de **nouveaux onglets** peuvent s'ajouter.

<img src="./medias/interface-godot/interface-bottom-dock-1.png">

<img src="./medias/interface-godot/interface-bottom-dock-2.png">

### ![Godot - OutputPanel](../../medias/godot-icons/OutputPanel.svg) Output

L'output affiche toutes les **erreurs**, les **avertissements**, et les text qui ont été `print`.

<img src="./medias/interface-godot/interface-output-1.png">

### ![Godot - Debug](../../medias/godot-icons/Debug.svg) Debugger

Le Debugger est une interface riche et complexe qui vas afficher les erreurs et leur *stack trace* <span style="font-size: .8em; color: var(--body-text-color-faded)">(C'est à dire la fonction dans laquelle l'erreur à eu lieu, et la ligne qui a appelé cette fonction et la fonction qui l'a appelé...)</span>

<img src="./medias/interface-godot/interface-debugger-1.png">

Le Debugger est très utile pour l'**optimisation**, mais ce n'est pas quelque chose qui nous intéresse pour l'instant. <span style="font-size: .8em; color: var(--body-text-color-faded)">(Et je ne sais moi-même pas trop utiliser le debugger...)</span>

### ![Godot - AudioStreamPlayer](../../medias/godot-icons/AudioStreamPlayer.svg) Audio 

### ![Godot - Animation](../../medias/godot-icons/Animation.svg) Animation

### ![Godot - ShaderPanel](../../medias/godot-icons/ShaderPanel.svg) Shader Editor

### ![Godot - ThemePanel](../../medias/godot-icons/ThemePanel.svg) Theme

## Autres fenêtres

### Historique

### Import

### History

### Signaux

### Groupes

