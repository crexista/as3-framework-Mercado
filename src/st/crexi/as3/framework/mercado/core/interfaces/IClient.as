package st.crexi.as3.framework.mercado.core.interfaces
{
	import flash.events.IEventDispatcher;
		

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
		 * このクライアントが持つrequestの配列を返します
		 * @return 
		 * 
		 */		
		function requests(apis:IAccessObject):Array;
		
		
		/**
		 * clientの状態を返します
		 * @return 
		 * 
		 */		
		function get status():String;
		
		
		
		/**
		 * clientのstatus状態を返すEventDispatcherです
		 * @return 
		 * 
		 */		
		function get statusInfo():IEventDispatcher;
		
		
		
		/**
		 * クライアントにつまれたorderをスタートさせます
		 * orderが既にstartしていた場合は何もしません
		 * 
		 */		
		function start():void;
	}
}