package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class Avaruus extends MovieClip
	{
		public var mainClass:Engine;
		public var myStage:Stage;
		public var pelinalus:PelinAlus;
		
		
		
		public function Avaruus(stage:Stage)
		{
			
			myStage = stage;
			pelinalus=new PelinAlus(myStage);
			pelinalus.x = myStage.stageWidth/2;
			pelinalus.y = myStage.stageHeight/2;
			this.addChild(pelinalus);
			
		}
	}
}