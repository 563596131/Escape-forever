tool
class_name BaseControl
extends Control

signal result_data(value)

signal on_click(node)
signal on_long_click(node)
var 	clickTime = 0
var 	clickPosition = Vector2.ZERO
var itemRoot : BaseControl = null
export var styleBox : StyleBox = null setget set_styleBox
export var enter_anim :  Animation = null
export var exit_anim :  Animation = null

export var on_click_anim :  Animation = null
var baseAnimationPlayer : AnimationPlayer = null
func _ready():
	init_anim()
	playEnter()


func init_anim():	
	if enter_anim == null and exit_anim == null :
		return
	baseAnimationPlayer = AnimationPlayer.new();
	if enter_anim != null :
		baseAnimationPlayer.add_animation("enter",enter_anim)
	if exit_anim != null :
		baseAnimationPlayer.add_animation("exit",exit_anim)
	if on_click_anim != null:
		baseAnimationPlayer.add_animation("on_click_anim",on_click_anim)
	add_child(baseAnimationPlayer)

func playEnter()-> AnimationPlayer:
	if enter_anim != null and baseAnimationPlayer != null :
		baseAnimationPlayer.play("enter")
	return baseAnimationPlayer

		
func playExit()-> AnimationPlayer:
	if exit_anim != null and baseAnimationPlayer != null :
		baseAnimationPlayer.play("exit")
	return baseAnimationPlayer
		

func set_styleBox(value) :
	styleBox = value
	update()
	
func _gui_input(event):
	if event is InputEventScreenTouch :
		if event.pressed == true:
			clickTime = Time.get_ticks_msec()
			clickPosition = event.position
		if event.pressed == false:
			var diff = Time.get_ticks_msec() - clickTime
			clickTime = 0
			if event.position.distance_to(clickPosition)<2 :
				if mouse_filter == Control.MOUSE_FILTER_STOP :
					accept_event()
				if diff < 800:
					emit_signal("on_click",self)
					if on_click_anim != null and baseAnimationPlayer != null :
						baseAnimationPlayer.play("on_click_anim")
					click()
				else :
					emit_signal("on_long_click",self)
					long_click()
				
func click():
	pass
func long_click():
	pass

func _draw():
	if styleBox !=null :
		draw_style_box(styleBox, Rect2(Vector2(0,0) ,  rect_size ))


