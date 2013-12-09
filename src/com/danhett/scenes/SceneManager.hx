package com.danhett.scenes;

import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.events.GameEvent;
import flash.display.Sprite;

class SceneManager extends Sprite 
{
	private var holder:Sprite;
    private var toKill:Scene;
			
	public function new() 
	{	
		super();		
	}
	
	public function init():Void
	{
		holder = new Sprite();
		addChild(holder);
		
		Debug.log("SceneManager ready");
		this.dispatchEvent(new GameEvent(GameEvent.COMPONENT_READY));
	}
	
	public function changeScene(scene:String):Void
	{
		Debug.log("Switching scene to " + scene);
		
		destroyCurrentScene();
		
		switch(scene)
		{
			case "intro": 
				holder.addChild(new IntroScene());
				
			case "game":
                holder.addChild(new GameScene());
				
			case "end":
                holder.addChild(new EndScene());
		}
	}
	
	private function destroyCurrentScene():Void
	{
		if(holder.numChildren > 0)
        {
            toKill = cast holder.getChildAt(0);
            toKill.destroy();

            holder.removeChildAt(0);
        }
	}
}