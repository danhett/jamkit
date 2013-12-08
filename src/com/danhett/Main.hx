package com.danhett;

import com.danhett.game.Game;
import flash.display.Sprite;

class Main extends Sprite 
{	
	public function new() 
	{	
		super();
				
		init();
	}
	
	private function init():Void
	{
		addChild(new Game());
	}
}