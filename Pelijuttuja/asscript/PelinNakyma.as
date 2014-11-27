package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class PelinNakyma extends MovieClip
	{
		public var mainClass:Engine;
		private var maatausta:Maatausta = new Maatausta();
		private var poistunappi:poistu = new poistu();
	
		public function PelinNakyma(stage:Stage, engine:Engine)
		{
			super();
			
			mainClass = engine;
			this.addChild(maatausta);
			this.addChild(poistunappi);
		
			poistunappi.addEventListener(MouseEvent.CLICK, poistupelipainikePainettu);
		}
		public function poistupelipainikePainettu(event:MouseEvent)
		{
			trace("poistupelipainikePainettu")
			poistaMaatausta();
		}
		
		public function poistaMaatausta()
		{
			trace("poista maatausta")
			
			this.removeChild(poistunappi);
			this.removeChild(maatausta)
			
		}
	}
}