package main
import e"engine"
import "core:fmt"
import rl "vendor:raylib"


main :: proc () {
	gamestate: e.GlobalGameState;

	targetFPS: i32 = 60;

	rl.InitWindow(1200, 600, "test raylib");
    defer rl.CloseWindow();

    rl.SetTargetFPS(targetFPS);

    for !rl.WindowShouldClose() && !gamestate.exitwd {
    rl.BeginDrawing();
    rl.ClearBackground(rl.LIGHTGRAY);
    rl.DrawFPS(10, 10);
    #partial switch( gamestate.state) {
    	case .MainMenu: {
     		 e.MainMenuDraw(&gamestate)
     	};
    	case .Running: {
     		e.GameStep()
     	};
    }


    rl.EndDrawing();
    }
}
