var xCam = clamp(oPlayer.x - wCam / 2, 0, room_width - wCam);
var yCam = clamp(oPlayer.y - hCam / 2, 0, room_height - hCam);

var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

var newX = lerp(curX, xCam, 0.03);
var newY = lerp(curY, yCam, 0.03);

camera_set_view_pos(view_camera[0], newX, newY);

layer_x(layer_get_id("Background"), newX * 0.65);
layer_y(layer_get_id("Background"), newY * 0.65);