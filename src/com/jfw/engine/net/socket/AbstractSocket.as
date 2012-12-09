package com.pianfeng.engine.net.socket {
	/**
	 * SOCKET虚拟类
	 * 
	 */	
	import com.pianfeng.engine.global.events.SocketDataEvent;
	import com.pianfeng.engine.utils.security.ISecurity;
	
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;

    public class AbstractSocket extends EventDispatcher{
        private var port:int;
        public var sock: Socket;
        protected var length:int = -1;
		protected var cmd: int = -1;
        private var host:String;
        private var isConnected:Boolean;
		protected var FSecurity: ISecurity;
		
		/**
		 * @param security 	数据加密方式
		 */
        public function AbstractSocket(security: ISecurity=null){
			if (getQualifiedClassName(this) == "com.jayxsjf.socket::AbstractSocket") {
				throw new ArgumentError("AbstractSocket can't be instantiated directly");
			}
			
			FSecurity = security;
            this.isConnected = false;
            sock = new Socket();
            sock.endian = Endian.LITTLE_ENDIAN;
            initListener();
        }// end function

        protected function onIOError(event:IOErrorEvent): void{
           connectFail(event.text);
        }// end function

        public function get connected(): Boolean{
            return this.isConnected;
        }// end function

        public function connect(host:String, port:int):void{
            this.host = host;
            this.port = port;
            sock.connect(host,port);
        }// end function

        private function initListener(): void{
            sock.addEventListener(Event.CONNECT, onConnect);
            sock.addEventListener(Event.CLOSE, onServerClose);
            sock.addEventListener(ProgressEvent.SOCKET_DATA, onData);
            sock.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
            sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
        }// end function
		
        protected function onConnect(event:Event): void{
            this.isConnected = true;
			trace("connect");
        }// end function

        protected function onServerClose(event:Event) : void{
			this.isConnected = false;
			var evt: SocketDataEvent = new SocketDataEvent(SocketDataEvent.SOCKET_CONNECT_CLOSE_EVENT);
			evt.sockData = null;
			evt.errtext = "server close client";
			dispatchEvent(evt);			
        }// end function

        public function close(): void{
            sock.removeEventListener(Event.CONNECT, onConnect);
            sock.removeEventListener(Event.CLOSE, onServerClose);
            sock.removeEventListener(ProgressEvent.SOCKET_DATA, onData);
            sock.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
            sock.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
            if (sock.connected){
                sock.close();
            }
            this.isConnected = false; 
        }// end function
		
		public function send(data: Object): Boolean{
			return false;
		}
		
		protected function onSendFail(data: Object): void{
			var evt: SocketDataEvent = new SocketDataEvent(SocketDataEvent.SOCKET_SEND_FAIL_EVENT);
			evt.sockData = data;
			dispatchEvent(evt);
		}

        protected function onSecurityError(event:SecurityErrorEvent) : void{
            connectFail(event.text);
        }// end function

        protected function onData(event:ProgressEvent) : void
        {
            try
            {
                do
                {                    
                    if (length == -1 && sock.bytesAvailable >= 2){											
						length = sock.readShort();
                    }
                    if (length != -1 && sock.bytesAvailable >= length){
                        onDataRecv(length);
						
						cmd = -1;
                        length = -1;
                    }
                }while (length == -1 && sock.bytesAvailable >= 2)
            }
            catch (error:Error)
            {
                trace(error.message);
            }
           	return;
        }// end function
		
		protected function onDataRecv(datalen: int): void {
			;
		}
		
		private function connectFail(err: String): void{
			trace("connect fail",err);
			var evt: SocketDataEvent = new SocketDataEvent(SocketDataEvent.SOCKET_CONNECT_FAIL_EVENT);
			evt.sockData = null;
			evt.errtext = err;
			dispatchEvent(evt);
		}
		
		protected function handleData(data: Object): void{
			var evt: SocketDataEvent = new SocketDataEvent(SocketDataEvent.SOCKET_DATA_RECV_EVENT);
			evt.sockData = data;
			dispatchEvent(evt);
		}
    }
}
