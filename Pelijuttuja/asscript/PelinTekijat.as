package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.poistu;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class PelinTekijat extends MovieClip
	{
		public var mainClass:Engine;
		private var tekijat:TekijatRuutu = new TekijatRuutu();
		private var poistunappi:poistu = new poistu();
		
		public function PelinTekijat(stage:Stage, engine:Engine)
		{
			mainClass = engine;
			this.addChild(tekijat);
			this.addChild(poistunappi);
			
			poistunappi.addEventListener(MouseEvent.CLICK, poistupelipainikePainettu);
		}
		
		public function poistupelipainikePainettu(event:MouseEvent)
		{
			mainClass.poistaPelinTekijat();
		}
	}
}