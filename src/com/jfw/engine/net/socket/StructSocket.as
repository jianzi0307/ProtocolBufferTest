package com.pianfeng.engine.net.socket
{
	import com.pianfeng.engine.utils.security.ISecurity;
	import com.pianfeng.engine.geom.traninfo.TranInfo;
	
	import flash.events.ProgressEvent;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	public class StructSocket extends AbstractSocket
	{
		private var FDebug: Boolean;
		
		public function StructSocket(security:ISecurity=null,isDebug: Boolean=false)
		{
			FDebug = isDebug;
			super(security);
		}
		
		override public function send(data: Object): Boolean{
			if (!(data is TranInfo)) return false; 
			if (sock.connected){
				var buff: ByteArray = (data as TranInfo).TranInfo2ByteArray();
				sock.writeBytes(buff,0,buff.length);
				sock.flush();
				return true;
			}
			else{
				onSendFail(data);
				return false;
			}
		}
		
		override protected function onData(event:ProgressEvent) : void
        {
            try
            {
                do
                {                    
                    if (length == -1 && sock.bytesAvailable >= 2){											
						length = sock.readShort()-2;
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
		
		override protected function onDataRecv(datalen: int): void {
			var bytes: SocketByteArray = new SocketByteArray();
			bytes.endian = Endian.LITTLE_ENDIAN;
			
			var cmd: int = sock.readShort();
            sock.readBytes(bytes, 0, datalen - 2);	
			
			var obj: Object = BufferAnalysis(bytes);
			
			if (FDebug) printObject(obj); 
			handleData(obj);
		}	
		
		protected function BufferAnalysis(buff: SocketByteArray): Object{
			var obj: Object;
			switch(cmd){
				case 1001:
					obj = CM_LOGIN_REP_OPRE(buff);
					break;
				default: return null;
			}
			
			return obj;
		}
		
		private function CM_LOGIN_REP_OPRE(bytes: SocketByteArray): Object{
			var obj: Object = new Object();
			bytes.position = 0;
			obj.param1 = bytes.readInt();
			obj.param2 = bytes.readShort();
			obj.param3 = bytes.readByte();

			obj.param4 = bytes.readStringArray();
			
			obj.param5 = bytes.readUnsignedInt();
			obj.param6 = bytes.readString();
			obj.param7 = bytes.readString();
			
			obj.param8 = bytes.readShortArray();
			
			return obj;
		}
		
		private function printObject(obj: Object): void{
			if (obj == null) return;
			for(var i: * in obj){
				trace(i,obj[i]);
			}
		}
	}
}