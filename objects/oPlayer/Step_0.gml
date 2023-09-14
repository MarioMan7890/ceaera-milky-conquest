//step event
//GET PLAYER INPUT
key_left = input_check("left");
key_right = input_check("right");
key_jump = input_check_pressed("action");
jump_key_hold = input_check_long_pressed("action")
key_run = input_check("special")

var move = key_right - key_left;

if key_run 
{hsp = move * runsp}
else
{hsp = move * walksp;}

vsp = vsp + grv;

//JUMPING
if key_jump && jump_count < jump_max{
	jump_count++;
	jump_timer = jump_hold_frames;
	
	if !jump_key_hold {jump_timer = 0;};
	
	if jump_timer > 0{
		vsp = jumpspeed;
		jump_timer--;
	}
 }
 
if (place_meeting(x,y+1,oWall)) && (key_jump)
{
    vsp = -12;
	jump_count = 0;
}else{
	if jump_count == 0{
		jump_count = 1;
	}

//HORIZONTAL COLLISION
if (place_meeting(x+hsp,y,oWall))
{
    while (!place_meeting(x+sign(hsp),y,oWall))
    {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

//Vertical COLLISION
if (place_meeting(x,y+vsp,oWall))
{
    while (!place_meeting(x,y+sign(vsp),oWall))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,oWall))
{
    sprite_index = spr_Jump;
    image_speed = 0;
    if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
    image_speed = 1;
    if (hsp == 0)
    {
        sprite_index = spr_player;
    }
    else
    {
        sprite_index = spr_Right;
    }
}
if (hsp != 0) playerScale = sign(hsp)}