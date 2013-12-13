package com.danhett.game;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import com.danhett.assets.AssetManager;
import com.danhett.audio.AudioManager;
import com.danhett.debug.Debug;
import com.danhett.events.GameEvent;
import com.danhett.scenes.SceneManager;
import com.danhett.ui.ControlManager;
import openfl.Assets;

class Game extends Sprite 
{	
	public var DEBUG:Bool = true;
	
	private var prepStep:Int = 0;
	public var sceneManager:SceneManager;
	public var controls:ControlManager;
	public var audio:AudioManager;
	public var assets:AssetManager;
	public var stageRef:DisplayObject;
		
	public function new(_stage:DisplayObject) 
	{	
		super();
		
		stageRef = _stage;
		
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
			case 4: createAssets();
			case 5: start();
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
		controls = new ControlManager(stageRef); 
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
	
	private function createAssets():Void
	{
		assets = new AssetManager();
		addChild(assets);
		
		assets.addEventListener(GameEvent.COMPONENT_READY, updateStep);
		assets.addEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		assets.init();
	}
	
	private function start():Void
	{
		sceneManager.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		sceneManager.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		controls.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		controls.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		audio.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		audio.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		assets.removeEventListener(GameEvent.COMPONENT_READY, updateStep);
		assets.removeEventListener(GameEvent.COMPONENT_FAILED, haltInit);
		
		createGame();
	}
	
	/**
	 * Game entry point - everything's initialised successfully
	 */
	private function createGame():Void
	{
		Debug.log("Framework ready! Let's do it.");
				
		sceneManager.changeScene("intro");
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