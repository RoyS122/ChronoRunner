package engine

GameUpdate :: proc (gs: ^GlobalGameState) {
	PlayerUpdate(gs, &gs.currentlevel.player);
};


GameDraw :: proc (gs: ^GlobalGameState) {
	PlayerDraw(gs, &gs.currentlevel.player);
};
