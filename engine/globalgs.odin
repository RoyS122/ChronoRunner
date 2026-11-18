package engine

import fmt"core:fmt"

GlobalGameState :: struct {
	exitwd: bool,
	state: enum {
		MainMenu,
		Options,
		Running,
		GameOver
	}
}

Save :: proc (gs: ^GlobalGameState) {
	fmt.println("save called")
}
