draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_circle(972, 80, 70, false);
draw_set_font(fScore);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text_transformed(975, 50, global.score, 1, 1, 0);