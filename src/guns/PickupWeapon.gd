extends Interactable

export var weapon_scene: PackedScene
onready var audio := $AudioStreamPlayer

func interact(actor: Player):
	hide()
	
	actor.pickup_weapon(weapon_scene)
	audio.play()


func _on_AudioStreamPlayer_finished():
	queue_free()
