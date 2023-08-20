//step event
switch state {
case player_states.idle:
/*
Your code for movement, animation
and everything else while the player is
not attacking/defending
*/
//CALCULATE MOVEMENT

//GET PLAYER INPUT
key_left = keyboard_check("left");
key_right = keyboard_check("right");
key_jump = keyboard_check_pressed("jump");

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,spr_player)) && (key_jump)
{
    vsp = -18;
}

//HORIZONTAL COLLISION
if (place_meeting(x+hsp,y,spr_player))
{
    while (!place_meeting(x+sign(hsp),y,spr_player))
    {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

//Vertical COLLISION
if (place_meeting(x,y+vsp,spr_player))
{
    while (!place_meeting(x,y+sign(vsp),spr_player))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,spr_player))
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
if (hsp != 0) image_xscale = sign(hsp);

///melee attack
if keyboard_check_pressed("action") {
state = player_states.attack
//animate
image_speed = 1;
sprite_index = spr_hit1;
}

//block
if keyboard_check_pressed("gimmick") {
state = player_states.defend
image_speed = 0;
sprite_index = spr_block;
}
break;

//Hitbox
    case player_states.attack:
    if image_index > image_number - 1 {
    state = player_states.idle
    }
    if (image_index >= 1) && (image_index <= 3)
    {
        with(instance_create_depth(x,y,0,oHitbox))
        {
            image_xscale = other.image_xscale;
            with(instance_place(x,y,oPlayer2))
            {
                if (hit == 0)
                {
                    hit = 1;
                    vsp = -3;
                    hsp = sign(x - other.x) * 4;
                    image_xscale = sign(hsp);
                }
            }
        }
    }

//Block
    case player_states.defend:
    if keyboard_check_pressed("gimmick")
    {
        if (block)
        {
            sprite_index = spr_block;
            block = true;
        }
        else
        {
            block = false;
            sprite_index = spr_player;
            state = player_states.idle;
        }
    }
}