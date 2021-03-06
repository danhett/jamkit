package com.danhett.assets;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.media.Sound;

@:bitmap("assets/intro.png") class IntroImage extends BitmapData {}
@:bitmap("assets/game.png") class GameImage extends BitmapData {}
@:bitmap("assets/end.png") class EndImage extends BitmapData {}
	
@:sound("assets/powerup.mp3") class PowerUp extends Sound {}

class AssetManager extends Sprite 
{		
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
        Debug.log("AssetManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}

    public function getBitmap(name:String):Bitmap
    {
        var classReference = Type.resolveClass("com.danhett.assets." + name);
        var instance = Type.createInstance(classReference, []);
        var bitmap:Bitmap = new Bitmap( instance );

        return bitmap;
    }

	public function getSound(name:String):Sound
    {
        var classReference = Type.resolveClass("com.danhett.assets." + name);
        var sound:Sound = Type.createInstance(classReference, []);

        return sound;
    }
}