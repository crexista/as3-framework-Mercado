package st.crexi.as3.framework.mercado.core.utils
{
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	
	/**
	 * コールバックメソッドを指定するだけのクラスです
	 * @author crexista
	 * 
	 */	
	[ExcludeClass]
	public class CallBacks
	{		
		
		/**
		 * コールバック関数が詰め込まれた配列です
		 */		
		private var _methodVec:Vector.<Listener>;
		
		
		/**
		 * コールバック関数をしていします<br>
		 * waitTargetにclientが入っている場合はそのclientが完全に起動し終わるのを待ってからコールバック関数を実行します
		 * 
		 * @param method コールバック関数です
		 * @param waitTarget 
		 * @param que
		 * @return 
		 * 
		 */		
		public function add(method:Function, waitTarget:IClient = null, que:uint = 0):CallBacks
		{
			var methods:Listener = new Listener(method, waitTarget, que);
			
			_methodVec.push(methods);
			
			return this;
		}
		
		
		
		/**
		 * コンストラクタ
		 * @param methodVec
		 * 
		 */		
		public function CallBacks(methodVec:Vector.<Listener>)
		{
			_methodVec = methodVec;
		}
	}
}