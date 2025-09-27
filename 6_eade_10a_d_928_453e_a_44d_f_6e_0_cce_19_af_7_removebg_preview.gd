extends CharacterBody2D

const SPEED = 200        # سرعة الحركة يمين/شمال
const JUMP_FORCE = -400  # قوة القفز
const GRAVITY = 20       # الجاذبية

func _physics_process(delta):
	# نبدأ بحركة أفقية = 0
	velocity.x = 0

	# الحركة بالأسهم
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED

	# القفز
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	# تطبيق الجاذبية
	velocity.y += GRAVITY * delta

	# التحريك مع التصادم
	move_and_slide()
