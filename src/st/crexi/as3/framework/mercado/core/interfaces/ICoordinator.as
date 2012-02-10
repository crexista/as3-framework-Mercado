package st.crexi.as3.framework.mercado.core.interfaces
{
	import st.crexi.as3.framework.mercado.core.Adjuster;
	import st.crexi.as3.framework.mercado.core.utils.Liner;

	public interface ICoordinator
	{
		function bind(liner:Liner):Liner;
		
		function clients(adjuster:Adjuster):Adjuster;
		
		function call(client:IClient, signal:String, args:Array = null):Array;
	}
}