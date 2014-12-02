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
		private var vy:int = 0;
		private var maxSpeed:int = 30;
		
		private var liikeLeft:Boolean = false;
		private var liikeRight:Boolean = false;
		private var liikeUp:Boolean = false;
		private var liikeDown:Boolean = false;
		private var valintaButton:Boolean = false;
		
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
			//if (hitTestObject(myStage.laukaisuAlusta.hitBox))
			
			
			if (liikeUp)
			{
				if(currentLabel != "fly")
					gotoAndPlay("fly");
			}
			
			else if (liikeLeft||liikeRight)
			{
				if(currentLabel != "move")
					gotoAndPlay("move");
			}
			
			else if (liikeDown)
			{
				if(currentLabel !="Drill")
					gotoAndPlay("Drill");
			}
			
			else
			{
				gotoAndPlay("stop");
			}
			
			
			if(y < this.height/2+1)
				y += 1;
			if(y > myStage.stageHeight - this.height/2 +5)
				y -= 2;
			
			if(liikeUp == true)
			{
				if (y > this.height/2 && y < myStage.stageHeight
)
				{
					vy -= 2;
				}
				else
				{
					vy = 0;
				}
			}	
			else
			{
				if (y < myStage.stageHeight-this.height/2-myStage.stageHeight/2.86 && y > 0+this.height/2)	
				{
					vy += 2;
				}
				else
				{
					vy = 0;
				}
			}		
			if(liikeDown == true)
			{
				
			}
					
			if(liikeLeft == true)
				if (x > 0+this.width/2)
				x -= 2
					
			if(liikeRight == true)
				if (x < myStage.stageWidth-this.width/2)
				x += 2
					
			if (vy > maxSpeed*1.2)
				vy = maxSpeed*1.2;
			
			else if (vy < -maxSpeed*0.8)
					 vy = -maxSpeed*0.8;
					
					
			y += vy*0.1;
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
			if(event.keyCode==Keyboard.E)
			{
				trace: ("valintafalse");
				valintaButton = false;
			}
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
			if(event.keyCode==Keyboard.E)
			{
				trace: ("valintatrue");
				valintaButton = true;
			}
		}
	}
}