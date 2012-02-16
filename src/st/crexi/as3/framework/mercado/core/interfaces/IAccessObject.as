package st.crexi.as3.framework.mercado.core.interfaces
{
	public interface IAccessObject
	{
		/**
		 * requestのListを取得します
		 * @return 
		 * 
		 */		
		function get requests():*;
		
				
		
		/**
		 * reqestリストを配列形式にして返します
		 * @return 
		 * 
		 */		
		function get asArray():Array;
		
		
		/**
		 * requestをまとめたリクエストクラスの暮らすオブジェクトです
		 * @return 
		 * 
		 */		
		function get requestListClass():Class;
		

		/**
		 * 
		 * @param value
		 * 
		 */		
		function constructor(value:* = null):*;
	}
}