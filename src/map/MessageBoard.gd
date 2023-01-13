extends Node2D

onready var message := $Message

func _ready():
	message.hide()


func _on_Interactable_interacted():
	message.global_position = global_position
	message.show()


func _on_Interactable_unhightlight():
	message.hide()
