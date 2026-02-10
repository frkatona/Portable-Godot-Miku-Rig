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

# Current Troubleshooting

From Godot's retargeting documentation ([link](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/retargeting_3d_skeletons.html)):
>Godot has Position/Rotation/Scale 3D tracks (which this document calls "Transform" tracks) with Nodepaths to bones for Skeleton bone animation. This means you can't share animations between multiple Skeletons just by using the same bone names.


## Process

1. export glb of animated model with the universal rig (using 'deform bones only' lately)
![blender export settings](Exports/blender_export-settings.png)
2. import into godot
3. duplicate it
4. change one's 'import' tab settings (after importing, next to the 'scene' tab) for the glb from 'scene' to 'animation library'
5. drag the other into a new scene
6. delete the existing 'animation player' (requires both 'editable children' and 'make local')
7. add a new animation player to the same spot (direct child of the base glb (not the Node3d))
8. with that animation player, select the animation button (within the animation window from the animation tab at the bottom of the editor) and click 'manage animations'
9. click "load library" and select the .glb file that was converted to an animation library in step #4 (check animations are working)
10. add a SpringBoneSimulator3D node to the scene (direct child of the Skeleton3D)
11. selected the hair start and stop bones unique to that model (bones in the universal rig named with the related model's hair color)
12. further imported rigged models can continue to use the existing animation player (THOUGH I'm currently figuring out if the name of the rig or something is preventing the model from recognizing the animations)

![godot node structure](Exports/godot_node-structure.png)

Currently only includes the static A-posed 'basis' animation and a 'run' animation

I also played around with alternative strategies of extracting animations from the animated model imports and re-targetting, but this seems maybe sliiiightly more reliable
 - still keep getting a warning like this one sometimes: "AnimationMixer (at: Miku_Yellow_AnimationLibrary.tscn): 'miku_animations/run_003', couldn't resolve track:  'rig_003/Skeleton3D:DEF-f_pinky.01.R'."
- even when an animation library is working correctly, it seems to return the warning:
    - `AnimationMixer (at: Miku_Yellow_AnimationLibrary.tscn): 'miku_animations/run_003', couldn't resolve track:  'Skeleton3D:DEF-f_pinky.01.R'. This warning can be disabled in Project Settings.`
    - are they all about the left pinky phalanges or is that just the message header?
    - it's the header — there are like 14k warning messages
- other than the warnings, there are 25 identical error messages:
    - `ERROR: scene/animation/animation_mixer.cpp:286 - Condition "p_animation_library.is_null()" is true. Returning: StringName()`

bug fixing to-do
- [x]  "import as skeleton"
- [ ] making skeleton names identical in Blender (can I even do this?  I guess I could rename the original and just swap that name around...and I would only need to do it once each time I export a new mesh)
- [ ] how can I check the animations are imported correctly separate from their model?  the armature doesn't seem to move in the import settings

also see
- Godot Docs - asset export conventions ([link](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_3d_scenes/model_export_considerations.html#d-asset-direction-conventions))