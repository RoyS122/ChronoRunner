package engine

import rl"vendor:raylib"
import "core:fmt"
MainMenu :: proc (gs: ^GlobalGameState) {

	rl.DrawText("ChronoRun", gs.window_size.x / 2 - rl.MeasureText("ChronoRun", 40) / 2, 30, 40, rl.WHITE)

	test: rl.Rectangle =  {}

	if rl.GuiButton({f32(gs.window_size.x / 2 - 200 / 2), 120, 200, 40}, "Jouer") {
		gs.state = .Running;
    }
    // if rl.GuiButton({300, 180, 200, 40}, "Options") {
    //         // options
    // }
    if rl.GuiButton({f32(gs.window_size.x / 2 - 200 / 2), 240, 200, 40}, "Quitter") {
    	gs.exitwd = true;
     	fmt.println(gs.dt)
    }
}
