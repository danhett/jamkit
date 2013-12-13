package com.danhett.ui;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.DisplayObject;
import flash.events.KeyboardEvent;
import flash.display.Sprite;

class ControlManager extends Sprite 
{
	public var stageRef:DisplayObject;
	
	public var LEFT:Bool;
	public var RIGHT:Bool;
	public var UP:Bool;
	public var DOWN:Bool;
	public var SHIFT:Bool;
	public var ALT:Bool;
			
	public function new(_stage:DisplayObject) 
	{	
		super();
		
		stageRef = _stage;		
	}
	
	public function init():Void
	{
		stageRef.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stageRef.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		Debug.log("ControlManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
	
	private function onKeyDown(e:KeyboardEvent):Void
	{
		Debug.log("Pressed " + e.keyCode);
	}
	
	private function onKeyUp(e:KeyboardEvent):Void
	{
		Debug.log("Released " + e.keyCode);
	}
}