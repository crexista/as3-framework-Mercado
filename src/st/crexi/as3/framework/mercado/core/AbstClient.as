package st.crexi.as3.framework.mercado.core
{
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	import st.crexi.as3.framework.mercado.core.interfaces.ICoordinator;

	public class AbstClient
	{
		internal var $coordinator:ICoordinator
		
		final public function sendSignal(signal:String, ...args):void
		{
			$coordinator.call(IClient(this), signal, args);
		}

		
		public function AbstClient()
		{
		}
		
	}
}