package com.danhett.audio;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;
import flash.media.Sound;

class AudioManager extends Sprite 
{
	public var music:Sound;
			
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		Debug.log("AudioManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
	
	public function playSound(soundName:String):Void
	{
		var sound:Sound = Game.Instance().assets.getSound(soundName);
		sound.play();
	}
	
	public function playMusic(musicName:String):Void
	{
		music = Game.Instance().assets.getSound(musicName);
		music.play();
	}
	
	public function pauseMusic(musicName:String):Void
	{
		// todo
	}
	
	public function stopMusic(musicName:String):Void
	{
		// todo
	}
	
	public function toggleMute(isMuted:Bool):Void
	{
		
	}
}