package com.danhett.scenes;

import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;

class SceneManager extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		trace("SceneManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
}