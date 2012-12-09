package com.jfw.engine.core.base
{

	/** 被观察者 */
	public class Observable implements ISender
	{
		private static var instance:Observable; 
		private static const SINGLETON_MSG:String = "Observable Singleton already constructed!";
		
		/** 观察者列表 */
		private static var obServers:Object = { };
		
		public function Observable()
		{
			if ( null != instance ) 
				throw Error( SINGLETON_MSG );
			instance = this;
		}
		
		public static function getInstance():Observable
		{
			if ( null == instance )
				instance = new Observable();
			return instance as Observable;
		}
		
		/** 注册观察者对象 */
		public function regObServer( evt:String, obServer:IObServer ):void
		{
			if ( !obServers[evt] )
				obServers[evt] = [];
			for each ( var ob:IObServer in obServers[evt] )
			{
				if ( ob == obServer )
					return;
			}
			obServers[evt].push( obServer );
		}
		
		/** 注销观察者对象 */
		public function unregObserver( evt:String, obServer:IObServer ):void
		{
			if ( !obServers[evt] )
				return;
			for each ( var ob:IObServer in obServers[evt] )
			{
				if ( ob == obServer )
				{
					obServers[evt].splice( obServers[evt].indexOf( obServer ), 1 );
					break;
				}
			}
		}
		
		/** 向观察者发送通知 */
		public function sendEvent( evt:String, param:Object=null ):void
		{
			if ( !obServers[evt] )
				return;
			for each ( var ob:IObServer in obServers[evt] )
				ob.update( evt, param );
		}
	}
}