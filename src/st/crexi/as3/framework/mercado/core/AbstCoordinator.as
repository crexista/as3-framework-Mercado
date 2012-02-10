package st.crexi.as3.framework.mercado.core
{
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	import st.crexi.as3.framework.mercado.core.interfaces.ICoordinator;
	import st.crexi.as3.framework.mercado.core.utils.Liner;
	import st.crexi.as3.framework.mercado.core.utils.Listener;

	
	/**
	 * Coordinatorの抽象クラスです。
	 * clientからcallで呼ばれた場合のソッドが実装されています
	 * @author crexista
	 * 
	 */
	public class AbstCoordinator
	{
		
		/**
		 * 各clientから飛んできたsignalの配線を行うクラスインスタンスです
		 */		
		private var _liner:Liner;
		
		/**
		 * clientの実行順序、clientそのものを格納するクラスインスタンスです 
		 */		
		private var _adjuster:Adjuster;
		
		
		/**
		 * clientのsendSignalから飛ばされたsignalを受け取って実行します
		 * 
		 * TODO wait機構がないので作る
		 * 
		 * @param client : signalの飛ばし元のClientです
		 * @param signal : signalです
		 * @param args : 飛ばしもとから飛んでくる引数です
		 * @return : 行われたメソッドの実行結果がはいった配列です 
		 * 
		 */		
		final public function call(client:IClient, signal:String, args:Array = null):Array
		{
			var methods:Vector.<Listener> = _liner.registed(client, signal);
			var results:Array = new Array;
			
			for each(var method:Listener in methods) {
				results.push(method.method.apply(null, args));
			}
			
			return results;
		}
		
		
		
		/**
		 * コンストラクタです
		 * 
		 */
		public function AbstCoordinator()
		{
			_adjuster = new Adjuster();
			_liner = new Liner();
			
			_adjuster = ICoordinator(this).clients(_adjuster);
			_liner = ICoordinator(this).bind(_liner);
			var obj:Object = _adjuster.contain;
			for each(var client:AbstClient in _adjuster.contain) {
				client.$coordinator = ICoordinator(this);
			}
			
		}
		
	}
}