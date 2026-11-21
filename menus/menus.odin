package menus

import rl"vendor:raylib"
import "core:fmt"
import e"../engine"
import l"../levels"


MainMenuUpdate :: proc (gs: ^e.GlobalGameState) {


}


MainMenuDraw :: proc (gs: ^e.GlobalGameState) {

	rl.DrawText("ChronoRun", gs.window_size.x / 2 - rl.MeasureText("ChronoRun", 40) / 2, 30, 40, rl.WHITE)



	if rl.GuiButton({f32(gs.window_size.x / 2 - 200 / 2), 120, 200, 40}, "Jouer") {
		gs.currentlevel = l.InitLevel0(gs);
		gs.state = .Running;
    }

    if rl.GuiButton({f32(gs.window_size.x / 2 - 200 / 2), 240, 200, 40}, "Quitter") {
    	gs.exitwd = true;
     	fmt.println(gs.dt)
    }
}
