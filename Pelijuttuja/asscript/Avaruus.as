package Pelijuttuja.asscript
{
	import Pelijuttuja.asscript.poistu;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Avaruus extends MovieClip
	{
		public var mainClass:Engine;
		public var myStage:Stage;
		public var pelinalus:PelinAlus;
		private var numStars:int = 80;
		
		public function Avaruus(stage:Stage) : void
		{
			for (var i:int = 0; i < numStars; i++)
			{
				this.addChild(new Star(stage));
			}
			myStage = stage;
			pelinalus=new PelinAlus(myStage);
			pelinalus.x = myStage.stageWidth/2;
			pelinalus.y = myStage.stageHeight/2;
			this.addChild(pelinalus);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
			
			private function loop(e:Event) : void
			{
				if (Math.floor(Math.random() * 90) == 5)
				{
					var enemy:Meteor = new Meteor(myStage, pelinalus);
					
					enemy.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
					
					PublicVariables.meteorList.push(enemy);
					
					myStage.addChild(enemy);
				}
				
				if (Math.floor(Math.random() * 800) == 1)
				{
					var lappu:KysymysLappu = new KysymysLappu(myStage, pelinalus);
					
					lappu.addEventListener(Event.REMOVED_FROM_STAGE, removeLappu, false, 0, true);
					
					PublicVariables.kysymyslappuList.push(lappu);
					
					myStage.addChild(lappu);
				}
				
				if (PublicVariables.lifeAmount < 0)
				{
					PublicVariables.mainClass.naytaPelinNakyma();
					removeEventListener(Event.ENTER_FRAME, loop);	
					this.parent.removeChild(this);
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
	}
}