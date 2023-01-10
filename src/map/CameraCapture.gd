extends Area2D

var logger = Logger.new("CameraCapture")

func _on_CameraCapture_body_entered(body):
	body.camera_point = self
	logger.info("Player entered camera capture: %s" % self)
	
