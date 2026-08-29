draw_sprite_tiled(sprite_index, image_index, 0, 0); // Draw the battle background

var _ellipse_corner_x1 = BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y1 = BATTLE_ENEMY_Y;
var _ellipse_corner_x2 = RES.WIDTH - BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y2 = BATTLE_PARTYLEADER_Y;

var _ellipse_center_x = (_ellipse_corner_x2 + _ellipse_corner_x1) / 2;
var _ellipse_center_y = (_ellipse_corner_y2 + _ellipse_corner_y1) / 2;


draw_set_circle_precision(64)

draw_set_color(c_dkgrey);
draw_ellipse(CAM_X + _ellipse_corner_x1, CAM_Y + _ellipse_corner_y1 + 20, CAM_X + _ellipse_corner_x2, CAM_Y + _ellipse_corner_y2 + 20, false);
draw_rectangle(CAM_X + _ellipse_corner_x1 + 1, CAM_Y + _ellipse_center_y, CAM_X + _ellipse_corner_x2, CAM_Y + _ellipse_center_y + 20, false)
draw_set_color(c_grey);
draw_ellipse(CAM_X + _ellipse_corner_x1, CAM_Y + _ellipse_corner_y1, CAM_X + _ellipse_corner_x2, CAM_Y + _ellipse_corner_y2, false);

