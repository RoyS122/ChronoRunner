package engine

import rl"vendor:raylib"

MainMenuDraw :: proc (gs: ^GlobalGameState) {
	rl.DrawText("ChronoRun", 300, 30, 40, rl.WHITE)

	if rl.GuiButton({300, 120, 200, 40}, "Jouer") {
		gs.state = .Running;
    }
    // if rl.GuiButton({300, 180, 200, 40}, "Options") {
    //         // options
    // }
    if rl.GuiButton({300, 240, 200, 40}, "Quitter") {
    	gs.exitwd = true;
    }
}
