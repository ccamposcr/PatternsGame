package  
{
	/**
	 * ...
	 * @author Christian Campos y Danny Espinoza
	 */
	public class Shield extends AditionalBlindage {

		public Shield(blindage:Blindage){
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