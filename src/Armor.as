package  
{
	/**
	 * ...
	 * @author Christian Campos y Danny Espinoza
	 */
	public class Armor extends AditionalBlindage {

		public Armor(blindage:Blindage){
			this.blindage = blindage;
		}
		
	
		override public getPrecio():int {
			return blindage.getPrecio() + 60;
		}

		
		override public getDescripion():String {
			return blindage.getDescripion();
		}
		

	}

}