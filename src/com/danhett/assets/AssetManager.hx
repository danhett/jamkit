package com.danhett.assets;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;

class AssetManager extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		Debug.log("AssetManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
}