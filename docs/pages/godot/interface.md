# L'Interface de Godot

## Project Manager

C'est la **première fenêtre** qui s'ouvre quand on ouvre l'exécutable [Godot](#godot/godot.md).

<img src="./medias/interface-godot/interface-project-manager-1.png">

C'est ici que l'on va retrouver **tous nos projets**. À partir de cette fenêtre **on peut**: **créer** un nouveau projet, **éditer** un projet, **lancer** une preview du projet.

<img src="./medias/interface-godot/interface-project-manager-2.png">

En haut, on retrouve les boutons:

- **Create**: Ce bouton ouvre la fenêtre de création de projet

<img width="300px" src="./medias/interface-godot/interface-project-manager-3.png">

- **Import**: Ce bouton permet d'**importer** un projet.

- **Scan**: Ce bouton permet de **scanner un dossier entier** pour importer **plusieurs projets d'un coup**.

Ensuite on a une liste de tous nos projets.

<img src="./medias/interface-godot/interface-project-manager-4.png">

## Onglets principaux

La fenêtre principale de [Godot](#godot/godot.md) se compose par défaut de 5 onglets. Certains plugins peuvent ajouter de nouveaux onglet.

<img src="./medias/interface-godot/interface-main-panels-1.png">

On retrouve à chaque onglet les [scènes](#godot/godot.md#scenes) que l'on a ouvert.

<img src="./medias/interface-godot/interface-main-panels-2.png">

### Onglet ![Godot - 2D Panel](../../medias/godot-icons/2D.svg) 2D

Permet d'**éditer** tous les **élements 2D** (les [Node2D](#godot/nodes.md#node2d) et [Control](#godot/nodes.md#control)).

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

Permet d'**éditer** tous les **élements 3D** (les [Node3D](#godot/nodes.md#node3d)).

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

### Onglet ![Godot - Game Panel](../../medias/godot-icons/Game.svg) Game

### Onglet ![Godot - AssetLib Panel](../../medias/godot-icons/AssetLib.svg) AssetLib

## Scene Tree

## File System

## Inspecteur

## Historique

## Onglets en bas

### Output

### Debugger

### Animation

### Audio

### Shader Editor

## Autres fenêtres

### Import

### History

### Signaux

### Groupes

