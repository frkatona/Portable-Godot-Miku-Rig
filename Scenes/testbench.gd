extends Node3D

@onready var char : Node3D = $Miku_yellow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity_scalar = 1e-3 # 1e-3 = gentle
	var x_pos : float = sin(Time.get_ticks_msec()/100)*velocity_scalar
	var z_pos : float = cos(Time.get_ticks_msec()/100)*velocity_scalar
	char.global_translate(Vector3(x_pos, 0, z_pos))
	print(x_pos)
