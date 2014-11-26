package SpaceMiner.Pelijuttuja.asscript
{
	import SpaceMiner.Pelijuttuja.asscript.Engine;
	import SpaceMiner.Pelijuttuja.asscript.PelinAloitusPainike;
	import SpaceMiner.Pelijuttuja.asscript.PelinOhjeetPainike;
	import SpaceMiner.Pelijuttuja.asscript.poistu;
	
	
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
				this.addChild(poistunappi);
				
				aloitusPainike.addEventListener(MouseEvent.CLICK, AloitapelipainikePainettu);
				ohjeetpainike.addEventListener(MouseEvent.CLICK, OhjeetpelipainikePainettu);
				poistunappi.addEventListener(MouseEvent.CLICK, poistupelipainikePainettu);
			}
			public function AloitapelipainikePainettu(event:MouseEvent)
			{
				mainClass.naytaPelinNakyma();
			}
			public function OhjeetpelipainikePainettu(event:MouseEvent)
			{
				mainClass.naytaPelinOhjeet();
			
			}
			public function poistupelipainikePainettu(event:MouseEvent)
			{
				trace("in poistupelipainikePainettu");
				mainClass.poistu();
			}
		}
	}
