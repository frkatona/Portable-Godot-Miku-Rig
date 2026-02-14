# Miku Models Universal Rig Testbench

![hero shot](Exports/godot_hero-shot.png)

### Includes
 - re-textured, re-topologized, re-rigged models (originals from https://open3dlab.com/project/4b49c53a-946a-4a7a-97fa-2859720448d2/ by Camad — Beerware license)

 - Godot (4.6 stable) project with test scenes, spring bones, and code to test the hair bounciness

 - Blender (5.0.1) project with UV maps, textures, rigs, and animations

### Godot

![godot screenshot](Exports/godot_screenshot_1.png)

### Blender

![blender screenshot](Exports/blender_screenshot_1.png)

# Process

### Get the files from Blender to Godot

1. Blender: export animated rig (just select the rig) with animations to a glb

(only deform bones, maybe remove the 'Skinning', idk yet)
![blender export settings](Exports/blender_export-settings.png)

2. Godot: drag in the animated rig glb and change its re-import settings from "Scene" to "Animation Library" (and re-import)

3. Blender: select the mesh and rig together and export—but animations *unchecked* this time—as glb 

4. Godot: import the mesh glb from #3, drag it into a new scene, and check "editable children" 

### Load Animation Library

5. add a new animation player as a direct child of the rig node (the node between the "skeleton" node and the node with the same name as the glb file)

6. in the animation player's inspector panel, change the root node to the node with the same name as the glb file (e.g. for this commit, "pink_no-anim")

7. with that animation player, select the animation button (within the animation window from the animation tab at the bottom of the editor) and click 'manage animations'

8. click "load library" and select the .glb file that was converted to an animation library in step #2 (check animations are working)

### Bouncy Hair

9. add a SpringBoneSimulator3D node to the scene (direct child of the Skeleton3D)

10. selected the hair start and stop bones unique to that model (bones in the universal rig named with the related model's hair color)

11. further imported rigged models can continue to use the existing animation player 

![godot node structure](Exports/godot_node-structure.png)

Currently only includes the static A-posed 'basis' animation and a 'run' animation

I also played around with alternative strategies of extracting animations from the animated model imports and re-targetting, but this seems maybe sliiiightly more reliable

### To-do
 - [ ] try applying the animations to a differently-proportioned teddybear model
 - [ ] use separate armature for stopgap teddybear enemy animaitons
 - [ ] fix mesh deformation inconsistencies (pupils, mouths, eyebrows, over-all straps, pants, fingers) 