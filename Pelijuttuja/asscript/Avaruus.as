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
		private var numMeteor:int = 4;
		private var numStars:int = 80;
		
		public function Avaruus(stage:Stage)
		{
			for (var i:int = 0; i < numStars; i++)
			{
				this.addChild(new Star(stage));
			}
			myStage = stage;
			pelinalus=new PelinAlus(myStage);
			pelinalus.x = myStage.stageWidth/2;
			pelinalus.y = myStage.stageHeight/2;
			this.addChild(pelinalus);
			
			for (var b:int = 0; b < numMeteor; b++)
			{
				this.addChild(new Meteor(stage, pelinalus));
			}
		}
	}
}