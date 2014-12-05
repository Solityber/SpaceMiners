

package Pelijuttuja.asscript
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Meteor extends MovieClip
	{
		
		private var stageRef:Stage;
		private var vy:Number = 3;
		private var ay:Number = .4;
		private var target:PelinAlus;
		
		
		
	public function Meteor(stageRef:Stage, target:PelinAlus) : void
	{
			
			this.stageRef = stageRef;
			
			this.target = target;
		
			x = Math.random() * stageRef.stageWidth;
			y = -5;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event) : void
		{
			vy += ay;
			y += vy;
			
			if (y > stageRef.stageHeight)
				removeSelf();
			
			if (y > stageRef.stageHeight)
				removeSelf();
			
			if(currentLabel != "roll")
				gotoAndPlay("roll");
			
		}	
		
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stageRef.contains(this))
					stageRef.removeChild(this);
				
		}
		
	}
	
}


