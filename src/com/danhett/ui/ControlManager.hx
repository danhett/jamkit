package com.danhett.ui;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;

class ControlManager extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		Debug.log("ControlManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
}