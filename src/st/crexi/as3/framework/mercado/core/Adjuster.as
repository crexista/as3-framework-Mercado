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

			_clientLine.push(_clients);
			return new Align(_clientLine);
		}
		
		
		public function get contain():Vector.<IClient>
		{
			var resultClients:Vector.<IClient> = new Vector.<IClient>;
			
			for each(var clients:Vector.<IClient> in _clientLine) {
				
				resultClients = resultClients.concat(clients)
			}
			return resultClients;
		}
		
		
		public function Adjuster()
		{
			_clientLine = new Array;
			_clients = new Vector.<IClient>;
		}
	}
}