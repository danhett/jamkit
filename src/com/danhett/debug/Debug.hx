package com.danhett.debug;

import com.danhett.game.Game;
import flash.display.Sprite;

class Debug extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public static function log(msg:String):Void
	{
		if(Game.Instance().DEBUG)
			trace(msg);
	}
	
	public static function warn(msg:String):Void
	{
		if(Game.Instance().DEBUG)
			trace("WARNING! " + msg);
	}
}