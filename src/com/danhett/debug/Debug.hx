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
		trace(msg);
	}
	
	public static function warn(msg:String):Void
	{
		trace("WARNING! " + msg);
	}
}