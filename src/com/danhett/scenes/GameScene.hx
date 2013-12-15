package com.danhett.scenes;

import flash.utils.Object;
import flash.text.TextField;
import com.danhett.debug.Debug;
import com.danhett.game.Game;
import com.danhett.game.Player;
import com.danhett.events.GameEvent;
import com.danhett.visuals.ParticleBurst;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.utils.Object;

class GameScene extends Scene 
{
    private var w:Int = 12;
    private var h:Int = 12;
    private var TILE_WIDTH:Int = 160;
    private var TILE_HEIGHT:Int = 160;
    private var holder:MovieClip;
    private var bursts:MovieClip;
    private var tiles:Array<String>;
    private var hitRatio:Float = 1; // hit zone, leave at 1 for vert/hori lock
    private var dragging:Bool = false;
    private var clicked:Sprite;
    private var selected:String;
    private var picked:Array<Sprite>;

	public function new() 
	{	
		super();

        initTiles();
	}

    private function initTiles():Void
    {
        tiles = new Array<String>();
        tiles.push("TileBlue");
        tiles.push("TileGreen");
        tiles.push("TileLightBlue");
        tiles.push("TilePink");
        tiles.push("TilePurple");
        tiles.push("TileRed");
        tiles.push("TileYellow");

        holder = new MovieClip();
        addChild(holder);

        bursts = new MovieClip();
        addChild(bursts);

        for(i in 0...w)
        {
            for(j in 0...h)
            {
                var obj:Object = getRandomTile();
                var bitmap:Bitmap = obj.tile;
                var tile:Sprite = new Sprite();
                tile.name = obj.tileName;

                tile.x = i * TILE_WIDTH;
                tile.y = j * TILE_HEIGHT;

                holder.addChild(tile);
                tile.addChild(bitmap);
            }
        }

        if(holder.width > holder.height)
        {
            holder.width = 1024 * 0.9;
            holder.scaleY = holder.scaleX;
        }
        else
        {
            holder.height = 768 * 0.9;
            holder.scaleX = holder.scaleY;
        }

        holder.x = 1024 / 2 - holder.width / 2;
        holder.y = 768 / 2 - holder.height / 2;

        bursts.x = holder.x;
        bursts.y = holder.y;
        bursts.width = holder.width;
        bursts.height = holder.height;

        enableTileActions();
    }

    private function getRandomTile():Object
    {
        var newTile:String = tiles[Math.floor(Math.random() * tiles.length)];

        return {tile:Game.Instance().assets.getBitmap(newTile), tileName:newTile};
    }

    private function enableTileActions():Void
    {
        picked = new Array<Sprite>();

        var t:Sprite;

        for(i in 0...holder.numChildren)
        {
            if(holder.getChildAt(i).name != "burst")
            {
                t = cast(holder.getChildAt(i), Sprite);

                var hit:Sprite = new Sprite();

                hit.graphics.beginFill(0xffffff, 0);
                hit.graphics.drawRect(0, 0, t.width * hitRatio, t.height * hitRatio);
                hit.graphics.endFill();

                hit.x = t.width / 2 - hit.width / 2;
                hit.y = t.height / 2 - hit.height / 2;

                hit.buttonMode = true;
                hit.name = "hit";
                hit.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);

                t.addChild(hit);
            }
        }
    }

    private function onMouseDown(e:MouseEvent):Void
    {
        dragging = true;

        clicked = e.target.parent;
        clicked.alpha = 0.2;

        picked.push(clicked);

        selected = clicked.name;

        enableRollovers();
    }

    private function enableRollovers():Void
    {
        var t:Sprite;

        for(i in 0...holder.numChildren)
        {
            if(holder.getChildAt(i).name != "burst")
            {
                t = cast(holder.getChildAt(i), Sprite);

                t.getChildByName("hit").removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
                t.getChildByName("hit").addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
                t.getChildByName("hit").addEventListener(MouseEvent.MOUSE_OVER, doOver);
            }
        }
    }

    private function disableRollovers():Void
    {
        var t:Sprite;

        for(i in 0...holder.numChildren)
        {
            if(holder.getChildAt(i).name != "burst")
            {
                t = cast(holder.getChildAt(i), Sprite);

                t.getChildByName("hit").addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
                t.getChildByName("hit").removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
                t.getChildByName("hit").removeEventListener(MouseEvent.MOUSE_OVER, doOver);
            }
        }
    }

    private function doOver(e:MouseEvent):Void
    {
        clicked = e.target.parent;

        if(clicked.name == selected)
        {
            clicked.alpha = 0.2;
            picked.push(clicked);
        }
        else
            triggerSelectionEnd();
    }

    private function onMouseUp(e:MouseEvent):Void
    {
        triggerSelectionEnd();
    }

    private function triggerSelectionEnd(e:MouseEvent = null):Void
    {
        disableRollovers();

        var t:Sprite;

        for(i in 0...picked.length)
        {
            t = picked[i];

            if(picked.length >= 3)
            {
                t.alpha = 0;

                var newCol:Int = 0;
                switch(selected)
                {
                    case "TileBlue": newCol = 0x3136b3;
                    case "TileGreen": newCol = 0x2e9a30;
                    case "TileLightBlue": newCol = 0x48b7c0;
                    case "TilePink": newCol = 0xb00993;
                    case "TilePurple": newCol = 0x9628a1;
                    case "TileRed": newCol = 0xaf0c0f;
                    case "TileYellow": newCol = 0xc6ac38;
                }

                var burst:ParticleBurst = new ParticleBurst(newCol);
                burst.name = "burst";
                burst.x = (t.x + t.width * 0.5);
                burst.y = (t.y + t.width * 0.5);
                holder.addChild(burst);
            }
            else
            {
                t.alpha = 1;
            }
        }

        removeTiles();

        picked = [];
    }

    private function removeTiles():Void
    {
        trace("REMOVING: " + picked);
    }

	override public function destroy():Void
	{
		// remove stuff here when the scene is changed!
	}
}