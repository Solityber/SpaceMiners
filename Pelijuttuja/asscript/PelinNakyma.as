package SpaceMiner.Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class PelinNakyma extends MovieClip
	{
		public function PelinNakyma(stage:Stage)
		{
			//create an object of our ship from the Ship class
			var ourShip:PelinAlus = new PelinAlus();
			
			//add it to the display list
			stage.addChild(ourShip);
			
			ourShip.x = stage.stageWidth / 2;
			ourShip.y = stage.stageHeight / 2;
		}
	}
}