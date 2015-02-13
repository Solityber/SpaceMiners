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
			{
			tekijatpainike.x = stage.stageWidth/2-tekijatpainike.width/2;
			tekijatpainike.y = -tekijatpainike.height/2;
			}
			addChild(takaisin);
			{
			takaisin.x = stage.stageWidth/2-takaisin.width/2;
			takaisin.y = stage.stageHeight/2-takaisin.height/2+takaisin.height*2;
			}
				
			tekijatpainike.addEventListener(MouseEvent.CLICK, tekijatPainettu);	
			takaisin.addEventListener(MouseEvent.CLICK, TakaisinPainettu);
			
		}
		
		public function tekijatPainettu(event:MouseEvent)
		{
			addChild(tekijatruutu);
			addChild(takaisin);
			{
				takaisin.x = 0;
				takaisin.y = 0;
			}
			
		}
			
		public function TakaisinPainettu(event:MouseEvent)
		{
			if(contains(tekijatruutu))
			{
				removeChild(tekijatruutu);
				
				takaisin.x = stage.stageWidth/2-takaisin.width/2;
				takaisin.y = stage.stageHeight/2-takaisin.height/2+takaisin.height*2;
			}
			else
				this.parent.removeChild(this);
		}
	}
}