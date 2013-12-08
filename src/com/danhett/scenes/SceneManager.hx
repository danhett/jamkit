package com.danhett.scenes;

import com.danhett.Main;
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
		
		Main.Instance().testFunction();
	}
}