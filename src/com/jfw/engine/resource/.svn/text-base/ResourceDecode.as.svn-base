package com.jfw.engine.resource
{
	import flash.utils.ByteArray;
	
	/** 资源加扰&解扰 */
	public class ResourceDecode implements ICrypt
	{
		private static const seed:Array = [
			0xD83EFCAB,
			0xB34CABE6,
			0xF74ECAB8,
			0xCABBC2A3,
			0xBACF0CD9,
			0xDFBB07F9,
			0xC66FACB8,
			0xB1F9DE96,
			0xAB95CCAB
		];
		
		/**
		 * 解扰 
		 * @param data
		 * @return 
		 * 
		 */		
		public function decryptResource( data:ByteArray ):ByteArray
		{
			var byteArray:ByteArray = new ByteArray();
			var n:int = 0;
			
			while ( data.bytesAvailable >= 4 )
			{
				byteArray.writeInt( data.readInt() ^ seed[ n%9 ] );
				n++;
			}
			
			if( data.bytesAvailable > 0 )
			{
				var leaveBytes:ByteArray = new ByteArray();
				data.readBytes( leaveBytes );
				byteArray.writeBytes( leaveBytes );
			}
			return byteArray;
		}
		
		/**
		 * 加扰 
		 * @param data
		 * @return 
		 * 
		 */
		public function encryptResource( data:ByteArray ):ByteArray
		{
			return decryptResource( data );
		}
	}
}