package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Correct extends MovieClip
	{
		private var counter:int = 0;
		private var parentClass:*;
		
		public function Correct(parentObj:*)
		{
			counter = 0;
			parentClass = parentObj;
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(event:Event):void
		{
			counter++;
			
			if(counter > 1* 60)
			{
				this.removeEventListener(Event.ENTER_FRAME, update);
				parentClass.Destroy();
			}
		}		
		
	}
}