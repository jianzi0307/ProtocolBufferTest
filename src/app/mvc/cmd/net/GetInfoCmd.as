package app.mvc.cmd.net
{
	import app.gameconf.protocol.GetUserInfo;
	
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;

	public class GetInfoCmd extends NetCmd
	{
		override protected function netCallBackHandler(netObj:Object):void
		{
			// ============== 这里处理返回的数据
			if( netObj.code == 0 )
			{
				var byteArray:ByteArray = new ByteArray();
				byteArray.writeUTFBytes( String(netObj.data) );
				byteArray.position = 0;
				var userInfo:GetUserInfo = new GetUserInfo();
				userInfo.mergeFrom( byteArray );
				trace( userInfo.uname );
			}
		}
	}
}