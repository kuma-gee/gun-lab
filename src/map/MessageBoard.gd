extends Node2D

signal message_opened()

export var message_text := ""

onready var message := $Message
onready var message_label := $Message/Message/MarginContainer/Label

func _ready():
	message.hide()
	message_label.text = message_text


func _on_Interactable_interacted():
	message.global_position = global_position
	message.show()
	emit_signal("message_opened")


func _on_Interactable_unhightlight():
	message.hide()
