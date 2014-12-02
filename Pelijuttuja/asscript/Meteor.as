

package Pelijuttuja.asscript
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Meteor extends MovieClip
	{
		
		private var stageRef:Stage;
		private var speed:Number;
		
		public function Meteor(stageRef:Stage)
		{
			this.stageRef = stageRef;
			setupMeteor(true);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function setupMeteor(randomizeY:Boolean = false) : void
		{
			//inline conditional, looks complicated but it's not.
			y = randomizeY ? Math.random()*stageRef.stageHeight : 0;
			x = Math.random()*stageRef.stageWidth;
			alpha = Math.random();
			rotation = Math.random()*360;
	
			
			speed = 0.50 + Math.random()*2;
		}
		
		public function loop(e:Event) : void
		{
			y += speed;
			
			if (y > stageRef.stageHeight)
				setupMeteor();
			
		}
		
	}
}

