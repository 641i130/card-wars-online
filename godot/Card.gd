extends Node
class_name Card

var texture
var cid
var cname
var ctype
var landscape
var cost
var atk
var def
var hovered = 0

enum {
	InHand
	InPlay
	InMouse
	FocusInHand
	MoveDrawnCardToHand
	ReOrganizedHand
}
var state = InHand

func _ready():
	"Card class takes ID and sets other values from imported CSV"
	# name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
	get_node("Sprite").set_texture(texture)
	get_node("Sprite").scale = Vector2(0.55, 0.55)
	cname = _c.cardsall[cid][0]
	ctype = _c.cardsall[cid][2]
	landscape = _c.cardsall[cid][3]
	cost = _c.cardsall[cid][4]
	atk = _c.cardsall[cid][5]
	def = _c.cardsall[cid][6]
	print(str(self))

func _physics_process(delta):
	match state:
		InHand:
			pass
		InPlay:
			pass
		InMouse:
			pass
		FocusInHand:
			pass
		MoveDrawnCardToHand: # Animate card from deck to hand
			pass
		ReOrganizedHand:
			pass
		

var can_grab = false
var grabbed_offset = Vector2()

#DRAG AND "DROP" CARDS
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		print("Clicked " + ctype)
		grabbed_offset = get_node("Sprite").position - get_viewport().get_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		if get_node("Sprite").scale != Vector2(0.55, 0.55):
			get_node("Sprite").position = Vector2(0, 0)
			get_node("Sprite").scale = Vector2(0.55, 0.55)
		get_node("Sprite").position = get_viewport().get_mouse_position() + grabbed_offset
	if Input.is_action_just_released("MOUSE_BUTTON"):
		#REMINDER: Check if the card was dropped in a lane, if not then
		get_node("Sprite").position = Vector2(0, 0)
	else:
		return
#################

func _on_Area2D_mouse_entered():
	"Scale and stack card onto top of other cards"
	print("Entered card!")
	#"HOVER"
	get_node("Sprite").position = Vector2(0, -100)
	get_node("Sprite").scale = Vector2(0.70, 0.70)

func _on_Area2D_mouse_exited():
	"Un-scale and un-stack card"
	print("Left card!")
	#NORMAL SIZE
	get_node("Sprite").position = Vector2(0, 0)
	get_node("Sprite").scale = Vector2(0.55, 0.55)

func _to_string():
	print("Name: ",self.cname)
	print("Card: ",self.ctype)
	print("Landscape: ",self.landscape)
	print("Cost: ",self.cost)
	if ctype != "Spell":
		print("Attack: ",self.atk)
		print("Defense: ",self.def)

