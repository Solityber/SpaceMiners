package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class TietoPalkki extends MovieClip
	{
		private var stageRef:Stage;
		PublicVariables.s_Gold
	
		
		public function TietoPalkki(stageRef:Stage)
		{
			this.stageRef = stageRef;
			Gold.text = "0";
			this.addEventListener(Event.ENTER_FRAME, updateGold);
		}
		
		private function updateGold(value:Event) : void
		{
			Gold.text = String(PublicVariables.s_Gold.toString());
		}
								   
	}
}