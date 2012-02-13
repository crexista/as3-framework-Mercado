package st.crexi.as3.framework.mercado.core
{
	import flash.errors.IllegalOperationError;

	/**
	 * ClientのStatusのタイプです
	 * @author kaora_crexista
	 * 
	 */	
	public class ClientStatusType
	{
		
		/**
		 * 何もしていない状態です。初期状態
		 */		
		public static const IDLE:String = "idle";
		
		
		/**
		 * clientが起動時にやっておかなければいけない処理を行っている最中です
		 * 
		 */		
		public static const INVOKING:String = "invoking";
		
		
		/**
		 * clientが起動処理が終了した状態です
		 */		
		public static const RUNNING:String = "running";
		
		
		/**
		 * コンストラクタです
		 * このクラスはStaticなtypeだけを持つクラスなのでnewをするとエラーが飛びます
		 * 
		 */		
		public function ClientStatusType()
		{
			throw new IllegalOperationError("ClientStatuTypeクラスはnewできません");
		}
	}
}