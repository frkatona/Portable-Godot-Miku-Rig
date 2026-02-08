extends Node3D

@onready var char_yellow : Node3D = $Miku_yellow
@onready var char_blue : Node3D = $Miku_blue
@onready var char_pink : Node3D = $Miku_pink

@onready var velocity_scalar : float = 3e-2
@onready var circles_frequency_scalar : float = 1e-5
@onready var bluetearstone : bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var chaos : float = (sin(Time.get_ticks_msec() * 1e-3) - (1e-3 / 2)) * 1e-3
	velocity_scalar += chaos
	circles_frequency_scalar += chaos
	var x_pos : float = sin(Time.get_ticks_msec() * circles_frequency_scalar) * velocity_scalar
	var z_pos : float = cos(Time.get_ticks_msec() * circles_frequency_scalar) * velocity_scalar
	
	char_yellow.global_translate(Vector3(x_pos*-.1, 0, z_pos*.1))
	char_blue.global_translate(Vector3(x_pos*.1, 0, z_pos*-.2))
	char_pink.global_translate(Vector3(x_pos*.2, 0, z_pos*.1))
	
