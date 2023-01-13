extends Node2D

export var message_text := ""

onready var message := $Message
onready var message_label := $Message/Message/MarginContainer/Label

func _ready():
	message.hide()
	message_label.text = message_text


func _on_Interactable_interacted():
	message.global_position = global_position
	message.show()


func _on_Interactable_unhightlight():
	message.hide()
