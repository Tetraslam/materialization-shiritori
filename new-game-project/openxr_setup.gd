extends Node3D

func _ready():
	var xr_interface = XRServer.find_interface("OpenXR")

	if xr_interface and xr_interface.is_initialized():
		print("✅ OpenXR initialized successfully!")

		# 🚀 Enable XR rendering
		get_viewport().use_xr = true  # THIS FIXES YOUR ERROR

		# 🚀 Enable head tracking (Handled automatically by XRCamera3D)
		print("✅ XR setup complete!")

		# Verify if tracking is working
		if get_viewport().use_xr:
			print("✅ XR rendering is active!")
		else:
			print("❌ XR rendering is NOT active!")
	else:
		print("❌ Failed to initialize OpenXR.")
