package st.crexi.as3.framework.mercado.core
{
	import flash.utils.Dictionary;
	
	import st.crexi.as3.framework.mercado.core.events.ClientEvent;
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
		 * 
		 */		
		private var _methodDic:Dictionary;
		
		
		
		
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
				
				if (client.status != ClientStatusType.RUNNING) {
					if (!method.waitTarget.statusInfo.hasEventListener(ClientStatusType.RUNNING)) {					
						method.waitTarget.statusInfo.addEventListener(ClientStatusType.RUNNING, onResolved);
					}
					
					if (!_methodDic[method.waitTarget]) _methodDic[method.waitTarget] = new Vector.<QueMethod>;
					
					_methodDic[method.waitTarget].push(new QueMethod(method.method, args));
					continue;
				}
				
				results.push(method.method.apply(null, args));				
			}

			
			return results;	
		}
		
		
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		protected function onResolved(event:ClientEvent):void
		{
			var funcs:Vector.<QueMethod> = _methodDic[event.client];
			
			for each(var method:QueMethod in funcs) {
				method.func.apply(null, method.args);
			}
			
			event.client.statusInfo.removeEventListener(ClientStatusType.RUNNING, onResolved);
		}
		
		
		/**
		 * cooridnator内部で起動されたclient群を指定された順番通りに起動します
		 * 
		 */		
		final public function start():void
		{
			
			_adjuster = ICoordinator(this).clients(_adjuster);
			_liner = ICoordinator(this).bind(_liner);
			
			for each(var client:AbstClient in _adjuster.contain) {
				client.$coordinator = ICoordinator(this);
				client.start();
			}						
		}
		
		
		
		/**
		 * コンストラクタです
		 * 
		 */
		public function AbstCoordinator()
		{
			_adjuster = new Adjuster();
			_liner = new Liner();
			
		}
		
		
	}
}


class QueMethod
{
	private var _func:Function;
	public function get func():Function
	{
		return func;
	}
	
	
	private var _args:Array;
	public function get args():Array 
	{		
		return _args;
	}
	
	public function QueMethod(method:Function, args:Array) 
	{
		_func = method;
		_args = args;
	}
}