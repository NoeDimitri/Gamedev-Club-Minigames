extends RigidBody2D

func _integrate_forces(state):
	var vel = state.get_linear_velocity ()
	state.set_linear_velocity(Vector2 (0, vel.y))
	
func assignColor(playerNum):
	if playerNum == 1:
		$spriteRenderer.modulate=Color("1273DE")
	else:
		$spriteRenderer.modulate=Color("D0021B")

