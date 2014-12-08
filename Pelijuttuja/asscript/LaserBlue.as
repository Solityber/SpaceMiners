package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class LaserBlue extends MovieClip
	{
		private var stageRef:Stage;
		private var bulletSpeed:Number = 16;
		private var target3;
		private var engine:Engine;
		
		
		public function LaserBlue (stageRef:Stage,  x:Number, y:Number) : void
		{
			this.stageRef = stageRef;
			this.engine = engine;
			this.x = x;
			this.y = y;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
			
		}
		private function loop(e:Event) : void
			{
				//move bullet up
				y -= bulletSpeed;
				
				
				
			for (var i:int = PublicVariables.meteorList.length-1; i >= 0; i--)
			{
				if(stageRef.contains(PublicVariables.meteorList[i]))
				{
					if (hitTestObject(PublicVariables.meteorList[i]))
					{
						trace("hitEnemy");
						PublicVariables.meteorList[i].takeHit();
						removeSelf();
						break;
					}
				}
			}
				
			if (y < 0) 
				removeSelf();
		}
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stageRef.contains(this))
				stageRef.removeChild(this);
		
		}
	}
}
	
