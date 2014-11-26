package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Kaivuualus extends MovieClip
	{
		private var liikeVasen:Boolean = false;
		private var liikeOikea:Boolean = false;
		private var liikeUp:Boolean = false;
		private var liikeAlas:Boolean = false;
		
		public function Kaivuualus()
		{
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress)
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp)
			this.addEventListener(Event.ENTER_FRAME, gameloop)
		}
		
		protected function gameloop(event:Event):void
		{
			
		}

		protected function onKeyUp(event:KeyboardEvent):void
		{
			if(event.keyCode==Keyboard.UP)
				liikeUp = false;
		}
		
		public function onKeyPress(event:KeyboardEvent) :void
		{
			if(event.keyCode==Keyboard.UP)
				liikeUp = true;
		}
		
	}
}