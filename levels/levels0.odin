package levels

import e"../engine"

InitLevel0 :: proc (gs: ^e.GlobalGameState) -> (l: e.Level) {

	l.player = e.PlayerInit(&gs.atlas["player"])
	l.player.position = {f32(gs.window_size.x / 2), f32(gs.window_size.y / 2)}
	return
}
