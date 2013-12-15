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

@:bitmap("assets/tiles/tile_blue.png") class TileBlue extends BitmapData {}
@:bitmap("assets/tiles/tile_green.png") class TileGreen extends BitmapData {}
@:bitmap("assets/tiles/tile_lightblue.png") class TileLightBlue extends BitmapData {}
@:bitmap("assets/tiles/tile_pink.png") class TilePink extends BitmapData {}
@:bitmap("assets/tiles/tile_purple.png") class TilePurple extends BitmapData {}
@:bitmap("assets/tiles/tile_red.png") class TileRed extends BitmapData {}
@:bitmap("assets/tiles/tile_yellow.png") class TileYellow extends BitmapData {}

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