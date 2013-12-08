package com.danhett.ui;

import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;

class Controls extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		trace("Controls ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
}