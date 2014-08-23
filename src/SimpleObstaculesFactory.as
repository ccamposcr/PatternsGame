package  {
	import data.Sign;
	import org.flixel.*;
	
	public class SimpleObstaculesFactory 
	{
		
		public function SimpleObstaculesFactory() 
		{	
		}
		
		public static function createObstaculo(ptipo:String) {
			
			var obstaculo:Obstaculo;
		
			if(ptipo = "Trash"){
				
				obstaculo = new trashCan(Math.random() * FlxG.width - 45, Math.random() * -600);
		
			}else if (ptipo = "Sign") {
				
				obstaculo = new Sign(Math.random() * FlxG.width - 45, Math.random() * -600);
			}
			
			return obstaculo;
		}
	}

}