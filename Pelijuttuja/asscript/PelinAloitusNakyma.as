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
			public var myStage: Stage;
			public var mainClass:Engine;
			public var aloitusPainike:PelinAloitusPainike = new PelinAloitusPainike();
			public var ohjeetpainike:PelinOhjeetPainike = new PelinOhjeetPainike();
			private var poistunappi:poistu = new poistu();
			private var tausta:PelinTausta = new PelinTausta();
			public var kaivuuAlus:Kaivuualus;
			
			public function PelinAloitusNakyma(passedClass:Engine, stage:Stage)
			{
				
				mainClass = passedClass;
				myStage = stage;
				kaivuuAlus = new Kaivuualus(stage);
				this.addChild(tausta);
				this.addChild(ohjeetpainike);
				this.addChild(aloitusPainike);
				this.addChild(poistunappi);
				this.addChild(kaivuuAlus);
				kaivuuAlus.x = myStage.stageWidth/2;
				kaivuuAlus.y = myStage.stageHeight/2;
				
				
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
