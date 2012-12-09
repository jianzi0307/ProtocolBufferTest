package
{
	import app.Entry;
	import app.gameconf.protocol.GetUserInfo;
	import app.gameconf.protocol.GetUserInfo.FrdSmpInfo;
	import app.mvc.model.net.NetEventsConst;
	
	import com.jfw.engine.core.base.Observable;
	
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	
	public class ProtocolBufferTest extends Sprite
	{
		public function ProtocolBufferTest()
		{
			Entry.instance.initWorld( this.stage );
			var getuserinfo:GetUserInfo = new GetUserInfo();
			getuserinfo.age = 100;
			getuserinfo.jling = 1000;
			getuserinfo.lucky = 1000;
			getuserinfo.isvip = true;
			getuserinfo.viplv = 20;
			getuserinfo.linq = 1000;
			getuserinfo.uid = '1';
			getuserinfo.uname = '健子1';
			getuserinfo.uuid = '000000000-00000-0000001';
			getuserinfo.sex = 0;
			var fuids:Array = [];
			for( var i:int = 0; i < 10; i++ )
			{
				var frd:FrdSmpInfo = new FrdSmpInfo();
				frd.isvip = true;
				frd.lv = 10;
				frd.thumb = "http://www.baidu.com/logo.png";
				frd.uid = i.toString() + '1000';
				frd.viplv = 10;
				fuids.push( frd );
			}
			getuserinfo.fuids = fuids;
			var byteArray:ByteArray = new ByteArray();
			getuserinfo.writeTo( byteArray );
			Observable.getInstance().sendEvent( NetEventsConst.GET_USERINFO ,{ data:byteArray });
		}
	}
}