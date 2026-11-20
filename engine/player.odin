package engine

import rl"vendor:raylib"

Player :: struct {
	atlas: Atlas,
	anim_state: AnimState,

	position: [2]f32,
	velocity: [2]f32,
};
