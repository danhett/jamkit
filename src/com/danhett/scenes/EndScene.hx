package com.danhett.scenes;

import flash.text.TextField;
import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;

@:bitmap("assets/end.png") class EndImage extends BitmapData {}

class EndScene extends Scene 
{			
	public function new() 
	{	
		super();

        init();
	}

    private function init():Void
    {
        var bitmap:Bitmap = new Bitmap (new EndImage (0, 0));
        bitmap.x = 400;
        bitmap.y = 200;

        var btn:Sprite = new Sprite();
        btn.buttonMode = true;
        btn.addEventListener(MouseEvent.CLICK, doNext);

        addChild(btn);
        btn.addChild(bitmap);
    }

    private function doNext(e:MouseEvent):Void
    {
        Game.Instance().sceneManager.changeScene("intro");
    }
}