/// @description Insert description here

//get the tilemap coordinates we are on
xx = tilemap_get_cell_x_at_pixel(tilemap, x, y);
yy = tilemap_get_cell_y_at_pixel(tilemap, x, y);
xx2 = tilemap_get_cell_x_at_pixel(tilemap, x+TILE_SIZE, y);
yy2 = tilemap_get_cell_y_at_pixel(tilemap, x+TILE_SIZE, y);

closed = 0;
