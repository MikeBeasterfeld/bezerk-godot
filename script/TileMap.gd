extends TileMap

func handle_projectile(projectile):
	if not projectile.has("collision"):
		print("Projectile missing collision property")
		return
	print(projectile)
	var body_rid = projectile.collision.get_collider_rid()
	print(body_rid)
	var tile_world_coords = projectile.collision.get_collider().get_coords_for_body_rid(body_rid)
	print(tile_world_coords)
	var tile_source_id = projectile.collision.get_collider().get_cell_source_id(0, tile_world_coords, false)
	print(tile_source_id)
	if projectile.collision.get_collider().get_cell_atlas_coords(0, tile_world_coords, false) != Vector2i(2, 0):
		projectile.collision.get_collider().set_cell(0, tile_world_coords, tile_source_id, Vector2i(7,0))
