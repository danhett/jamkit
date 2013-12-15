package com.danhett.visuals;

import com.danhett.events.GameEvent;
import flash.display.Sprite;
import flash.display.MovieClip;
import flash.events.Event;
import com.danhett.debug.Debug;

class ParticleBurst extends Sprite 
{
    // TODO: make these into params when creating the class
    private var particleColour = 0xFF0000;
	private var maxSpeed:Float = 2;
	private var fadeSpeed:Float = 0.15;
	private var total:Int = 40;
    private var finished:Int = 0;
	private var particleRange:Float = 30;
    private var radius:Float = 2.5;
    private var gravity:Float = 4;

    private var holder:MovieClip;
    private var particles:Array<Particle>;
    private var _particle:Particle;
			
	public function new(colour = 0xFF00FF)
	{	
		super();

        this.mouseEnabled = false;

        var _colour = colour;

        particles  = new Array<Particle>();

        holder = new MovieClip();
        holder.mouseEnabled = false;
        holder.x = -radius;
        holder.y = -radius;
        addChild(holder);

		for(i in 0...total) 
		{
            var particle:Particle = new Particle(_colour);
            particle.mouseEnabled = false;
            particle.rotation = Math.random() * 360;
            particle.alpha = Math.random() + 0.3;

            particle.x = (Math.random() * 100) - 50;
            particle.y = (Math.random() * 100) - 50;

            particle.boundary = particleRange;

            particle.speedX = Math.random() * maxSpeed - Math.random() * maxSpeed;
            particle.speedY = Math.random() * maxSpeed - Math.random() * maxSpeed;
            particle.speedX *= maxSpeed;
            particle.speedY *= maxSpeed;
            particle.rotationSpeed = Math.random() * 360;

            particle.fadeSpeed = (Math.random() * fadeSpeed) * fadeSpeed;

            particles.push(particle);

            holder.addChild(particle);
		}

        addEventListener(Event.ENTER_FRAME, tick);
	}

    private function tick(e:Event):Void
    {
        for(i in 0...particles.length)
        {
            _particle = particles[i];

            _particle.alpha -= _particle.fadeSpeed;
            _particle.x += _particle.speedX;
            _particle.y += _particle.speedY + gravity;
            _particle.rotation += _particle.rotationSpeed;

            if(_particle.alpha <= 0 && !_particle.finished)
            {
                _particle.finished = true;
                finished++;
            }

            if(total == finished)
            {
                dispose();
                break;
            }
        }
    }

    private function dispose():Void
    {
        removeEventListener(Event.ENTER_FRAME, tick);

        dispatchEvent(new GameEvent(GameEvent.PARTICLES_FINISHED));
    }
}

class Particle extends Sprite
{
    public var speedX:Float;
    public var speedY:Float;
    public var fadeSpeed:Float;
    public var boundary:Float;
    public var finished:Bool = false;
    public var rotationSpeed:Float;

    public function new(colour = 0xFF0000)
    {
        super();

        this.graphics.beginFill(colour);
        this.graphics.drawRect(-8, -8, 16, 16);
        this.graphics.endFill();
    }
}