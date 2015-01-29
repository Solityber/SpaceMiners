package Pelijuttuja.asscript
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class KysymysLappu extends MovieClip
	{
		private var stageRef:Stage;
		private var vy:Number = 3;
		private var target:PelinAlus;
		public var kysymysikkuna:KysymysIkkuna;
		public var kysymysikkuna1:Kysymys1;
		public var kysymysikkuna2:Kysymys2;
		public var kysymysikkuna3:Kysymys3;
		public var kysymysikkuna4:Kysymys4;
		public var kysymysikkuna5:Kysymys5;
		public var kysymysikkuna6:Kysymys6;
		
		
		
		
		
		public function KysymysLappu(stageRef:Stage, target:PelinAlus) : void
		{
			rotation = Math.random()*360;
			this.stageRef = stageRef;
			
			this.target = target;
			
			x = Math.random() * stageRef.stageWidth;
			y = -5;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
			
		}
		
		
		public function loop(e:Event) : void
		{
			if(!PublicVariables.pause)
			{	
				y += vy;
				
				
				if (y > stageRef.stageHeight)
					removeSelf();
				
				if (hitTestObject (target.hit))
				{
					PublicVariables.pause = true;
					naytaKysymys();
					trace("hitt");
					removeSelf();
				
				}
				
				if (PublicVariables.lifeAmount < 0)
				{
					removeEventListener(Event.ENTER_FRAME, loop);
					removeSelf();
				}
			}
		}
		private function naytaKysymys():void
		{
			
			var rand:int = Math.floor(Math.random()*7)
			if(rand == 0)
			{
				trace("kysymys")
				kysymysikkuna = new KysymysIkkuna(stageRef);
				stageRef.addChild(kysymysikkuna);
				
			}if(rand == 1)
			{
				trace("kysymys1")
				kysymysikkuna1 = new Kysymys1(stageRef);
				stageRef.addChild(kysymysikkuna1);
				
			}if(rand == 2)
			{
				trace("kysymys2")
				kysymysikkuna2 = new Kysymys2(stageRef);
				stageRef.addChild(kysymysikkuna2);
				
			}if(rand == 3)
			{
				trace("kysymys3")
				kysymysikkuna3 = new Kysymys3(stageRef);
				stageRef.addChild(kysymysikkuna3);
				
			}if(rand == 4)
			{
				trace("kysymys4")
				kysymysikkuna4 = new Kysymys4(stageRef);
				stageRef.addChild(kysymysikkuna4);
				
			}if(rand == 5)
			{
				trace("kysymys5")
				kysymysikkuna5 = new Kysymys5(stageRef);
				stageRef.addChild(kysymysikkuna5);
				
			}if(rand == 6)
			{
				trace("kysymys6")
				kysymysikkuna6 = new Kysymys6(stageRef);
				stageRef.addChild(kysymysikkuna6);
				
			}
		}
		
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stageRef.contains(this))
				stageRef.removeChild(this);
			
		}
		public function takeHit():void
		{
			stage.frameRate = 0;
		}
	}
}