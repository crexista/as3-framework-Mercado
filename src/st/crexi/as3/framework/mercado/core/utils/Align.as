package st.crexi.as3.framework.mercado.core.utils
{
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;

	public class Align
	{
		private var _clientLine:Array;
		
		
		public function next(clients:Array):Align
		{
			_clientLine.push(Vector.<IClient>(clients));
			return this;
		}
		
		public function Align(clientLine:Array)
		{
			_clientLine = clientLine;
		}
	}
}