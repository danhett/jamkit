package com.danhett.audio;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;

class AudioManager extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		Debug.log("AudioManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
}