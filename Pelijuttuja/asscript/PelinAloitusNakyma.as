package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.Engine;
	import Pelijuttuja.asscript.PelinAloitusPainike;
	import Pelijuttuja.asscript.PelinOhjeetPainike;
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	
	public class PelinAloitusNakyma extends MovieClip
	{
		
		public var mainClass:Engine;
		public var aloitusPainike:PelinAloitusPainike = new PelinAloitusPainike();
		public var ohjeetpainike:PelinOhjeetPainike = new PelinOhjeetPainike();
		public var tekijatPainike:TekijatPainike = new TekijatPainike();
		private var poistunappi:poistu = new poistu();
		private var tausta:PelinTausta = new PelinTausta();
		
		
		public function PelinAloitusNakyma(passedClass:Engine, stage:Stage)
		{
			
			mainClass = passedClass;
			this.addChild(tausta);
			this.addChild(ohjeetpainike);
			this.addChild(aloitusPainike);
			this.addChild(tekijatPainike);
			
			tekijatPainike.y = stage.stageHeight/2 -tekijatPainike.height/2;
			
			aloitusPainike.y = tekijatPainike.y -aloitusPainike.height*1.5;
			
			ohjeetpainike.y = tekijatPainike.y +ohjeetpainike.height*1.5;
			
			
			
			aloitusPainike.addEventListener(MouseEvent.CLICK, AloitapelipainikePainettu);
			ohjeetpainike.addEventListener(MouseEvent.CLICK, OhjeetpelipainikePainettu);
			tekijatPainike.addEventListener(MouseEvent.CLICK, TekijatPainikePainettu);
		}
		public function AloitapelipainikePainettu(event:MouseEvent)
		{
			mainClass.naytaPelinNakyma();
			
		}
		public function OhjeetpelipainikePainettu(event:MouseEvent)
		{
			mainClass.naytaPelinOhjeet();
			
		}
		public function TekijatPainikePainettu(event:MouseEvent)
		{
			mainClass.naytaPelinTekijat();
		}
	}
}
