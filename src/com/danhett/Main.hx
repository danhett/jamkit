package com.danhett;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import com.danhett.audio.AudioManager;
import com.danhett.scenes.SceneManager;
import com.danhett.ui.Controls;

class Main extends Sprite 
{	
	private static var DEBUG:Bool = false;
	private var prepStep:Int = 0;
	
	private static var self_reference:Main;
	public static function Instance():Main { return self_reference; }
	
	public function new() 
	{	
		super();
				
		init();
	}
	
	public function testFunction():Void
	{
		trace("works");
	}
	
	private function init():Void
	{
		self_reference = this;
		
		updateStep();
	}
	
	private function updateStep():Void
	{
		switch(++prepStep)
		{
			case 1: createScenes();
			case 2: createControls();
			case 3: createAudio();
			case 4: start();
		}
	}
	
	private function createScenes():Void
	{
		addChild(new SceneManager());
		
		updateStep();
	}
	
	private function createControls():Void
	{
		addChild(new Controls());
		
		updateStep();
	}
	
	private function createAudio():Void
	{
		addChild(new AudioManager());
		
		updateStep();
	}
	
	private function start():Void
	{
		trace("START!");
	}
}