package  
{
	/**
	 * ...
	 * @author Christian Campos y Danny Espinoza
	 */
	public class Blindage {

		public function getLevelProtection():int {
			throw new IllegalOperationError("Abstract method:must be overridden in a subclass");
			return null;
		}
		
		public function getDescripion():String {
			throw new IllegalOperationError("Abstract method:must be overridden in a subclass");
			return null;
		}
		
	}

}