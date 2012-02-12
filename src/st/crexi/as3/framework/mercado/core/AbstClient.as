package st.crexi.as3.framework.mercado.core
{
	import st.crexi.as3.framework.cafe.core.Waiter;
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	import st.crexi.as3.framework.mercado.core.interfaces.ICoordinator;

	public class AbstClient
	{
				
		internal var $coordinator:ICoordinator
		
		
		private var _waiter:Waiter;
		
		final public function sendSignal(signal:String, ...args):void
		{
			$coordinator.call(IClient(this), signal, args);
		}
		
		
		/**
		 * requestを一気にスタートさせます
		 * 
		 */		
		final internal function $start():void
		{
			IClient(this).order.start(IClient(this).arguments);
		}

		
		public function AbstClient()
		{
			
		}
		
	}
}