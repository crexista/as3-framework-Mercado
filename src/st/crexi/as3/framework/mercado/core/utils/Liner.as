package st.crexi.as3.framework.mercado.core.utils
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	
	/**
	 * client同士のイベント配線をするクラスです
	 * @author crexista
	 * 
	 */
	public class Liner
	{
		
		
		/**
		 * クライアントをキーとしたcallBack辞書です
		 * _callBackDic[client] = {signalA:[methods, methods....], signalB:[methods, methods....], }という感じで入ってる
		 */		
		private var _callBackDic:Dictionary
		
		
		/**
		 * どのClientからSignalが送信されるのか指定します 
		 * @param client シグナルを飛ばすclientです
		 * @return signal
		 * 
		 */		
		public function from(client:IClient):Signal
		{
			if (!_callBackDic[client]) _callBackDic[client] = new Object;
			
			var signal:Signal = new Signal(_callBackDic[client]);
			
			return signal;
		}



		/**
		 * Clientとsignalを複合主キーにして
		 * そのClientから飛ばされるSignalの受け取り先が格納されたDictionaryをかえします
		 * 　
		 * @param client
		 * @param signal
		 * @return ClientをキーとしてSignalが格納された辞書クラスを返します
		 * 
		 */		
		public function registed(client:IClient, signal:String):Vector.<Listener>
		{
			var signals:Object = _callBackDic[client];
			return signals[signal];
		}


		/**
		 * コンストラクタです
		 * 
		 */		
		public function Liner()
		{
			_callBackDic = new Dictionary();
		}
	}
}