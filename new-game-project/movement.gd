extends XROrigin3D

@export var move_speed := 2.0  # Movement speed
@export var turn_speed := 2.0  # Rotation speed
@export var deadzone := 0.1    # Ignore small joystick movements

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


func _process(delta):
	var left_hand = $LeftHand
	var right_hand = $RightHand

	# 🎮 Get joystick input (left hand for movement)
	var move_x = left_hand.get_float("joystick_x")  # Left/Right movement
	var move_z = left_hand.get_float("joystick_y")  # Forward/Backward movement

	# Apply deadzone filter
	if abs(move_x) < deadzone:
		move_x = 0
	if abs(move_z) < deadzone:
		move_z = 0

	# Calculate movement direction
	var direction = -global_transform.basis.z * move_z + global_transform.basis.x * move_x
	global_translate(direction * move_speed * delta)

	# 🔄 Smooth turning with right joystick
	var turn_x = right_hand.get_float("joystick_x")  # Right joystick for rotation

	if abs(turn_x) > deadzone:  # Apply deadzone
		rotate_y(turn_x * turn_speed * delta)
