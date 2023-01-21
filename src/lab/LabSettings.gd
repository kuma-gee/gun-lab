extends Node2D

signal start()

onready var control := $Control


func _ready():
	control.hide()


func _on_Interactable_interacted(_actor):
	control.visible = !control.visible


func _on_Interactable_unhightlight():
	control.hide()


func _on_Start_pressed():
	emit_signal("start")
	control.hide()
