package assets 
{
	import org.flixel.*;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Alien extends FlxSprite
	{
		protected static const RUN_SPEED:int = 80;
		protected static const GRAVITY:int =420;
		protected static const JUMP_SPEED:int = 200;
		
		public function Alien(x:Number,y:Number) 
		{
			super(x, y);
			loadGraphic(Assets.robot, true, true, 45, 45);
			
			addAnimation("idle", [1],12,false);
			addAnimation("run", [2, 3, 4, 5, 6, 7],12,false);
			addAnimation("jump", [10, 11, 12, 13, 14, 15, 16, 17],12,false);
			addAnimation("Attack", [17, 18, 19, 20],12,false);
			addAnimation("cannon", [21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33], 12, false);
			/*
			 drag.x = RUN_SPEED * 8;  // Drag is how quickly you slow down when you're not pushing a button. By using a multiplier, it will always scale to the run speed, even if we change it.
            acceleration.y = GRAVITY; // Always try to push helmutguy in the direction of gravity
            maxVelocity.x = RUN_SPEED;
            maxVelocity.y = JUMP_SPEED;
			*/
		}
		
		  override public function update():void {
			
			acceleration.x = 0; //Reset to 0 when no button is pushed
			
			if (FlxG.keys.LEFT)
			{
				facing = LEFT; 
				acceleration.x = -drag.x;
			}
			else if (FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x = drag.x;				
			}
			if(FlxG.keys.justPressed("UP") && !velocity.y)
			{
				velocity.y = -JUMP_SPEED;
			}
			//Animation
			if (velocity.x > 0) { play("run"); }
			else if (!velocity.x) { play("idle"); }
			
			super.update();
        }
		
		
	}

}