package  
{
	import org.flixel.*;
	
	public class SilverEarthCoin extends Coin 
	{
		
		public function SilverEarthCoin(px:Number, py:Number)
		{
			x = px;
			y = py;
			loadGraphic(Assets.coinSilverEarth, true, false, 15, 15, false);
			this.addAnimation("normal", [0]);
			this.addAnimation("movimiento", [0,1,2,3,4,5,6],7);
			
			
			this.play("movimiento");
			velocity.x = 0;
			
		}
		
		override public function update():void
		{
			/*if (x < 0 )
			{
				x = 0;
			}else if (x > FlxG.width - width)
			{
				x = FlxG.width - width;
			}*/
		
		}
	}

}