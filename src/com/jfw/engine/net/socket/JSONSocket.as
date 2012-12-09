package com.pianfeng.engine.net.socket 
{
	import com.pianfeng.engine.utils.json.JSON;
	import com.pianfeng.engine.utils.security.ISecurity;
	
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.Timer;
	
	/**
	 * 
	 */
	public class JSONSocket extends AbstractSocket
	{
		private var FDebug: Boolean;
		
		//private var FTimer: Timer;
		//private var FSendQueue: Array;
		
		public function JSONSocket(security: ISecurity=null,isDebug: Boolean=false) 
		{
			/*FSendQueue = [];
			FTimer = new Timer(50);
			FTimer.addEventListener(TimerEvent.TIMER,onSendTimerHandle);
			FTimer.start();*/
			FDebug = isDebug;
			super(security);
		}
		
		private function onSendTimerHandle(evt: TimerEvent): void{
			;
		}
		
		override public function send(data: Object): Boolean{
			if (sock.connected){
				var buffStr: String = JSON.encode(data);
				if(FDebug) trace(buffStr);
				if (FSecurity != null)	buffStr = FSecurity.encode(buffStr);
				var buffer: ByteArray = new ByteArray();
				buffer.writeUTFBytes(buffStr);

				flush(buffer,data.cmd);
				return true;
			}
			else{
				onSendFail(data);
				return false;
			}
		}
		
		protected function flush(buff: ByteArray,cmd: int): void{
			this.sock.writeShort(buff.length+2);
			this.sock.writeShort(cmd);
			this.sock.writeBytes(buff,0,buff.length);
			this.sock.flush();
		}
		
		override protected function onDataRecv(datalen: int): void {
			var bytes: ByteArray = new ByteArray();
			
			var cmd: int = sock.readShort();
            sock.readBytes(bytes, 0, datalen - 2);	
			var bufferStr: String = bytes.readUTFBytes(bytes.length);
			if(FDebug) trace(bufferStr);
			if (FSecurity != null) bufferStr = FSecurity.decode(bufferStr);
			var obj: Object = JSON.decode(bufferStr);
			obj.cmd = cmd;

			handleData(obj);
		}		
		
	}
	
}