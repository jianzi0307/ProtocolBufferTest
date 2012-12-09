package com.jfw.engine.net.nc
{
	import flash.events.AsyncErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;

	public class RequestAMF 
	{
		private var netConnection:NetConnection = null;
		private var callback:Function = null;
		private var vo:NetVO = null;
		
		public function RequestAMF() 
		{
			netConnection =  new NetConnection();
			netConnection.client = this;
		}
		
		public function sendRequest( server:String, vo:NetVO, callback:Function ):void
		{
			addEvent();
			
			this.vo = vo;
			this.callback = callback;
			netConnection.connect( server );
			netConnection.call( vo.sendCommand, new Responder( onResult, onFault ), vo.sendParams );
		}

		//{ code:0,data:xxx,ts:10000000 }
		public function onResult( param:Object ):void
		{
			removeEvent();

			if( !param || !param.hasOwnProperty( 'code' ) || !param.hasOwnProperty('ts') || !param.hasOwnProperty( 'data' ) )
			{
				throw Error("协议格式错误,正确格式：{ code:0,data:protobuf data,ts:1234567890 }");
				return;
			}
			
			var err:String				= ( param.code != 0 ) ? 'error_protocol_fault' : '';
			var errno:int				= int( param.code );
			
			vo.returnResult		= Boolean( err.length == 0 );
			vo.returnError		= err;
			vo.returnErrorNumber = errno;
			vo.returnErrorType	= vo.returnResult ? NetErrorType.NO_ERROR : NetErrorType.PROTOCOL_ERROR;
			vo.returnParams		= param ? param : null;
			
			callback( vo );

		}
		
		public function onFault( param:Object ):void
		{
			removeEvent();
			
			vo.returnResult		= false;
			vo.returnError		= 'error_system_fault';
			vo.returnErrorType	= NetErrorType.SERVER_ERROR;
			vo.returnParams		= {};
			
			callback( vo );
		}
		
		protected function onIOError( param:IOErrorEvent ):void
		{
			removeEvent();
			
			vo.returnResult		= false;
			vo.returnError		= 'error_system_io_error';
			vo.returnErrorType	= NetErrorType.NET_ERROR;
			vo.returnParams		= {};
			
			callback( vo );
		}
		
		protected function onNetStatus( param:NetStatusEvent ) : void
		{
			removeEvent()
			
			vo.returnResult		= false;
			vo.returnError		= 'error_system_net_status';
			vo.returnErrorType	= NetErrorType.NET_ERROR;
			vo.returnParams		= {};
			
			callback( vo );
		}
		
		protected function onSecurityError( param:SecurityErrorEvent ) : void
		{
			removeEvent()
			
			vo.returnResult		= false;
			vo.returnError		= 'system_security';
			vo.returnErrorType	= NetErrorType.NET_ERROR;
			vo.returnParams		= {};
			
			callback( vo );
		}
		
		protected function onAsyncError( param:AsyncErrorEvent ) : void
		{
			removeEvent()
			
			vo.returnResult		= false;
			vo.returnError		= 'error_system_async';
			vo.returnErrorType	= NetErrorType.NET_ERROR;
			vo.returnParams		= {};
			
			callback( vo );
		}
		
		private function addEvent():void
		{
			netConnection.addEventListener( NetStatusEvent.NET_STATUS, onNetStatus );
			netConnection.addEventListener( IOErrorEvent.IO_ERROR, onIOError );
			netConnection.addEventListener( AsyncErrorEvent.ASYNC_ERROR, onAsyncError );
			netConnection.addEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityError );
		}
		
		private function removeEvent():void
		{
			netConnection.removeEventListener( NetStatusEvent.NET_STATUS, onNetStatus );
			netConnection.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			netConnection.removeEventListener( AsyncErrorEvent.ASYNC_ERROR, onAsyncError );
			netConnection.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityError );
		}
		
	}

}