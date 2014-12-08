package Pelijuttuja.asscript
{
	
	import Pelijuttuja.asscript.KeyObject;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class PelinAlus extends MovieClip
	{
		
		private var stageRef:Stage;
		private var key:KeyObject;
		private var speed:Number = 0.6;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 0.95;
		private var maxspeed:Number = 4;
		public var laser:LaserBlue;
		private var lifeAmount:int = 3;
		
		//fire related variables
		private var fireTimer:Timer; //causes delay between fires
		private var canFire:Boolean = true; //can you fire a laser
		
		public function PelinAlus(stageRef:Stage)
		{
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			
			//setup your fireTimer and attach a listener to it.
			fireTimer = new Timer(300, 1);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerHandler, false, 0, true);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event) : void
		{
			//keypresses
			if (key.isDown(Keyboard.LEFT))
				vx -= speed;
			else if (key.isDown(Keyboard.RIGHT))
				vx += speed;
			else
				vx *= friction;
			
			if (key.isDown(Keyboard.UP))
				vy -= speed;
			else if (key.isDown(Keyboard.DOWN))
				vy += speed;
			else
				vy *= friction;
			
			if (key.isDown(Keyboard.SPACE))
				fireBullet();
			
			//update position
			x += vx;
			y += vy;
			
			//speed adjustment
			if (vx > maxspeed)
				vx = maxspeed;
			else if (vx < -maxspeed)
				vx = -maxspeed;
			
			if (vy > maxspeed)
				vy = maxspeed;
			else if (vy < -maxspeed)
				vy = -maxspeed;
			
			//ship appearance
			rotation = vx;
			scaleX = (maxspeed - Math.abs(vx))/(maxspeed*4) + 0.95;
			
			//stay inside screen
			if (x + this.width/2 > stageRef.stageWidth)
			{
				x = stageRef.stageWidth - this.width/2;
				vx = -vx;
			}
			else if (x - this.width/2 < 0)
			{
				x = this.width/2;
				vx = -vx;
			}
			
			if (y + this.height/2 > stageRef.stageHeight)
			{
				y = stageRef.stageHeight - this.height/2;
				vy = -vy;
			}
			else if (y - this.height/2 < 0)
			{
				y = this.height/2;
				vy = -vy;
			}
			
		if (PublicVariables.lifeAmount < 0)
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			this.parent.removeChild(this);
		}
			
			
		}
		
		
		private function fireBullet() : void
		{
			if (canFire)
			{
				stageRef.addChild(new LaserBlue(stageRef, x + vx, y - this.height/2));
				canFire = false;
				fireTimer.start();
			}
			
		}

		
		private function fireTimerHandler(e:TimerEvent) : void
		{
			
			canFire = true;
		}
		
	}
	
}

