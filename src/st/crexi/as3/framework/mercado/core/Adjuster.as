package st.crexi.as3.framework.mercado.core
{
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	import st.crexi.as3.framework.mercado.core.utils.Align;

	public class Adjuster
	{
		
		
		private var _clientLine:Array;
		
		
		private var _clients:Vector.<IClient>
		
		
		
		public function beginings(clients:Array):Align
		{
			_clients = Vector.<IClient>(clients);
			for each(var client:AbstClient in clients) {
				client.$start();
			}
			_clientLine.push(_clients);
			return new Align(_clientLine);
		}
		
		
		public function get contain():Vector.<IClient>
		{
			var resultClients:Vector.<IClient> = new Vector.<IClient>;
			
			for each(var clients:Vector.<IClient> in _clientLine) {
				trace("client is ", clients.length);
				resultClients = resultClients.concat(clients)
			}
			trace(resultClients.length);
			return resultClients;
		}
		
		
		public function Adjuster()
		{
			_clientLine = new Array;
			_clients = new Vector.<IClient>;
		}
	}
}