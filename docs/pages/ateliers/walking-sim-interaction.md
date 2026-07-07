# <div class="icon" style="mask-image: url(./medias/icons/walking-sim-interact-icon.svg)"></div> Atelier 5 - Walking Simulator (suite)

Dans cet atelier, on va reprendre le projet du [walking simulator](#ateliers/walking-simulator.md), mais en y ajoutant la possibilité d'intéragir avec des éléments.

## Création du projet

Si vous étiez présent au [dernier atelier](#ateliers/walking-simulator.md), vous pouvez relancer ce projet. Sinon, téléchargez le projet de l'atelier précédent <a class="download-link" href="./downloadables/walking_sim_starter.zip" download>ici</a>.

<br>

Vous devez donc avoir quelque chose de similaire à:

<viewable-image src="./medias/walk-sim-suite/project-1.png"></viewable-image>

C'est à dire **un joueur** et **une scène de test**.

## Création du composant d'intéraction

La <a class="documentation-link" href="https://docs.godotengine.org/fr/4.x/getting_started/introduction/godot_design_philosophy.html">philosophie de Godot</a> pour la création d'objets ou personnages complexes s'appelle *la composition*. Contrairement à Unity par exemple, où l'on va créer plusieurs scripts pour chaque composant, dans Godot chaque node ne peux avoir qu'**un seul script**. Donc si l'on veut créer un système plus complexe on va ajouter des nodes qui vont servir de composant.

<br>

Créons donc notre premier composant: *une zone d'intéraction* !

<br>

Étant donné que l'on veut créer un composant réutilisable, on peut créer un node personnalisé sans avoir à faire tout une scène. Pour cela on créé un nouveau script, on va choisir le type [![area3d](../../medias/godot-icons/Area3D.svg) Area3D](#godot/nodes.md#area3d). Je vais l'appeler *'interactable_area_3d'* puisque ce sera un composant qui permet l'intéraction et qui héritera de l'[![area3d](../../medias/godot-icons/Area3D.svg) Area3D](#godot/nodes.md#area3d).

<viewable-image src="./medias/walk-sim-suite/interactable-1.gif"></viewable-image>

> <span style="color: var(--body-text-color-faded); font-size: .8em">J'ai rangé ce script dans le dossier *"/components/"*.</span><br>
> <viewable-image height="250px" src="./medias/walk-sim-suite/interactable-2.png"></viewable-image>

### Script du composant

Pour ce composant on veut avoir accès à 4 **signaux**:

- `interaction_started`: Au moment où le joueur commence à intéragir avec le composant.

- `interaction_ended`: Au moment où le joueur arrête d'intéragir avec le composant.

- `focus_gained`: Quand le joueur regarde le composant.

- `focus_lost`: Quand le joueur arrête de regarder le composant.

On peut donc référencer ces 4 signaux dans notre script:

#### Signaux

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">extends</span> <span class="hljs-built_in">Area3D</span><br><br>
<span class="hljs-keyword">signal</span> interaction_started
<span class="hljs-keyword">signal</span> interaction_ended
<span class="hljs-keyword">signal</span> focus_gained
<span class="hljs-keyword">signal</span> focus_lost</code></pre>

<details>
    <summary>Ajouter des commentaires de documentation</summary>
    <br>Si vous voulez amméliorer vos custom nodes, vous pouvez leur ajouter de la documentation. Pour cela il suffit d'ajouter un commentaire avec deux <em>'#'</em> au dessus de la <em>fonction</em>/<em>variable</em>/<em>signal </em><span style="color: var(--body-text-color-faded)">(etc.)</span> que vous voulez documenter:
    <pre><code class="hljs language-gdscript"><span class="hljs-keyword">extends</span> <span class="hljs-built_in">Area3D</span><br><br>
<span class="hljs-comment">## Signal émit au moment où le joueur intéragit avec ce composant.</span>
<span class="hljs-keyword">signal</span> interaction_started
<span class="hljs-comment">## Signal émit au moment où le joueur arrête d'intéragir avec ce composant.</span>
<span class="hljs-keyword">signal</span> interaction_ended
<span class="hljs-comment">## Signal émit au moment où le joueur regarde ce composant.</span>
<span class="hljs-keyword">signal</span> focus_gained
<span class="hljs-comment">## Signal émit au moment où le joueur arrête de regarder ce composant.</span>
<span class="hljs-keyword">signal</span> focus_lost</code></pre>
    Maitenant, quand on a le curseur au niveau d'un de nos signaux, on peut lire la documentation que l'on a écrit:<br>
    <viewable-image src="./medias/walk-sim-suite/doc.gif"></viewable-image>
</details>

#### Intéraction

Ensuite on va créer des fonctions qui vont permettre à notre joueur d'intéragir avec le composant:

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">func</span> <span class="hljs-title function_">start_interacting</span>() -> <span class="hljs-built_in">void</span>:
	interaction_started.<span class="hljs-title function_">emit</span>()


<span class="hljs-keyword">func</span> <span class="hljs-title function_">stop_interacting</span>() -> <span class="hljs-built_in">void</span>:
	interaction_ended.<span class="hljs-title function_">emit</span>()</code></pre>

#### Focus

Enfin, il nous faut une variable qui détermine si le joueur est en train de regarder le composant ou non:

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">var</span> focused: <span class="hljs-built_in">bool</span> = <span class="hljs-keyword">false</span></code></pre>

On aimerait que les signaux *`focus_gained`* et *`focus_lost`* soient émits automatiquement quand on change la valeur de *`focused`*. Pour cela on va créer une <a class="documentation-link" href="https://docs.godotengine.org/fr/4.x/tutorials/scripting/gdscript/gdscript_basics.html#properties-setters-and-getters">fonction setter</a>:

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">func</span> <span class="hljs-title function_">_set_focused</span>(new_value: <span class="hljs-built_in">bool</span>) -> <span class="hljs-built_in">void</span>:
	focused = new_value
	<span class="hljs-keyword">if</span> new_value:
		focus_gained.<span class="hljs-title function_">emit</span>()
	<span class="hljs-keyword">else</span>:
		focus_lost.<span class="hljs-title function_">emit</span>()</code></pre>

Et on référence ce **setter** à notre variable:

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">var</span> focused: <span class="hljs-built_in">bool</span> = <span class="hljs-keyword">false</span>:
	<span class="hljs-title function_">set</span> = _set_focused</code></pre>

#### Custom node

Pour finir ce composant, et faire en sorte qu'on puisse le créer comme tout autre node, on doit lui donner un nom. Pour cela on ajoute `class_name` en haut du script:

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">class_name</span> <span class="hljs-built_in">InteractableArea3D</span></code></pre>


> <span style="color: var(--body-text-color-faded); font-size: .8em">Si vous voulez en plus de cela, ajouter une *icône personnalisée* à votre node, vous pouvez ajouter la ligne suivante juste au dessus (ou en dessous):</span>
> <pre><code class="hljs language-gdscript" style="font-size: .8em"><span class ="hljs-bullet">@icon</span>(<span class="hljs-string">"res://assets/icons/InteractableArea3D.svg"</span>)</code></pre>

#### Code complet

<pre><code class="hljs language-gdscript"><span class ="hljs-bullet">@icon</span>(<span class="hljs-string">"res://assets/icons/InteractableArea3D.svg"</span>)
<span class="hljs-keyword">class_name</span> <span class="hljs-built_in">InteractableArea3D</span>
<span class="hljs-keyword">extends</span> <span class="hljs-built_in">Area3D</span><br><br>
<span class="hljs-keyword">signal</span> interaction_started
<span class="hljs-keyword">signal</span> interaction_ended
<span class="hljs-keyword">signal</span> focus_gained
<span class="hljs-keyword">signal</span> focus_lost


<span class="hljs-keyword">var</span> focused: <span class="hljs-built_in">bool</span> = <span class="hljs-keyword">false</span>:
	<span class="hljs-title function_">set</span> = _set_focused


<span class="hljs-keyword">func</span> <span class="hljs-title function_">start_interacting</span>() -> <span class="hljs-built_in">void</span>:
	interaction_started.<span class="hljs-title function_">emit</span>()


<span class="hljs-keyword">func</span> <span class="hljs-title function_">stop_interacting</span>() -> <span class="hljs-built_in">void</span>:
	interaction_ended.<span class="hljs-title function_">emit</span>()


<span class="hljs-keyword">func</span> <span class="hljs-title function_">_set_focused</span>(new_value: <span class="hljs-built_in">bool</span>) -> <span class="hljs-built_in">void</span>:
	focused = new_value
	<span class="hljs-keyword">if</span> new_value:
		focus_gained.<span class="hljs-title function_">emit</span>()
	<span class="hljs-keyword">else</span>:
		focus_lost.<span class="hljs-title function_">emit</span>()</code></pre>

<details>
    <summary>Code avec des commentaires</summary>
    <pre><code class="hljs language-gdscript"><span class ="hljs-bullet">@icon</span>(<span class="hljs-string">"res://assets/icons/InteractableArea3D.svg"</span>)
<span class="hljs-keyword">class_name</span> <span class="hljs-built_in">InteractableArea3D</span>
<span class="hljs-keyword">extends</span> <span class="hljs-built_in">Area3D</span><br><br>
<span class="hljs-comment">## Signal émit au moment où le joueur intéragit avec ce composant.</span>
<span class="hljs-keyword">signal</span> interaction_started
<span class="hljs-comment">## Signal émit au moment où le joueur arrête d'intéragir avec ce composant.</span>
<span class="hljs-keyword">signal</span> interaction_ended
<span class="hljs-comment">## Signal émit au moment où le joueur regarde ce composant.</span>
<span class="hljs-keyword">signal</span> focus_gained
<span class="hljs-comment">## Signal émit au moment où le joueur arrête de regarder ce composant.</span>
<span class="hljs-keyword">signal</span> focus_lost<br><br>
<span class="hljs-comment">## Si [code]true[/code]: le joueur regarde ce composant.</span>
<span class="hljs-keyword">var</span> focused: <span class="hljs-built_in">bool</span> = <span class="hljs-keyword">false</span>:
	<span class="hljs-title function_">set</span> = _set_focused<br><br>
<span class="hljs-comment">## Appeler cette fonction pour intéragir avec ce composant.</span>
<span class="hljs-keyword">func</span> <span class="hljs-title function_">start_interacting</span>() -> <span class="hljs-built_in">void</span>:
	interaction_started.<span class="hljs-title function_">emit</span>()<br><br>
<span class="hljs-comment">## Appeler cettte fonction pour arrêter d'intéragir avec ce composant.</span>
<span class="hljs-keyword">func</span> <span class="hljs-title function_">stop_interacting</span>() -> <span class="hljs-built_in">void</span>:
	interaction_ended.<span class="hljs-title function_">emit</span>()<br><br>
<span class="hljs-comment"># Setter de focused</span>
<span class="hljs-keyword">func</span> <span class="hljs-title function_">_set_focused</span>(new_value: <span class="hljs-built_in">bool</span>) -> <span class="hljs-built_in">void</span>:
	focused = new_value
	<span class="hljs-keyword">if</span> new_value:
		focus_gained.<span class="hljs-title function_">emit</span>()
	<span class="hljs-keyword">else</span>:
		focus_lost.<span class="hljs-title function_">emit</span>()</code></pre>
</details>


## Intéraction du joueur

Maintenant, il faut que notre joueur puisse intéragir avec les composants `InteractableArea3D`.

<br>

Pour cela, on va lui ajouter un [![raycast](../../medias/godot-icons/RayCast3D.svg) RayCast3D](#godot/nodes.md#raycast3d), auquel on va jouter un script.

### Raycast

Un **Raycast** est une *ligne droite* qui *détecte* si elle entre en *collision* avec un objet. Pour s'assurer que le raycast suive le regard du joueur, on doit l'ajouter en enfant du la camera. Ensuite on s'assure que le raycast pointe dans la bonne direction <span style="color: var(--body-text-color-faded); font-size: .8em">(`z` négatif)</span> mais également que la distance soit correcte <span style="color: var(--body-text-color-faded); font-size: .8em">(-1.5m)</span>.

<viewable-image src="./medias/walk-sim-suite/interaction-1.gif"></viewable-image>

Et on s'assure que le **Raycast** puisse entrer en collision avec les **Area**:

<viewable-image src="./medias/walk-sim-suite/interaction-2.png"></viewable-image>

### Script

On peut maintenant ajouter un script à notre raycast, je vais l'appeler *"interaction_raycast.gd"*.

<br>

À chaque frame, on va tester si le raycast est entré en collision avec un objet et si cet objet est un composant **InteractableArea3D**. Mais étant donné que c'est un test physique, on va le faire dans la fonction `_physics_process`.

On va aussi définir la variable `focused_interactable_area` qui aura une référence au composant d'intéraction que le joueur regarde actuellement.

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">extends</span> <span class="hljs-built_in">Area3D</span>


<span class="hljs-keyword">func</span> <span class="hljs-title function_">_physics_process</span>(delta: <span class="hljs-built_in">float</span>) -> <span class="hljs-built_in">void</span>:
	<span class="hljs-keyword">pass</span>
</code></pre>

Puis on modifie `focused_interactable_area` en le composant qu"on regarde actuellement <span style="color: var(--body-text-color-faded); font-size: .8em">(ou `null` si on ne regarde aucun composant d'intéraction)</span>.

Et on change le `focused` de ce composant selon si on le regarde ou non.

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">func</span> <span class="hljs-title function_">_physics_process</span>(delta: <span class="hljs-built_in">float</span>) -> <span class="hljs-built_in">void</span>:
	<span class="hljs-comment"># Si le raycast est en collision avec un objet qui n'est pas un InteractableArea3D,</span>
	<span class="hljs-comment"># alors collider sera null</span>
    <span class="hljs-keyword">var</span> collider := <span class="hljs-title function_">get_collider</span>() <span class="hljs-keyword">as</span> InteractableArea3D
	
    <span class="hljs-comment"># Si le raycast est en collision avec un InteractableArea,</span>
    <span class="hljs-comment"># et que ce composant n'est pas celui que l'on regarde déjà</span>
	<span class="hljs-keyword">if</span> collider <span class="hljs-keyword">and</span> collider != focused_interactable_area:
		focused_interactable_area = collider
		focused_interactable_area.focused = <span class="hljs-keyword">true</span>
    <span class="hljs-comment"># Si le raycast n'est pas en collision avec un InteractableArea,</span>
    <span class="hljs-comment"># et qu'un 'focused_interactable_area' est déjà renseigné, le supprimer</span>
	<span class="hljs-keyword">elif</span> <span class="hljs-keyword">not</span> collider <span class="hljs-keyword">and</span> focused_interactable_area:
		focused_interactable_area.focused = <span class="hljs-keyword">false</span>
		focused_interactable_area = <span class="hljs-keyword">null</span></code></pre>

Enfin, si le joueur appuie sur une certaine touche, on intéragit avec le composant:

#### Script complet

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">extends</span> <span class="hljs-built_in">Area3D</span>


<span class="hljs-keyword">func</span> <span class="hljs-title function_">_physics_process</span>(delta: <span class="hljs-built_in">float</span>) -> <span class="hljs-built_in">void</span>:
    <span class="hljs-keyword">var</span> collider := <span class="hljs-title function_">get_collider</span>() <span class="hljs-keyword">as</span> InteractableArea3D
	
	<span class="hljs-keyword">if</span> collider <span class="hljs-keyword">and</span> collider != focused_interactable_area:
		focused_interactable_area = collider
		focused_interactable_area.focused = <span class="hljs-keyword">true</span>
	<span class="hljs-keyword">elif</span> <span class="hljs-keyword">not</span> collider <span class="hljs-keyword">and</span> focused_interactable_area:
		focused_interactable_area.focused = <span class="hljs-keyword">false</span>
		focused_interactable_area = <span class="hljs-keyword">null</span>


<span class="hljs-keyword">func</span> <span class="hljs-title function_">_physics_process</span>(event: <span class="hljs-built_in">InputEvent</span>) -> <span class="hljs-built_in">void</span>:
	<span class="hljs-keyword">if</span> event.<span class="hljs-title function_">is_action_pressed</span>(<span class="hljs-string">"interact"</span>):
		<span class="hljs-keyword">if</span> focused_interactable_area:
			focused_interactable_area.<span class="hljs-title function_">start_interacting</span>()
	<span class="hljs-keyword">elif</span> event.<span class="hljs-title function_">is_action_released</span>(<span class="hljs-string">"interact"</span>):
		<span class="hljs-keyword">if</span> focused_interactable_area:
			focused_interactable_area.<span class="hljs-title function_">stop_interacting</span>()</code></pre>