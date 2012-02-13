package st.crexi.as3.framework.mercado.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import st.crexi.as3.framework.cafe.core.Waiter;
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	import st.crexi.as3.framework.mercado.core.interfaces.ICoordinator;

	public class AbstClient
	{
			
		/**
		 * このクライアントを起動しているcoordinatorです
		 */		
		internal var $coordinator:ICoordinator
		
		
		/**
		 * orderの処理を請け負っているwaiterです
		 */		
		private var _waiter:Waiter;
		
		/**
		 * clientの状態です
		 */		
		internal var $status:String;
		
		
		/**
		 * 
		 */		
		private var _statusInfo:IEventDispatcher
		
		final public function sendSignal(signal:String, ...args):void
		{
			$coordinator.call(IClient(this), signal, args);
		}
		
		
		/**
		 * requestを一気にスタートさせます
		 * 
		 */		
		final public function start():void
		{
			IClient(this).order.start(IClient(this).arguments);
		}
		
		
		/**
		 * クライアントの状態を返します.
		 * ClientStatusTypeクラスを使ってください
		 * @return 
		 * 
		 */		
		final public function get status():String
		{
			return $status 
		}
		
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		final public function get statusInfo():IEventDispatcher
		{
			return _statusInfo;
		}

		
		
		/**
		 * コンストラクタ
		 * TODO このまま呼び出したらErrorを飛ばす様に変更
		 * 
		 */		
		public function AbstClient()
		{
			_statusInfo = new EventDispatcher();
		}
		
	}
}