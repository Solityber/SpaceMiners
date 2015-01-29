package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Kysymys4 extends MovieClip
	{
		private var stageRef:Stage;
		private var isRight:Boolean = false;
		
		public var buttonRight:ButtonRight = new ButtonRight();
		public var buttonWrong:ButtonWrong = new ButtonWrong();
		public var correct:Correct;
		public var wrong:Wrong;
		public var points:int = 100;
	
		public function Kysymys4(stageRaf:Stage)
		{
				this.stageRef = stageRaf;
				addChild(buttonRight);
				addChild(buttonWrong);
				buttonRight.addEventListener(MouseEvent.CLICK, OikeinNappiPainettu);
				buttonWrong.addEventListener(MouseEvent.CLICK, VaarinNappiPainettu);
			}
			
			public function OikeinNappiPainettu(event:MouseEvent)
			{
				correct = new Correct(this);
				addChild(correct);
				isRight = true;
				PublicVariables.addGold(points);
				
			}
			
			public function VaarinNappiPainettu(event:MouseEvent)
			{
				wrong = new Wrong(this);
				addChild(wrong);
				isRight = false;
			}
			
			public function Destroy():void
			{
				PublicVariables.pause = false;
				removeChild(buttonWrong);
				removeChild(buttonRight);
				
				if(isRight)
					removeChild(correct);
				else
					removeChild(wrong);
				
				
				stageRef.removeChild(this);
		}
	}
}