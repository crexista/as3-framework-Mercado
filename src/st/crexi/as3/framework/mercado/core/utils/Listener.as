package st.crexi.as3.framework.mercado.core.utils
{
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;

	[ExcludeClass]
	public class Listener
	{
		
		/**
		 * コールバック関数です
		 */		
		private var _method:Function;
		
		
		/**
		 * このクライアントの準備が完了するまで待ちます
		 */		
		private var _waitTarget:*;
		
		
		
		/**
		 * 準備が完了するまでにどれだけのqueを溜め込むかです
		 */		
		private var _maxQueNum:uint;
		
		
		public function get method():Function
		{
			return _method;
		}
		
		
		
		public function get waitTarget():IClient
		{
			return _waitTarget;
		}
		
		
		
		public function get maxQueNum():uint
		{
			return _maxQueNum;
		}
		
		public function Listener(method:Function, waitTarget:* = null, maxQueNum:uint = 0)
		{
			//TODO あとでFrameworkErrorを作る
			if (method == null) throw new Error();
			
			_method = method;
			_waitTarget = waitTarget;
			_maxQueNum = maxQueNum;
		}
	}
}