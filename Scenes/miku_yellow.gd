extends Node3D

@onready var anim_yellow : AnimationPlayer = $yellow_defonly/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_yellow.play("run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
