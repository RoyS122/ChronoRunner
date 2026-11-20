package main
import e"engine"
import "core:fmt"
import rl "vendor:raylib"


main :: proc () {
	gamestate: e.GlobalGameState;
	gamestate.window_size = {1200, 600}

	targetFPS: i32 = 60;

	rl.InitWindow(gamestate.window_size.x, gamestate.window_size.y, "ChronoRun");
    defer rl.CloseWindow();

    rl.SetTargetFPS(targetFPS);

    for !rl.WindowShouldClose() && !gamestate.exitwd {
    gamestate.dt = rl.GetFrameTime()
    rl.BeginDrawing();
    rl.ClearBackground(rl.LIGHTGRAY);
    rl.DrawFPS(10, 10);
    #partial switch( gamestate.state) {
    	case .MainMenu: {
     		 e.MainMenu(&gamestate)
     	};
    	case .Running: {
     		e.GameStep(&gamestate)
     	};
    }


    rl.EndDrawing();
    }
}
