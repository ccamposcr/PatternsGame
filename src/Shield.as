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
		
		
		override public getLevelProtection():int {
			return blindage.getLevelProtection() + 60;
		}

	
		override public getDescripion():String {
			return blindage.getDescripion();
		}
		

	}

}