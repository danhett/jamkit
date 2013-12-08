package com.danhett.scenes;

import com.danhett.game.Game;
import flash.display.Sprite;

class SceneManager extends Sprite 
{		
	public function new() 
	{	
		super();
		
		init();
	}
	
	private function init():Void
	{
		trace("scene manager added!");
		
		Game.Instance().testFunction();
	}
}