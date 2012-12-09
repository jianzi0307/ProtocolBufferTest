package com.pianfeng.engine.net.socket
{
	import com.pianfeng.engine.utils.security.ISecurity;
	
	import flash.events.ProgressEvent;
	import flash.utils.*;
	
	public class AMF3Socket extends AbstractSocket
	{
		private var FDebug: Boolean;
		
		public function AMF3Socket(security:ISecurity=null,isDebug: Boolean=false)
		{
			super(security);
			FDebug = isDebug;
			sock.endian = Endian.BIG_ENDIAN;
		}
	
		override public function send(data: Object): Boolean{
			if (sock.connected){
				if(FDebug) {
					trace("send pack--------->>");
					printObject(data); 
				}
				
				var buffer: ByteArray = new ByteArray();
				buffer.writeObject(data);
				
				this.sock.writeInt(data.cmd);
				this.sock.writeInt(buffer.length);
				this.sock.writeBytes(buffer);

				this.sock.flush();
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
                    if (length == -1 && sock.bytesAvailable >= 8){
                    	cmd = sock.readInt();
                    												
						length = sock.readInt();
                    }
                    if (length != -1 && sock.bytesAvailable >= length){
                        onDataRecv(length);
						
						cmd = -1;
                        length = -1;
                    }
                }while (length == -1 && sock.bytesAvailable >= 8)
            }
            catch (error:Error)
            {
                trace(error.message);
            }
           	return;
        }// end function
        
        override protected function onDataRecv(datalen: int): void {
        	var bytes: ByteArray = new ByteArray();
        	sock.readBytes(bytes,0,datalen);	
			var obj: Object = bytes.readObject();
			obj.cmd = cmd;
			
			if (FDebug){
				trace("recv pack--------->>");
				printObject(obj); 
			}
			handleData(obj);
		}	
		
		public function printObject(obj: Object,depth: int =0): void{
			if (obj == null) return;
			var str: String = "";
			for (var j:int = 0; j < depth; j++) str += "  ";
			for (var i: * in obj) {
				//if (obj is Array) {
				if(false){
					if ((obj[i] is int) || (obj[i] is Number) || (obj[i] is String)) trace(str, obj[i]);
					else {
						if (obj[i] is Array) trace(str + '[');
						else trace(str + '{');
						
						printObject(obj[i], depth + 1);
						
						if (obj[i] is Array) trace(str + ']');
						else trace(str + '}');
					}
				}
				else{
					if ((obj[i] is int) || (obj[i] is Number) || (obj[i] is String)) {
						//trace(i,obj[i],String(i),obj[i] as int);
						if (String(i) == "cmd") trace(str + '"' + i + '":', "0x"+(obj[i] as int).toString(16));
						else 
							trace(str + '"' + i + '":', obj[i]);
					}
					else {
						if (obj[i] is Array) trace(str + '"' + i + '":[');
						else trace(str + '"' + i + '":{');
						
						printObject(obj[i], depth + 1);
						
						if (obj[i] is Array) trace(str + ']');
						else trace(str + '}');
					}
				}
			}
		}
			
	}
}