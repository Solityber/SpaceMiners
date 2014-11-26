package SpaceMiner.Pelijuttuja.asscript
{
	//list of our imports these are classes we need in order to
	//run our application.
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.system.fscommand;
	import flash.system.*;
	
	public class Engine extends MovieClip
	{
		public var aloitus:PelinAloitusNakyma;
		public var peli:PelinNakyma;
		public var ohje:PelinOhjeet;
		
		
		public function Engine()
		{
			//naytaAloitusNakyma();
			naytaPelinAloitusNakyma();
		}
		
		public function naytaPelinAloitusNakyma()
		{
			aloitus = new PelinAloitusNakyma(this)
			if(peli){
				removeChild(peli);
				peli = null;
			}
			addChild(aloitus);
		}
		
		public function naytaPelinNakyma()
		{
			peli = new PelinNakyma(stage);
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
		
		public function poistu()
		{
			fscommand("quit");
		}
	}
}
		