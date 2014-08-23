package  
{
	
	public class Assets 
	{
		[Embed(source = "assets/enemy1.png")] public static var enemyIMG:Class;
		[Embed(source = "assets/Conditional.png")] public static var prueba:Class;
		[Embed(source = "assets/gold-coin-sprite-earth.png")] public static var coinGoldEarth:Class;
		[Embed(source = "assets/gold-coin-sprite-space.png")] public static var coinGoldSpace:Class;
		[Embed(source = "assets/silver-coin-sprite-earth.png")] public static var coinSilverEarth:Class;
		[Embed(source = "assets/silver-coin-sprite-space.png")] public static var coinSilverSpace:Class;
		[Embed(source = "assets/trash.png")] public static var trashIMG:Class;
		[Embed(source = "assets/sign.png")] public static var signIMG:Class;
		[Embed(source = "assets/jugador.png")] public static var robot:Class;
		[Embed(source = "../MapFiles/fondo.png")]public static var levelTiles:Class;
		[Embed(source = "assets/shoot.mp3")] public static var shootSound:Class;
		[Embed(source = "assets/milkShot.png")] public static var shoot:Class;
		[Embed(source="assets/milkPart.png")] public static var shootExplode:Class;
		
		
		public function Assets() 
		{
			
		}
		
	}

}