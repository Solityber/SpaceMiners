package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.KeyObject;
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	public class Avaruus extends MovieClip
	{
		public var mainClass:Engine;
		public var myStage:Stage;
		public var pelinalus:PelinAlus;
		private var numStars:int = 80;
		private var tietopalkki = new TietoPalkki(myStage);
		private var mediumHealth = new MediumHealth();
		private var lowHealth = new LowHealth();
		private var optionsbutton:OptionsBtn;
		private var options:OptionsValikko
		private var key:KeyObject;
		private var enemy:Meteor;
		private var lappu:KysymysLappu;
		
		
		public function Avaruus(passedClass:Engine,stage:Stage) : void
		{
			mainClass = passedClass;
			for (var i:int = 0; i < numStars; i++)
			{
				this.addChild(new Star(stage));
			}
			myStage = stage;
			key = new KeyObject(myStage);
			optionsbutton = new OptionsBtn();
			pelinalus=new PelinAlus(myStage);
			pelinalus.x = myStage.stageWidth/2;
			pelinalus.y = myStage.stageHeight/2;
			this.addChild(pelinalus);
			this.addChild(tietopalkki);
			this.addChild(optionsbutton);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
			optionsbutton.addEventListener(MouseEvent.CLICK, OptionsPainettu);
			

		}
			
			private function loop(e:Event) : void
			{
				if(!PublicVariables.pause)
				{
					if (Math.floor(Math.random() * 90) == 5)
					{
						enemy = new Meteor(myStage, pelinalus);
						
						enemy.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
						
						PublicVariables.meteorList.push(enemy);
						
						myStage.addChild(enemy);
					}
					
					if (Math.floor(Math.random() * 800) == 1)
					{
						lappu = new KysymysLappu(myStage, pelinalus);
						
						lappu.addEventListener(Event.REMOVED_FROM_STAGE, removeLappu, false, 0, true);
						
						PublicVariables.kysymyslappuList.push(lappu);
						
						myStage.addChild(lappu);
					}
					if (PublicVariables.lifeAmount < 2)
					{
						this.addChild(mediumHealth);
					}
					
					if (PublicVariables.lifeAmount < 1)
					{
						this.addChild(lowHealth);
						removeChild(mediumHealth);
					}
					
					if (PublicVariables.lifeAmount < 0)
					{
						PublicVariables.mainClass.naytaPelinNakyma();
						removeEventListener(Event.ENTER_FRAME, loop);	
						this.parent.removeChild(this);
					}
					
				}
				
			}
			
			
			protected function removeLappu(event:Event):void
			{
				PublicVariables.kysymyslappuList.splice(PublicVariables.kysymyslappuList.indexOf(event.currentTarget), 1);
				
			}
			
		public function Pause():void
		{
			stage.frameRate = 0;
		}
			
		private function removeEnemy(e:Event)
		{
			PublicVariables.meteorList.splice(PublicVariables.meteorList.indexOf(e.currentTarget), 1);
			
		  
		}
		public function OptionsPainettu(event:MouseEvent)
		{
			/*options = new OptionsValikko(myStage, mainClass);
			if(options)
			{
				stage.frameRate = 0;
				trace("Options")
				stage.addChild(options);
			}*/
			stage.frameRate=0;
			mainClass.naytaOptionsValikko();
		}
	}
}