package  {
	/**
	 * ...
	 * @author Danny Espinoza y Christian Campos
	 */
	import org.flixel.*;
	import flash.errors.IllegalOperationError;
	
	public class CoinCreator 
	{
		public function createCoin(ptipo:String):Coin {
			throw new IllegalOperationError("Abstract method:must be overridden in a subclass");
			return null;
		}
	}

}