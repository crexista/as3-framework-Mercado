package st.crexi.as3.framework.mercado.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import st.crexi.as3.framework.cafe.core.Event.WaiterEvent;
	import st.crexi.as3.framework.cafe.core.Waiter;
	import st.crexi.as3.framework.mercado.core.events.ClientEvent;
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	import st.crexi.as3.framework.mercado.core.interfaces.ICoordinator;

	public class AbstClient
	{
			
		/**
		 * このクライアントを起動しているcoordinatorです
		 */		
		internal var $coordinator:ICoordinator
		
		

		
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
			var requestArray:Array = IClient(this).requests($coordinator.apis);

			if (requestArray == null || requestArray.length == 0) {
				$status = ClientStatusType.RUNNING;
				_statusInfo.dispatchEvent(new ClientEvent(ClientStatusType.RUNNING, IClient(this)));
				return;
			}
			var waiter:Waiter = new Waiter();
			
			waiter.notifier.addEventListener(WaiterEvent.ALL_COMPLETE, onComplete);
			waiter.start(requestArray);
		}
		
		protected function onComplete(event:WaiterEvent):void
		{
			$status = ClientStatusType.RUNNING;
			_statusInfo.dispatchEvent(new ClientEvent(ClientStatusType.RUNNING, IClient(this)));
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