package  
{
	import org.flixel.*;
	
	
	public class Robot extends FlxSprite
	{
		private var _jump:Number;
		
		// recibe las coordenadas de ubicacion
		public function Robot(x:Number,y:Number) 
		{
			super(x, y);
			
			drag.x = 640;
			acceleration.y = 420;            
			maxVelocity.x = 80;
			maxVelocity.y = 200;
			
            width = 14;
			height = 14;
			offset.x = 1;
			offset.y = 1;
		
			this.loadGraphic(Assets.robot, true, false, 44,45);
			addAnimation("idle", [1],12,false);
			addAnimation("run", [2, 3, 4, 5, 6, 7],12,false);
			addAnimation("jump", [10, 11, 12, 13, 14, 15, 16, 17],12,false);
			addAnimation("Attack", [17, 18, 19, 20],12,false);
			addAnimation("cannon", [21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33], 12, false);
			
			this.play("idle");
		
		}
		
		override public function update():void
		{
			wrap(this);
			
			acceleration.x = 0;
			
			if (FlxG.keys.LEFT) {
				facing = FlxObject.LEFT;
				acceleration.x -= drag.x;	
			}else if (FlxG.keys.RIGHT) {
				facing = FlxObject.LEFT;
				acceleration.x += drag.x;
			}
			if (FlxG.keys.justPressed("UP") && velocity.y == 0) {
				y -= 1;
				velocity.y = -200;
			}
			
			if (velocity.y != 0) {
				play("jump");
			}
			else if (velocity.x == 0) {
				play("idle");	
			}
			else {
				play("run")	
			}
			super.update();
		}
		
		private function wrap(obj:FlxObject):void
		{
			obj.x = (obj.x + obj.width / 2 + FlxG.width) % FlxG.width - obj.width / 2;
			obj.y = (obj.y + obj.height / 2) % FlxG.height - obj.height / 2;
		}
		
	}	

}