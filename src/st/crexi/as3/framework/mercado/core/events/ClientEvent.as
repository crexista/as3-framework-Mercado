package st.crexi.as3.framework.mercado.core.events
{
	import flash.events.Event;
	
	import st.crexi.as3.framework.mercado.core.interfaces.IClient;
	
	/**
	 * クライアントの進行状況を伝えるイベントです
	 * このイベントが飛ばすステータス自体はClientStatusTypeで定義されているのでここには描きません
	 * @author crexista
	 * 
	 */	
	public class ClientEvent extends Event
	{
		
		/**
		 * このいべんとを投げているClientです
		 */		
		private var _client:IClient;
		
		/**
		 * コンストラクタです
		 * @param type
		 * 
		 */		
		public function ClientEvent(type:String, client:IClient)
		{
			super(type);
		}
		
		
		
		/**
		 * このイベントを投げているclientです
		 * @return 
		 * 
		 */		
		public function get client():IClient
		{
			return client;
		}
		

		/**
		 * 
		 * @return 
		 * 
		 */		
		override public function clone():Event
		{
			return new ClientEvent(type, _client);
		}
	}
}