package main

import e "engine"
import m"menus"
import rl "vendor:raylib"

main :: proc() {

	gamestate := e.GlobalGameState{
		window_size = {1200, 600},
		target_fps = 60,
	}

	rl.InitWindow(gamestate.window_size.x, gamestate.window_size.y, "ChronoRun")
	defer rl.CloseWindow()

	rl.SetTargetFPS(gamestate.target_fps)


	gamestate.atlas = make(map[string]e.Atlas);
	gamestate.atlas["player"] = e.InitAtlas("assets/player/spr_player-sheet.png")
	e.AddAnimation(&gamestate.atlas["player"], e.Animation{{0, 0}, {32, 32}, 5, 0.2, true}, "run");





	for !rl.WindowShouldClose() && !gamestate.exitwd {
		gamestate.dt = rl.GetFrameTime()


		#partial switch gamestate.state {
		case .MainMenu:
			m.MainMenuUpdate(&gamestate)
		case .Running:
			e.GameUpdate(&gamestate)
		}


		rl.BeginDrawing()
		rl.ClearBackground(rl.LIGHTGRAY)

		#partial switch gamestate.state {
		case .MainMenu:
			m.MainMenuDraw(&gamestate)
		case .Running:
			e.GameDraw(&gamestate)
		}

		rl.DrawFPS(10, 10)
		rl.EndDrawing()
	}

	for i in gamestate.atlas {
		e.DestroyAtlas(&gamestate.atlas[i]);
	}
}
