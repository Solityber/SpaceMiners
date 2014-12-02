package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class PelinNakyma extends MovieClip
	{
		public var mainClass:Engine;
		private var maatausta:Maatausta = new Maatausta();
		private var poistunappi:poistu = new poistu();
		public var kaivuuAlus:Kaivuualus;
		public var myStage:Stage
		public var laukaisuAlusta:Laukaisualusta;
	
		public function PelinNakyma(stage:Stage, engine:Engine)
		{
			
			mainClass = engine;
			myStage = stage;
			kaivuuAlus=new Kaivuualus(myStage);
			laukaisuAlusta= new Laukaisualusta(myStage);
			this.addChild(maatausta);
			this.addChild(poistunappi);
			this.addChild(kaivuuAlus);
			this.addChild(laukaisuAlusta);
			kaivuuAlus.x = myStage.stageWidth/2;
			kaivuuAlus.y = myStage.stageHeight/2;
		
			poistunappi.addEventListener(MouseEvent.CLICK, poistupelipainikePainettu);
			laukaisuAlusta.addEventListener(MouseEvent.CLICK, karttaPainettu);
		}
		public function karttaPainettu(event:MouseEvent)
		{
			trace("karttaPainettu")
			;
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
			this.removeChild(laukaisuAlusta);
			
			
		}
	}
}