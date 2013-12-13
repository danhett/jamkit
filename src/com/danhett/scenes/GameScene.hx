package com.danhett.scenes;

import flash.text.TextField;
import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import com.danhett.visuals.ParticleBurst;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;

class GameScene extends Scene 
{			
	public function new() 
	{	
		super();

        init();
	}

    private function init():Void
    {
        var bitmap:Bitmap = Game.Instance().assets.getBitmap("GameImage");
        bitmap.x = 400;
        bitmap.y = 200;

        var btn:Sprite = new Sprite();
        btn.buttonMode = true;
        btn.addEventListener(MouseEvent.CLICK, doNext);

        var burst:ParticleBurst = new ParticleBurst();
        burst.x = 300;
        burst.y = 300;
        burst.addEventListener(GameEvent.PARTICLES_FINISHED, kill);
        addChild(burst);

        addChild(btn);
        btn.addChild(bitmap);
    }

    private function kill(e:GameEvent):Void
    {
        trace("yeah!");
    }

    private function doNext(e:MouseEvent):Void
    {
        Game.Instance().sceneManager.changeScene("end");
    }

	override public function destroy():Void
	{
		// remove stuff here when the scene is changed
	}
}