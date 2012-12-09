package com.jfw.engine.utils
{
	import flash.utils.getTimer;

	/**
	 * 服务器时间
	 * 
	 */
	public class ServiceDate
	{
		static private var _instance:ServiceDate;
		
		/**
		 * 获取时间模式 0:用Date计算偏移 1:用getTimer偏移
		 */
		public var mode:int;
		
		//时间偏移量 ( 毫秒数)
		private var offest:Number = 0; 
		
		//上次的服务器时间与getTimer的偏移（毫秒数)
		private var prevServiceOffest:Number;
		
		
		static public function get instance():ServiceDate
		{
			if (!_instance)
				_instance = new ServiceDate();
			
			return _instance;
		}
		
		/**
		 * 根据秒数返回时分秒
		 * 00:00:00格式 
		 * @param ts
		 * @param flag	返回00:00 false返回00:00:00
		 * @return 
		 * 
		 */
		public function getTimeStr(ts:int,flag:Boolean = false):String
		{
			var h:String = formatNumber(Math.floor(ts/3600),2);
			var m:String = formatNumber(Math.floor(ts/60) % 60,2);
			var s:String = formatNumber(Math.floor(ts%60),2);
			if(flag)
				return m + ":" + s;
			else
				return h + ":" + m + ":" + s;
		}
		
		/**
		 * 
		 * @param serviceTime 服务器时间
		 * 
		 */
		public function ServiceDate(serviceTime:Number = NaN,mode:int = 0)
		{
			_instance = this;
			
			this.mode = mode;
			
			if (!isNaN(serviceTime))
				this.setServiceTime(serviceTime);
		}
		
		/**
		 * 设置服务器时间 
		 * @param serviceTime （秒数）
		 * 
		 */
		public function setServiceTime(serviceTime:Number):void
		{
			offest = new Date().time - serviceTime * 1000;
			prevServiceOffest = serviceTime - getTimer();
		}
		
		/**
		 * 返回服务器时间
		 * @return 返回一个Date对象
		 * 
		 */
		public function getDate():Date
		{
			return new Date( getTime() );
		}
		
		/**
		 * 返回服务器时间（毫秒数）
		 * @return 返回一个Number
		 * 
		 */
		public function getTime():Number
		{
			if (mode == 0)
				return new Date().time - offest;
			else
				return isNaN(prevServiceOffest) ? new Date().time: prevServiceOffest + getTimer();
		}
		
		/**
		 * 当前服务器小时数 
		 * @return 
		 * 
		 */
		public function getHour():Number
		{
			//当前服务器时间
			var date:Date = getDate();
			return date.hours;
		}
		
		/**
		 *  在数字前补0，并转为字符串
		 * 
		 *  1->'01',8->'008',16->'016',56->'056'
		 * 
		 * @param num   数字
		 * @param count 位数
		 * @return 
		 */		
		private function formatNumber(num:int,count:int):String
		{
			var len:int = num.toString().length;
			var sub:int = count - len;
			if(sub > 0)
			{
				var str:String = num.toString();
				for(var i:int = sub;i>0;i--)
				{
					str = '0' + str; 
				}
				return str;
			}
			return num.toString();
		}
	}
}