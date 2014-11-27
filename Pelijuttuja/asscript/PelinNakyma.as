package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class PelinNakyma extends MovieClip
	{
		public var mainClass:Engine;
		private var mtausta:Maatausta = new Maatausta();
	
		public function PelinNakyma(stage:Stage, engine:Engine)
		{
			mainClass = engine;
			this.addChild(mtausta);
		
		}
	}
}