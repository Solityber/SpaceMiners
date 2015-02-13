package Pelijuttuja.asscript
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class OptionsValikko extends MovieClip
	{
		public var mainClass:Engine;
		private var options:OptionsRuutu = new OptionsRuutu();
		private var tekijatpainike:TekijatPainike = new TekijatPainike();
		private var takaisin:poistu = new poistu();
		private var tekijatruutu:TekijatRuutu = new TekijatRuutu();
		

		public function OptionsValikko(stage:Stage, engine:Engine)
		{
			addChild(options);
			addChild(tekijatpainike);
			tekijatpainike.x = stage.stageWidth/2-tekijatpainike.width/2;
			tekijatpainike.y = -tekijatpainike.height/2;
			addChild(takaisin);
			takaisin.x = stage.stageWidth/2-takaisin.width/2;
			takaisin.y = -takaisin.height/2+takaisin.height*1.5;
				
			tekijatpainike.addEventListener(MouseEvent.CLICK, tekijatPainettu);	
			
		}
		
		public function tekijatPainettu(event:MouseEvent)
		{
			addChild(tekijatruutu);
		}
	}
}