package  com.jfw.engine.net.nc
{
	import flash.utils.ByteArray;

	public class NetVO 
	{
		/** id */
		public var id:int = 0;
		
		/** 请求命令 */
		public var sendCommand:String = '';
		
		/** 请求参数 */
		public var sendParams:Object = {};
		
		/** 返回是否成功 */
		public var returnResult:Boolean	= false;
		
		/** 返回错误内容 */
		public var returnError:String = '';
		
		/** 返回错误码 */
		public var returnErrorNumber:int = 0;
		
		/** 返回错误类型 1.服务器返回的错误 2.与服务器通信失败 */
		public var returnErrorType:int = 0;
		
		/** 返回参数 */
		public var returnParams:Object	= { };
		
		/** 调节回调函数 */
		public var callback:Function = null;
		
		/** 调用开始时间 */
		public var startTime:Number = 0;
		
		/** 调用完成时间 */
		public var endTime:Number = 0;
		
		/** 本次调用花费时间 */
		public function get useTime():Number
		{
			return endTime - startTime;
		}
		
		public function NetVO() 
		{
			
		}
	}
}