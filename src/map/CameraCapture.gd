extends Area2D

onready var remote_transform := $RemoteTransform2D

func _on_CameraCapture_body_entered(body):
	remote_transform.remote_path = remote_transform.get_path_to(body.camera)
