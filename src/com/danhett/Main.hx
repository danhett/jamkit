package com.danhett;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;

@:bitmap("assets/test.png") class Image extends BitmapData {}

class Main extends Sprite 
{	
	inline private static var DEBUG = false;
	
	public function new() 
	{	
		super();
		
		init();
	}
	
	private function init():Void
	{
		var bitmap = new Bitmap (new Image (0, 0));
		addChild(bitmap);
	}
	
	private var prepStep:Int = 1;
	private function updateStep():Void
	{
		// TODO: step through each setup phase and fire a completion event once the framework is fully initialised
		
		/* 
		createScenes();
		
		createControls();
		
		createAudio();
		*/
	}
	
	private function createScenes():Void
	{
		// TODO: scene manager should go here, allowing quick state switching
	}
	
	private function createControls():Void
	{
		// TODO: key/pad listeners
	}
	
	private function createAudio():Void
	{
		// TODO: standard audio manager
	}
	
	private function frameworkReady():Void
	{
		// game entry point
	}
}