extends Area2D

signal captured()

var logger = Logger.new("CameraCapture")

func _on_CameraCapture_body_entered(body):
	body.camera_point = self
	emit_signal("captured")
	logger.debug("Player entered camera capture: %s" % self)
	
