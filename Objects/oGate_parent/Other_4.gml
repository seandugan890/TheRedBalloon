/// @description Insert description here

event_inherited();

//get the id of the collision layer
//lay_id = layer_get_id("Collision");
xx = tilemap_get_cell_x_at_pixel(tilemap, x, y);
yy = tilemap_get_cell_y_at_pixel(tilemap, x, y);
xx2 = tilemap_get_cell_x_at_pixel(tilemap, x, y+TILE_SIZE);
yy2 = tilemap_get_cell_y_at_pixel(tilemap, x, y+TILE_SIZE);

closed = 0;
