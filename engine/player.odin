package engine

import rl"vendor:raylib"
import "core:fmt"

Player :: struct {
	atlas: ^Atlas,
	anim_state: AnimState,

	position: [2]f32,
	velocity: [2]f32,
};

PlayerInit :: proc(a: ^Atlas) -> (p: Player){
	p.atlas = a;
	p.anim_state.name = "run";

	return
};

PlayerUpdate:: proc(gs: ^GlobalGameState, p: ^Player) {

	dirx: i8 = (rl.IsKeyDown(.D) ? 1 : 0) - (rl.IsKeyDown(.A) ? 1 : 0);

	p.position.x += f32(dirx) * f32(5);

};

PlayerDraw :: proc(gs: ^GlobalGameState, p: ^Player) {
	anim: Animation = p.atlas.anims[p.anim_state.name]

	rl.DrawTextureRec(
	p.atlas.texture,
	{
		anim.start_pos.x + f32(p.anim_state.frame) * anim.frame_size.x,
		anim.start_pos.y,
		anim.frame_size.x,
		anim.frame_size.y
	},
	p.position,
	rl.WHITE
	)

	p.anim_state.timer += gs.dt;
	if (p.anim_state.timer >= anim.frame_duration) {
		p.anim_state.frame = (p.anim_state.frame + 1) % anim.frame_count;
		p.anim_state.timer -= anim.frame_duration;
	}
};
