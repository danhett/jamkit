package com.danhett.scenes;

import com.danhett.debug.Debug;
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
		Debug.log("SceneManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
	
	public function changeScene(scene:String):Void
	{
		Debug.log("Switching scene to " + scene);
		
		/*
		switch(scene)
		{
			case "intro": 
				trace("switching to intro scene");
				
			case "game":
				trace("switching to game");
				
			case "ending":
				trace("ending");
		}
		*/
	}
}