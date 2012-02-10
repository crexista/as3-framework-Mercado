package st.crexi.as3.framework.mercado.core.utils
{
	import mx.controls.List;

	public class Signal
	{
		
		
		/**
		 * signal(文字列)をキーとした連想配列です
		 */
		private var _signalList:Object;


		/**
		 * signalをセットします
		 * @param value
		 * @return 
		 * 
		 */		
		public function set(value:String):CallBacks
		{
			var listener:CallBacks;
			_signalList[value] = new Vector.<Listener>;
			
			listener = new CallBacks(_signalList[value]);
			
			return listener;
		}
		
		
		
		/**
		 * コンストラクタです
		 * @param signalList
		 * 
		 */		
		public function Signal(signalList:Object)
		{
			_signalList = signalList;
		}
	}
}