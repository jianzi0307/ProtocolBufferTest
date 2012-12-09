package com.jfw.engine.net.nc
{
	public class NetManager
	{
		private static var instance:NetManager = null; 
		private const SINGLETON_MSG:String = "NetManager Singleton already constructed!";
		
		private var currentKey:int = 0;
		private var requestList:Object = { };
		
		public function NetManager()
		{
			if ( null != instance ) 
				throw Error( SINGLETON_MSG );
			instance = this;
		}
		
		public static function getInstance():NetManager
		{
			if ( null == instance )
				instance = new NetManager();
			return instance;
		}
		
		public function call( server:String, command:String, param:Object=null, callback:Function=null ):int
		{
			++currentKey;
			var vo:NetVO = new NetVO();
			vo.id = currentKey;
			vo.sendCommand = command;
			
//			if(command == NetConst.overBattle)
//			{
//				var netProxy:NetProxy=Facade.getInstance().retrieveProxy(NetProxy.NAME) as NetProxy;
//				param['ts']=netProxy.getSysTime();
//				vo.sendParams = JSON.encode({ 'data':DesHelper.Encrypt(JSON.encode(param)),'ts':netProxy.getSysTime() });
//			}
// 			else
//			{
				vo.sendParams = param//JSON.stringify(param);
//			}
			
			vo.callback	= callback;
			
			var request:RequestAMF = new RequestAMF();
			request.sendRequest( server, vo, requestCallback );	
			requestList[ currentKey ] = { vo:vo };
			return currentKey;
		}
		
		private function requestCallback( vo:NetVO ):void
		{
			vo.callback( vo );
			delete this.requestList[ vo.id ];
		}
	}
}