package 
{
	import org.flixel.*;
	[SWF(width = "800", height = "570", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends FlxGame 
	{
		public function Main():void
		{
			super(500, 600, PlayState, 2, 60, 30, true);
		}
	}
}