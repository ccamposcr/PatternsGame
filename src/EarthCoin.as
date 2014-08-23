package  {
	/**
	 * ...
	 * @author Danny Espinoza y Christian Campos
	 */
	import org.flixel.*;
	
	public class EarthCoin extends CoinCreator 
	{
		
		override public function createCoin(ptipo:String):Coin {
			
			var coin:Coin;
		
			if(ptipo == "SilverEarthCoin"){
			
				coin = new SilverEarthCoin(Math.random() * (FlxG.width / 2), Math.random() * (FlxG.height / 2));
		
			}else if (ptipo == "GoldEarthCoin") {
				
				coin = new GoldEarthCoin(Math.random() * (FlxG.width / 2), Math.random() * (FlxG.height / 2));
			}
			
			return coin;
		}
	}

}