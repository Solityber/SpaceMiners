package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class Avaruus extends MovieClip
	{
		public var mainClass:Engine;
		public var star:Star;
		public var myStage:Stage;
		public var pelinalus:PelinAlus;
		
		
		
		public function Avaruus(stage:Stage, engine:Engine)
		{
			mainClass = engine;
			myStage = stage;
			pelinalus=new PelinAlus(myStage);
			pelinalus.x = myStage.stageWidth/2;
			pelinalus.y = myStage.stageHeight/2;
			star = new Star(myStage);
			this.addChild(pelinalus);
			
		}
	}
}