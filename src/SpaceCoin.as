package  {
	import org.flixel.*;
	
	public class SpaceCoin extends CoinCreator 
	{
		
		override public function createCoin(ptipo:String):Coin {
			
			var coin:Coin;
		
			if(ptipo == "SilverSpaceCoin"){
			
				coin = new SilverSpaceCoin(Math.random() * (FlxG.width / 2), Math.random() * (FlxG.height / 2));
		
			}else if (ptipo == "GoldSpaceCoin") {
				
				coin = new GoldSpaceCoin(Math.random() * (FlxG.width / 2), Math.random() * (FlxG.height / 2));
			}
			
			return coin;
		}
	}

}