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
		private var planeetalleBtn:PlaneetalleBtn = new PlaneetalleBtn();
		

		public function OptionsValikko(engine:Engine,stage:Stage)
		{
			mainClass = engine;
			
			addChild(options);
			addChild(tekijatpainike);
			addChild(planeetalleBtn);
			addChild(takaisin);
			
			tekijatpainike.x = stage.stageWidth/2-tekijatpainike.width/2;
			tekijatpainike.y = stage.stageHeight/2-tekijatpainike.height/2;
			
			takaisin.x = stage.stageWidth/2-takaisin.width/2;
			takaisin.y = stage.stageHeight/2-takaisin.height/2-takaisin.height*2;
			
			planeetalleBtn.x = stage.stageWidth/2-planeetalleBtn.width/2;
			planeetalleBtn.y = stage.stageHeight/2-planeetalleBtn.height/2+planeetalleBtn.height*2;
				
			tekijatpainike.addEventListener(MouseEvent.CLICK, tekijatPainettu);	
			takaisin.addEventListener(MouseEvent.CLICK, TakaisinPainettu);
			planeetalleBtn.addEventListener(MouseEvent.CLICK, planetBack);
			
		}
		
		public function tekijatPainettu(event:MouseEvent)
		{
			addChild(tekijatruutu);
			addChild(takaisin);
			{
				takaisin.x = 17;
				takaisin.y = 11;
			}
			
		}
		
		public function  planetBack(event:MouseEvent)
		{
			stage.frameRate=60;
			
			mainClass.naytaPelinAloitusNakyma()
		}
			
		public function TakaisinPainettu(event:MouseEvent)
		{
			
			if(contains(tekijatruutu))
			{
				removeChild(tekijatruutu);
				
				
				takaisin.x = stage.stageWidth/2-takaisin.width/2;
				takaisin.y = stage.stageHeight/2-takaisin.height/2-takaisin.height*2;
				
			}
			else
			{
				stage.frameRate=60;
				mainClass.naytaAvaruus();
				this.parent.removeChild(this);
			}
		}
	}
}