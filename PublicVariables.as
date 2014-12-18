package
{
	import Pelijuttuja.asscript.Avaruus;
	import Pelijuttuja.asscript.Engine;

	public class PublicVariables
	{
		public static var kysymyslappuList:Array = new Array();
		public static var meteorList:Array = new Array();
		public static var lifeAmount:int = 2;
		public static var mainClass:Engine;
		public static var pause:Boolean = false
		public static var s_Gold:int = 0;
		public static function addGold(value:int):void
		{
			PublicVariables.s_Gold += value;
		}
	}
}