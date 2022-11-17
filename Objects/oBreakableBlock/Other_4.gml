/// @description Insert description here

xx = tilemap_get_cell_x_at_pixel(tilemap, x, y);
yy = tilemap_get_cell_y_at_pixel(tilemap, x, y);

tilemap_set(tilemap, 1, xx, yy);

image_index = irandom(image_number-1);
image_speed = 0;