package app.mvc.model.net
{
	import app.gameconf.GameConf;
	
	import com.jfw.engine.core.mvc.model.BModel;
	import com.jfw.engine.net.nc.NetManager;
	import com.jfw.engine.net.nc.NetVO;
	import com.jfw.engine.utils.ServiceDate;
	
	public class NetModel extends BModel
	{
		static public const NAME:String = 'NetModel';
		
		public function NetModel()
		{
			super( NAME );
		}
		
		public function call( netCmd:String,param:Object = null ):void
		{
			if ( null == param )
			{
				param = {};
			}
			NetManager.getInstance().call( GameConf.GATEWAY, netCmd, param, onResult );
		}
		
		private function onResult( netVO:NetVO = null ):void
		{
			if ( !netVO.returnResult )
			{
				trace("系统错误");
				return;
			}
			
			if( netVO.returnParams )
			{
				/** 协议错误  */
				if(0 != netVO.returnParams.code)
				{
					trace("协议错误");
					return;
				}
				
				/** 设置服务器时间 */
				ServiceDate.instance.setServiceTime( netVO.returnParams['ts'] );
				
				/** 正确返回 */
				sendEvent( netVO.sendCommand + GameConf.CALLBACK,netVO.returnParams );
			}
		}
		
	}
}