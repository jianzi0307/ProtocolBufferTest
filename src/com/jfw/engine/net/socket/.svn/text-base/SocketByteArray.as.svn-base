package com.pianfeng.engine.net.socket
{
	import flash.utils.ByteArray;

	public class SocketByteArray extends ByteArray
	{
		public function SocketByteArray()
		{
			super();
		}
		
		public function readString(): String{
			var _buff: ByteArray = new ByteArray();
			while(true){
				var _b: int = this.readByte();
				if (_b == 0) break;
				_buff.writeByte(_b);
			}
			_buff.position = 0;
			return _buff.readMultiByte(_buff.length,"Unicode");
		}
		
		public function readStringArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(readString());
			}
			return _a;
		}
		
		public function readIntArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(this.readInt());
			}
			return _a;
		}
		
		public function readUIntArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(this.readUnsignedInt());
			}
			return _a;
		}
		
		public function readShortArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(this.readShort());
			}
			return _a;
		}
		
		public function readFloatArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(this.readFloat());
			}
			return _a;
		}
		
		public function readDoubleArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(this.readDouble());
			}
			return _a;
		}
		
		public function readByteArray(): Array{
			var _a: Array = new Array();
			var _len: int = this.readShort();
			for (var i:int=0;i<_len;i++){
				_a.push(this.readByte());
			}
			return _a;
		}
	}
}