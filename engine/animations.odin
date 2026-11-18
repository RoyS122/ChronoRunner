package engine

import rl"vendor:raylib"

Atlas :: struct {
	texture: ^rl.Texture2D,
	anims: map[string]Animation,
}


Animation :: struct {
	startpos: [2]f32,
	imagesize: [2]f32,
};
