package com.danhett.events;

import flash.events.Event;

class GameEvent extends Event 
{
	public static var COMPONENT_READY:String 	= "component_ready";
	public static var COMPONENT_FAILED:String 	= "component_failed";
	public static var GAME_READY:String 		= "game_ready";
    public static var PARTICLES_FINISHED:String = "particles_finished";
			
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false)
	{	
		super(type, bubbles, cancelable);
	}
}