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
		public var laukaisuAlusta:Laukaisualusta;
		public var kaivuuAlus:Kaivuualus;
		public var myStage:Stage
		private var tietopalkki:TietoPalkki;
		public var avaruus:Avaruus;
		private var optionsbutton:OptionsBtn;
		private var options:OptionsValikko
	
		public function PelinNakyma(stage:Stage, engine:Engine)
		{
			
			mainClass = engine;
			myStage = stage;
			tietopalkki = new TietoPalkki(myStage);
			optionsbutton = new OptionsBtn();
			kaivuuAlus=new Kaivuualus(myStage);
			laukaisuAlusta= new Laukaisualusta(myStage);
			this.addChild(maatausta);
			this.addChild(tietopalkki);
			this.addChild(kaivuuAlus);
			this.addChild(laukaisuAlusta);
			this.addChild(optionsbutton);
			kaivuuAlus.x = myStage.stageWidth/2;
			kaivuuAlus.y = myStage.stageHeight/2;
			
		
			laukaisuAlusta.addEventListener(MouseEvent.CLICK, karttapelipainikePainettu);
			optionsbutton.addEventListener(MouseEvent.CLICK, OptionsPainettu);
		}
		public function OptionsPainettu(event:MouseEvent)
		{
			/*options = new OptionsValikko(myStage, mainClass);
			if(options)
			{
				trace("Options")
				stage.addChild(options);
			}*/
			mainClass.naytaOptionsValikko()
		}
		public function karttapelipainikePainettu(event:MouseEvent)
		{
			trace("karttaPainettu")
			naytaAvaruus();
			this.removeChild(maatausta);
			this.removeChild(kaivuuAlus);
			this.removeChild(laukaisuAlusta);
			this.removeChild(tietopalkki);
			PublicVariables.lifeAmount = 2;
		}
		
		private function naytaAvaruus():void
		{
			mainClass.naytaAvaruus();
		}
		public function poistaAvaruus():void
		{
			if(avaruus)
			{
				trace("avaruus")
				stage.removeChild(avaruus);
			}
		}
		public function poistaMaatausta()
		{
			trace("poista maatausta")
			
			
			this.removeChild(maatausta);
			this.removeChild(kaivuuAlus);
			this.removeChild(laukaisuAlusta);
			this.removeChild(tietopalkki);
			
			
		}
	}
}