package engine

import rl"vendor:raylib"

Atlas :: struct {
	texture: rl.Texture2D,
	anims: map[string]Animation,
}

Animation :: struct {
	start_pos:      [2]f32,
	frame_size:     [2]f32,
	frame_count:    int,
	frame_duration: f32,
	loop:           bool,
}

AnimState :: struct {
	name: string,
	timer: f32,
	frame: int,
}

InitAtlas :: proc (text_path: cstring) -> (a: Atlas) {
	a.texture = rl.LoadTexture(text_path)
	a.anims = make(map[string]Animation)
	return
}

DestroyAtlas :: proc(atlas: ^Atlas) {
	rl.UnloadTexture(atlas.texture)
	delete(atlas.anims)
}

AddAnimation :: proc (atlas: ^Atlas, anim: Animation, name: string) {
	atlas.anims[name] = anim;
}
