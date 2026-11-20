package levels

import e"../engine"

Level :: struct {
	floor: f32,

	player: e.Player,
	ennemies: [dynamic]e.Ennemy,
}
