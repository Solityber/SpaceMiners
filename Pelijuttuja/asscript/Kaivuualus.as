package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Kaivuualus extends MovieClip
	{
		private var myStage:Stage;
		
		private var liikeLeft:Boolean = false;
		private var liikeRight:Boolean = false;
		private var liikeUp:Boolean = false;
		private var liikeDown:Boolean = false;
		
		public function Kaivuualus(stage:Stage)
		{
			stop();
			myStage = stage;
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress)
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp)
			myStage.addEventListener(Event.ENTER_FRAME, gameloop)
		}
		
		protected function gameloop(event:Event):void
		{
			if (liikeLeft||liikeRight)
			{
				if(currentLabel != "move")
					gotoAndPlay("move");
			}
			else
			{
				gotoAndPlay("stop");
			}
			
			if(liikeUp == true)
				if (y > 0+this.height/2)
				y -= 2
					
			if(liikeDown == true)
				if (y < myStage.stageHeight-this.height/2)
				y += 2
					
			if(liikeLeft == true)
				if (x > 0+this.width/2)
				x -= 2
					
			if(liikeRight == true)
				if (x < myStage.stageWidth-this.width/2)
				x += 2
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