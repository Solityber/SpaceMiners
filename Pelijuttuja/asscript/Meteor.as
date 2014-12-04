

package Pelijuttuja.asscript
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Meteor extends MovieClip
	{
		
		private var stageRef:Stage;
		private var speed:Number;
		private var target;
		
		
		
		public function Meteor(stageRef:Stage, alus:PelinAlus)
		{
			
			this.stageRef = stageRef;
			setupMeteor(true);
			this.target = alus;
			
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function setupMeteor(randomizeY:Boolean = false) : void
		{
			//inline conditional, looks complicated but it's not.
			
			y = -50;
			x = Math.random()*stageRef.stageWidth;
			rotation = Math.random()*360;
			scaleX = Math.random()*0.5 + 0.5;
			scaleY = Math.random()*0.5 + 0.5;
	
			
			speed = 0.75 + Math.random()*2;
		}
		
		public function loop(e:Event) : void
		{
			y += speed;
		
			
			if (y > stageRef.stageHeight + 50)
				setupMeteor();
			if(currentLabel != "roll")
				gotoAndPlay("roll");
			
			if (hitTestObject(target))
			{
				trace("hitME");
				removeSelf();
			}
			
			

		}	
		private function removeSelf() : void
		{
			if (stageRef.contains(this))
				setupMeteor();
				
		}
		
	}
	
}


