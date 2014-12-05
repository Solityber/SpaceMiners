package Pelijuttuja.asscript
{
	//list of our imports these are classes we need in order to
	//run our application.
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.system.*;
	import flash.system.fscommand;
	
	public class Engine extends MovieClip
	{
		public var aloitus:PelinAloitusNakyma;
		public var peli:PelinNakyma;
		public var ohje:PelinOhjeet;
		public var maatausta:Maatausta;
		public var avaruus:Avaruus;
		private var numStars:int = 60;
		private var meteorList:Array = new Array();

		
		public function Engine()
		{
			//naytaAloitusNakyma();
			naytaPelinAloitusNakyma();
		}
		
		public function naytaPelinAloitusNakyma()
		{
			aloitus = new PelinAloitusNakyma(this, stage)
			if(peli){
				removeChild(peli);
				peli = null;
			}
			addChild(aloitus);
		}
		
		public function naytaPelinNakyma()
		{
			peli = new PelinNakyma(stage,this);
			if(aloitus){
				trace("pelaa")
				addChild(peli)
			}
		}
		
		public function naytaPelinOhjeet()
		{
			ohje = new PelinOhjeet(stage, this);
			if(ohje){
				trace("ohje")
				addChild(ohje)
			}
		}
		
		public function poistaOhjeet()
		{
			if(ohje){
				trace("poista ohje")
				removeChild(ohje)
		
			}
		}
	}
}
		