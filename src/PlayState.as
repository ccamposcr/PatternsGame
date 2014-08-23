package 
{
	import flash.display.BlendMode;
	
	import data.Alien;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public class PlayState extends FlxState
	{
		// Tileset that works with AUTO mode (best for thin walls)
		[Embed(source="assets/auto_tiles.png")]private static var auto_tiles:Class;
		// Default tilemaps. Embedding text files is a little weird.
		[Embed(source="assets/default_auto.txt",mimeType = 'application/octet-stream')]private static var default_auto:Class;
		
		// Some static constants for the size of the tilemap tiles
		private const TILE_WIDTH:uint = 16;
		private const TILE_HEIGHT:uint = 16;
		
		// The FlxTilemap we're using
		private var collisionMap:FlxTilemap;
		// Box to show the user where they're placing stuff
		private var highlightBox:FlxObject;
		
		// Player 
		private var player:Player;
		//Simple Factory
		private var factory:SimpleObstaculesFactory;
		//Obstaculo
		private var _trash:Obstaculo;
		private var trashGroup:FlxGroup;
		//Coins
		private var _coin:Coin;
		private var coinsGroup:FlxGroup;
		
		private static var score:Number;
		public static var scoreText:FlxText;
		
		private var weapon:FlxWeapon;
		
	
		/*
		public var map:FlxTilemap = new FlxTilemap;
		
		public var _alien:Alien;
		
		private var _trash:Obstaculo;
		private var trashGroup:FlxGroup;
		private var t:Number = 0;
		*/
		override public function create():void
		{
			score = 0;
			scoreText = new FlxText(10, 10, FlxG.width, score.toString());
			add(scoreText);
			FlxG.framerate = 50;
			FlxG.flashFramerate = 50;
			
			// Creates a new tilemap with no arguments
			collisionMap = new FlxTilemap();
			
			collisionMap.loadMap(new default_auto(), auto_tiles, TILE_WIDTH, TILE_HEIGHT, FlxTilemap.ALT);
			add(collisionMap);
			
			highlightBox = new FlxObject(0, 0, TILE_WIDTH, TILE_HEIGHT);
			
			player = new Player(100, 100);
			weapon = new FlxWeapon("bullet", player, "x", "y");
			weapon.makeImageBullet(50, Assets.shoot, 34);
			weapon.setBulletDirection(FlxWeapon.BULLET_UP, 200);
			add(weapon.group);
			createObstacules();
			createCoins();
			
			add(player);
			
			// create the objects and their initial positions
			//FlxG.bgColor = 0xff9b9b9b; 
			//0xff9b9b9b;
			//createObstacules();
			//add(map.loadMap(new levelMap, levelTiles, 16, 16));
			/*
			_trash = new Obstaculo(150, 100);
			add(_trash) 
			
			_coin = new Coin(FlxMath.rand(20,600),FlxMath.rand(20,460));
			add(_coin);
			
			_alien = new Alien(100, 100);
			add(_alien);
			*/
			super.create();
		}
		
		override public function update():void
		{		
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.play(Assets.shootSound);
				player.play("Attack");
				weapon.fire();
			}else if (FlxG.keys.justReleased("SPACE")) {
				player.play("idle");
			}
			
			
			FlxG.collide(player, collisionMap);
			super.update();
			
			FlxG.overlap(trashGroup,trashGroup,separar);
			FlxG.overlap(weapon.group, trashGroup, eliminateObstacule);
			FlxG.overlap(player, coinsGroup, eliminateCoin);
			
			/*
			t += FlxG.elapsed;
			
			if (t >= 3)
			{
				t -= 3;
				add(new Coin(FlxMath.rand(20, 620), FlxMath.rand(20, 460)));
				trace("timer working");
			}
			
			FlxG.collide(_alien,map);
			super.update();
			*/
		}
		
		private function eliminateCoin(b:FlxSprite,e:Coin):void {
			coinsGroup.remove(e);
		}
		
		private function eliminateObstacule(b:FlxSprite,e:Obstaculo):void
		{
			/*
			if (!e.shot) {
				e.shot = true;
				var emitter:FlxEmitter = new FlxEmitter();
				emitter.makeParticles(Assets.shootExplode, 4);
				emitter.gravity = 400;
				emitter.at(b);
				add(emitter);
				emitter.start();
				score++;
				scoreText.text = score.toString();
				b.kill();
				e.velocity.y = 0;
				e.play("explocion");
			}
			*/
			
		}
		
		private function separar(e1:Obstaculo, e2:Obstaculo):void
		{
			if (e1.x < FlxG.width / 2) {
				e1.x += 1;
				
			}
			else
			{
				e1.x -= 1;	
			}
			
			
		}
		
		private function createCoins():void 
		{
			coinsGroup = new FlxGroup();
			var coinCreatorEarth:CoinCreator = new EarthCoin();
			var coinCreatorSpace:CoinCreator = new SpaceCoin();
			
			for (var i:int; i < 5; i++ )
			{
				_coin = coinCreatorEarth.createCoin("SilverEarthCoin");
				coinsGroup.add(_coin);
				_coin = coinCreatorEarth.createCoin("GoldEarthCoin");
				coinsGroup.add(_coin);
				/* -- */
				_coin = coinCreatorSpace.createCoin("SilverSpaceCoin");
				coinsGroup.add(_coin);
				_coin = coinCreatorSpace.createCoin("GoldSpaceCoin");
				coinsGroup.add(_coin);
			}
			
			add(coinsGroup);
			
		}
		
		private function createObstacules():void
		{
			trashGroup = new FlxGroup();
			
			for (var i:Number = 0; i < 5 ; i++ )
			{
				_trash = SimpleObstaculesFactory.createObstaculo("Trash");
				trashGroup.add(_trash);
			}
			
			add(trashGroup);
				
		}
		
		private function wrap(obj:FlxObject):void
		{
			obj.x = (obj.x + obj.width / 2 + FlxG.width) % FlxG.width - obj.width / 2;
			obj.y = (obj.y + obj.height / 2) % FlxG.height - obj.height / 2;
		}
		
	}

}