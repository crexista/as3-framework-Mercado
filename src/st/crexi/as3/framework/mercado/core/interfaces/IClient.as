package st.crexi.as3.framework.mercado.core.interfaces
{
	import st.crexi.as3.framework.cafe.core.interfaces.IOrder;

	public interface IClient
	{
		/**
		 * 
		 * @param signal
		 * @param args
		 * 
		 */		
		function sendSignal(signal:String, ...args):void;
		
		
		/**
		 * クライアントのorderを実行する際に必要となる引数です
		 * @return 
		 * 
		 */		
		function get arguments():*
		
		
		/**
		 * このクライアントが持つrequestの配列を返します
		 * @return 
		 * 
		 */		
		function get order():IOrder;
	}
}