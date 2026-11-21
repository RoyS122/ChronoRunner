package engine

import fmt"core:fmt"

GlobalGameState :: struct {
	exitwd: bool,
	state: enum {
		MainMenu,
		Options,
		Running,
		GameOver
	},
	dt: f32,
	window_size: [2]i32,

	currentlevel: Level,
	atlas: map[string]Atlas,
		target_fps: i32,
}

Save :: proc (gs: ^GlobalGameState) {
	fmt.println("save called")
}
