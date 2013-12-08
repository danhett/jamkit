package com.danhett.game;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import com.danhett.audio.AudioManager;
import com.danhett.events.GameEvent;
import com.danhett.scenes.SceneManager;
import com.danhett.ui.Controls;

class Game extends Sprite 
{	
	private static var DEBUG:Bool = false;
	private var prepStep:Int = 0;
	private var sceneManager:SceneManager;
	private var controls:Controls;
	private var audio:AudioManager;
		
	public function new() 
	{	
		super();
		
		init();
	}
	
	private function init():Void
	{	
		self_reference = this;
		
		updateStep();
	}
	
	private function updateStep(e:GameEvent = null):Void
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
		sceneManager = new SceneManager();
		addChild(sceneManager);
		
		sceneManager.addEventListener(GameEvent.COMPONENT_READY, updateStep);
		sceneManager.addEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		sceneManager.init();		
	}
	
	private function createControls():Void
	{
		controls = new Controls();
		addChild(controls);
		
		controls.addEventListener(GameEvent.COMPONENT_READY, updateStep);
		controls.addEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		controls.init();
	}
	
	private function createAudio():Void
	{
		audio = new AudioManager();
		addChild(audio);
		
		audio.addEventListener(GameEvent.COMPONENT_READY, updateStep);
		audio.addEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		audio.init();
	}
	
	private function start():Void
	{
		sceneManager.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		sceneManager.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		controls.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		controls.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		audio.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		audio.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		
		createGame();
	}
	
	/**
	 * Game entry point - everything's initialised successfully
	 */
	private function createGame():Void
	{
		
	}
	
	/**
	 * Game failure - something screwed up
	 */
	private function haltInit(e:GameEvent):Void
	{
		trace("INITIALISATION FAILED!");
	}
	
	// filthy singleton
	private static var self_reference:Game;
	public static function Instance():Game { return self_reference; }
}