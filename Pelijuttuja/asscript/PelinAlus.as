package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class PelinAlus extends MovieClip
	{
		private var liikeLeft:Boolean = false;
		private var liikeRight:Boolean = false;
		private var liikeUp:Boolean = false;
		private var liikeDown:Boolean = false;
		private var myStage:Stage;
		
		public function PelinAlus(stage:Stage)
		{
			stop();
			myStage = stage;
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress)
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp)
			myStage.addEventListener(Event.ENTER_FRAME, gameloop)
				
			protected function gameloop(event:Event):void
			{
				
			}
				
			protected function onKeyUp(event:KeyboardEvent):void
			{
				if(event.keyCode==Keyboard.UP)
					liikeUp = false;
				if(event.keyCode==Keyboard.DOWN)
					liikeDown = false;
				if(event.keyCode==Keyboard.LEFT)
					liikeLeft = false;
				if(event.keyCode==Keyboard.RIGHT)
					liikeRight = false;
			}
			public function onKeyPress(event:KeyboardEvent) :void
			{
				if(event.keyCode==Keyboard.UP)
					liikeUp = true;
				if(event.keyCode==Keyboard.DOWN)
					liikeDown = true;
				if(event.keyCode==Keyboard.LEFT)
					liikeLeft = true;
				if(event.keyCode==Keyboard.RIGHT)
					liikeRight = true;
			}
		}
	}
}