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
		public var kaivuuAlus:Kaivuualus;
		public var myStage:Stage
	
		public function PelinNakyma(stage:Stage, engine:Engine)
		{
			
			mainClass = engine;
			myStage = stage;
			kaivuuAlus=new Kaivuualus(myStage);
			this.addChild(maatausta);
			this.addChild(poistunappi);
			this.addChild(kaivuuAlus);
			kaivuuAlus.x = myStage.stageWidth/2;
			kaivuuAlus.y = myStage.stageHeight/2;
		
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
			this.removeChild(maatausta);
			this.removeChild(kaivuuAlus);
			
			
		}
	}
}