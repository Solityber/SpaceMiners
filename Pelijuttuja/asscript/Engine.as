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
		public var tekijat:PelinTekijat;
		public var maatausta:Maatausta;
		public var avaruus:Avaruus;
		private var numStars:int = 60;
		public var meteorList:Array = new Array();
		public var kysymyslappuList:Array = new Array();
		public var optionsValikko:OptionsValikko;
		
		
		public function Engine()
		{
			//naytaAloitusNakyma();
			PublicVariables.mainClass = this;
			naytaPelinAloitusNakyma();
			
		}
		
		
		public function naytaPelinAloitusNakyma()
		{	
			aloitus = new PelinAloitusNakyma(this, stage)
			
			if(avaruus){
				removeChild(avaruus);
				avaruus=null;
			}
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
				removeChild(aloitus)
				aloitus=null;
			}
			if(optionsValikko){
				removeChild(optionsValikko);
				optionsValikko=null;		
			}
			addChild(peli);
		}
		
		public function naytaPelinOhjeet()
		{
			ohje = new PelinOhjeet(stage, this);
			if(ohje){
				trace("ohje")
				addChild(ohje)
			}
		}
		
		
		public function naytaPelinTekijat()
		{
			tekijat = new PelinTekijat(stage,this);
			if(tekijat){
				trace("tekijat")
				addChild(tekijat)
			}
		}
		
		public function poistaPelinTekijat()
		{
			if(tekijat){
				trace("poista tekijat")
				removeChild(tekijat)
			}
		}
		
		public function naytaAvaruus()
		{
			if(aloitus){
				trace("nautaAvaruus")
				removeChild(aloitus);
				aloitus=null;
			}
			avaruus=new Avaruus(this,stage);
			addChild(avaruus);
		}
		
		public function naytaOptionsValikko()
		{
			if(avaruus){
				trace("poistaAloitus")
				removeChild(avaruus);
				avaruus=null;
			}
			if(aloitus){
				trace("poistaAloitus")
				removeChild(aloitus);
				aloitus=null;
			}
			optionsValikko=new OptionsValikko(this,stage);
			addChild(optionsValikko);
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
		