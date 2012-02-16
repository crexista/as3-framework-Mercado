package st.crexi.as3.framework.mercado.core.utils
{
	import flash.utils.Dictionary;
	
	import st.crexi.as3.framework.cafe.utils.ImmutableObjectProxy;
	import st.crexi.as3.framework.mercado.core.interfaces.IAccessObject;

	/**
	 * orderの抽象クラスです
	 * @author crexista
	 * 
	 */	
	public class AbstAccessObject
	{
		

		/**
		 * 
		 */		
		private static var _classDic:Dictionary;
		
		
		private var _argument:*;
		
		private var _requests:*;
		
		
		private var _requestArr:Array;
		
		
		private var _rowRequest:*;
		
		
		/**
		 * requestsのオブジェクトを配列形式で返します
		 * @return 
		 * 
		 */
		public function get asArray():Array
		{
			return _requestArr;
		}
		
		
		/**
		 * requestlistの結果をObject形式で返します。
		 * なので、for eachが使えます。
		 * また、AbstOrder2の派生クラスでset requestしてください
		 * @return 
		 * 
		 */		
		public function get requests():*
		{			
			return _requests;
		}
		
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */		
		public function constructor(value:* = null):*
		{
			_argument = value;
			if(!_classDic) _classDic = new Dictionary;			
			
			if (_classDic[IAccessObject(this).requestListClass]) {
				_rowRequest = _classDic[IAccessObject(this).requestListClass];
				_requests = new ImmutableObjectProxy(_rowRequest);
				
			}
			else {
			
				if (value != null) {
					_rowRequest = new (IAccessObject(this).requestListClass)(value);
				}
				else {
					_rowRequest = new (IAccessObject(this).requestListClass)();
				}
			
				_classDic[IAccessObject(this).requestListClass] = _rowRequest;
			
				_requests = new ImmutableObjectProxy(_rowRequest);
			}
			_requestArr = new Array();
			for each(var target:* in _requests) {
				_requestArr.push(target);
			}
			
			try {
				this["requests"] = _rowRequest;
			}
			catch (error:Error) {
				//TODO Errorをきちんと書く
				throw new Error("set requestがorderクラスに描かれていません");
			}
			
			return this;
		}
		
		
	

		
		public function AbstAccessObject()
		{
		}

		
	}
}