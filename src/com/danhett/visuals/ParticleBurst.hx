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
	private var fadeSpeed:Float = 0.2;
	private var total:Int = 50;
    private var finished:Int = 0;
	private var particleRange:Float = 50;
    private var radius:Float = 2.5;

    private var holder:MovieClip;
    private var particles:Array<Particle>;
    private var _particle:Particle;
			
	public function new() 
	{	
		super();

        particles  = new Array<Particle>();

        holder = new MovieClip();
        holder.x = -radius;
        holder.y = -radius;
        addChild(holder);

		for(i in 0...total) 
		{
            var particle:Particle = new Particle();
            particle.rotation = Math.random() * 360;
            particle.alpha = Math.random() + 0.3;

            particle.boundary = particleRange;

            particle.speedX = Math.random() * maxSpeed - Math.random() * maxSpeed;
            particle.speedY = Math.random() * maxSpeed - Math.random() * maxSpeed;
            particle.speedX *= maxSpeed;
            particle.speedY *= maxSpeed;

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
            _particle.y += _particle.speedY;

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

    public function new()
    {
        super();

        this.graphics.beginFill(0xFF0000);
        this.graphics.drawRect(-2, -2, 4, 4);
        this.graphics.endFill();
    }
}