package com.jfw.engine.core.data
{
	import flash.utils.ByteArray;

	/** 数据结构基类 */
	public class BaseStruct extends Object implements IStruct
	{
		public function BaseStruct(obj:Object = null)
		{
			if(obj != null)
				this.parse(obj);
		}
		
		public function clone():Object
		{
			return BaseStruct.clone( this );
		}
		
		/** 用Object实例初始化本类实例 */
		protected function parse(obj:Object):void
		{
			
		}
		
		public static function clone(value:Object):Object
		{
			var so:ByteArray = new ByteArray();
			so.writeObject(value);
			
			so.position = 0;
			return so.readObject();
		}
	}
}