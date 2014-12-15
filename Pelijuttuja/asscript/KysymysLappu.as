package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class KysymysLappu extends MovieClip
	{
		private var stageRef:Stage;
		private var vy:Number = 3;
		private var target:PelinAlus;
		private var kysymysikkuna:KysymysIkkuna;
		
		
		
		public function KysymysLappu(stageRef:Stage, target:PelinAlus) : void
		{
			rotation = Math.random()*360;
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
			
			if (hitTestObject (target.hit))
			{
				
				trace("hitt");
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
		public function takeHit():void
		{
			stage.frameRate = 0;
		}
	}
}