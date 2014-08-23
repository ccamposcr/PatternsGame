package  {
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class trashCan extends Obstaculo
	{
		public var shot:Boolean = false;
		
		public function trashCan(x:Number, y:Number) 
		{
			this.loadGraphic(Assets.trashIMG, true, false, 20, 20);
			this.addAnimation("explocion", [1,2],3,false );
			this.addAnimation("normal", [0] );
			
			this.play("normal")
			
			velocity.y = 100;
		}
		
		override public function update():void
		{
			
			this.angle += 2;
			
			if ( y> FlxG.height || alpha<.05)
			{
				this.play("normal");
				velocity.y = 100;
				shot = false;
				alpha = 1;
				x = Math.random() * FlxG.width - width;
				y = Math.random() * -700 - height;
			}
			if (shot)
			{
				alpha -= .05;
			}
			
			
		}
		
	}

}