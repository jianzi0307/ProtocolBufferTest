package com.jfw.engine.utils
{
	import com.hurlant.crypto.Crypto;
	import com.hurlant.crypto.symmetric.ICipher;
	import com.hurlant.util.Base64;
	
	import flash.utils.ByteArray;

	public class DesUtil
	{
		public static var DESKEY:String="11223399";
		
		public static function encrypt(encryptStr:String):String
		{
			var deskey:ByteArray = new ByteArray();
			deskey.writeUTFBytes(DESKEY);			
			var des:ICipher = Crypto.getCipher("des-ecb", deskey, Crypto.getPad("pkcs5")); 
			var encryptArr:ByteArray = new ByteArray();
			encryptArr.writeUTFBytes(encryptStr);
			encryptArr.position=0;
			des.encrypt(encryptArr);
			encryptArr.position=0;
			return Base64.encodeByteArray(encryptArr);
		}
		
		public static function decrypt(decryptStr:String):String
		{
			var deskey:ByteArray = new ByteArray();
			deskey.writeUTFBytes(DESKEY);
			var des:ICipher = Crypto.getCipher("des-ecb", deskey, Crypto.getPad("pkcs5")); 
			var decryptArr:ByteArray = Base64.decodeToByteArray(decryptStr);
			decryptArr.position=0;
			des.decrypt(decryptArr);
			decryptArr.position=0;
			return decryptArr.readUTFBytes(decryptArr.length);
		} 
	}
}