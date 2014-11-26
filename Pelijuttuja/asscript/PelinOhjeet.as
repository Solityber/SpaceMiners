package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class PelinOhjeet extends MovieClip
	{
		public var mainClass:Engine;
		private var ohje:Ohjeet = new Ohjeet();
		private var poistunappi:poistu = new poistu();
			
		public function PelinOhjeet(stage:Stage, engine:Engine)
		{
			super();
			
			mainClass = engine;
			this.addChild(ohje);
			this.addChild(poistunappi);
			
			poistunappi.addEventListener(MouseEvent.CLICK, poistupelipainikePainettu);
		}
		
		public function poistupelipainikePainettu(event:MouseEvent)
		{
			mainClass.poistaOhjeet();
		}
	}
}