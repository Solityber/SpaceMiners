package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.Engine;
	import Pelijuttuja.asscript.PelinAloitusPainike;
	import Pelijuttuja.asscript.PelinOhjeetPainike;
	
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
		
		
	public class PelinAloitusNakyma extends MovieClip
	{
			public var mainClass:Engine;
			public var aloitusPainike:PelinAloitusPainike = new PelinAloitusPainike();
			public var ohjeetpainike:PelinOhjeetPainike = new PelinOhjeetPainike();
			private var poistunappi:poistu = new poistu();
			private var tausta:PelinTausta = new PelinTausta();
			
			
			public function PelinAloitusNakyma(passedClass:Engine)
			{
				
				mainClass = passedClass;
				
				this.addChild(tausta);
				this.addChild(ohjeetpainike);
				this.addChild(aloitusPainike);
			
				
				aloitusPainike.addEventListener(MouseEvent.CLICK, AloitapelipainikePainettu);
				ohjeetpainike.addEventListener(MouseEvent.CLICK, OhjeetpelipainikePainettu);
			}
			public function AloitapelipainikePainettu(event:MouseEvent)
			{
				mainClass.naytaPelinNakyma();
			}
			public function OhjeetpelipainikePainettu(event:MouseEvent)
			{
				mainClass.naytaPelinOhjeet();
			
			}
		}
	}
