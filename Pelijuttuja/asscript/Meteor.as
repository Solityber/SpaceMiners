

package Pelijuttuja.asscript
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Meteor extends MovieClip
	{
		
		private var stageRef:Stage;
		private var vy:Number = 3;
		
		private var target:PelinAlus;
		
		
		
	public function Meteor(stageRef:Stage, target:PelinAlus) : void
	{
			scaleX = Math.random()*0.7+0.3;
			scaleY = Math.random()*0.7+0.3;
			
			this.stageRef = stageRef;
			
			this.target = target;
		
			x = Math.random() * stageRef.stageWidth;
			y = -5;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event) : void
		{
			
			y += vy;
			
			if (y > stageRef.stageHeight)
				removeSelf();
			
			
			if(currentLabel != "roll")
				gotoAndPlay("roll");
			if (hitTestObject (target.hit))
			{
				PublicVariables.lifeAmount--;
				trace("hitME");
				removeSelf();
			}
			
			if (PublicVariables.lifeAmount < 0)
			{
				removeEventListener(Event.ENTER_FRAME, loop);
				removeSelf();
			}
			
		}	
		
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stageRef.contains(this))
					stageRef.removeChild(this);
				
		}
		
		public function takeHit() : void
		{
			removeSelf();
		}
	}
	
}


