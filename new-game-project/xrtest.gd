extends Node

func _ready():
	var xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("✅ OpenXR initialized successfully!")
	else:
		print("❌ OpenXR failed to initialize.")
