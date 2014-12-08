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
				
				if (PublicVariables.lifeAmount < 0)
				{
					PublicVariables.mainClass.naytaPelinNakyma();
					removeEventListener(Event.ENTER_FRAME, loop);	
					this.parent.removeChild(this);
				}
					
				
			}
		private function removeEnemy(e:Event)
		{
			PublicVariables.meteorList.splice(PublicVariables.meteorList.indexOf(e.currentTarget), 1);
			
		  
		}
	}
}