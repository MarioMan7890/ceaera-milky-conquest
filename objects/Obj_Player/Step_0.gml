keyRight = keyboard_check(vk_right)
keyLeft = keyboard_check(vk_left) 
keyJump = keyboard_check_pressed(vk_space)
keyBoost = keyboard_check_pressed(vk_shift)
//Walk and Fall Torture
hsp = (keyRight-keyLeft) * Walk_Speed
vsp = vsp + (Weight)
//Jump Input
if (Grounded-- > 0) && keyJump
{vsp += JumpHeight
	Grounded = 0}
//Actually move (and collide)
if place_meeting(x+hsp,y,Obj_solid)
{while abs(hsp) >0.1
	{hsp *= 0.5
		if (!place_meeting(x+hsp,y,Obj_solid)) {x+=hsp} 
		else {hsp = 0} }
}
x+=hsp
	if place_meeting(x,y+vsp,Obj_solid)
{if vsp > 0 {Grounded = 10}
	while abs(vsp) >0.1
	{hsp *= 0.5
		if (!place_meeting(x,y+vsp,Obj_solid)) {x+=vsp} 
		else {vsp = 0} }
}
y += vsp