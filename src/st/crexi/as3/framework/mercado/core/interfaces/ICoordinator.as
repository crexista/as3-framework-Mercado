package st.crexi.as3.framework.mercado.core.interfaces
{
	import st.crexi.as3.framework.mercado.core.Adjuster;
	import st.crexi.as3.framework.mercado.core.utils.Liner;

	/**
	 * coordinatorのインターフェースです
	 * @author kaoru_shibasaki
	 * 
	 */	
	public interface ICoordinator
	{
		
		/**
		 * イベント配線を行います
		 * @param liner
		 * @return 
		 * 
		 */		
		function bind(liner:Liner):Liner;
		
		/**
		 * clientの起動する順番を決めます
		 * @param adjuster
		 * @return 
		 * 
		 */		
		function clients(adjuster:Adjuster):Adjuster;
		
		
		/**
		 * メソッドを呼び出します
		 * @param client
		 * @param signal
		 * @param args
		 * @return 
		 * 
		 */		
		function call(client:IClient, signal:String, args:Array = null):Array;
		
		
		/**
		 * フレームワークそのものをスタートさせます
		 * TODO このメソッドでargumetを渡す様にできるか考慮
		 * 
		 */
		function start():void;
	}
}