package app.mvc.cmd.net
{
	import app.gameconf.GameConf;
	import app.mvc.model.net.NetModel;
	
	import com.jfw.engine.core.base.Core;
	import com.jfw.engine.core.mvc.control.BCmd;
	
	import flash.utils.ByteArray;
	
	public class NetCmd extends BCmd
	{
		override public function execute(evt:String, param:Object):void
		{
			var netModel:NetModel = Core.instance.retModel( NetModel.NAME ) as NetModel;
			if( evt.indexOf( GameConf.CALLBACK ) < 0 )
			{
				netModel.call( evt,param);
				trace( "call ------> " ,evt );
			}
			else
			{
				netCallBackHandler( param );
				trace( "call back <------" );
			}
		}
		
		protected function netCallBackHandler( netObj:Object ):void
		{
			
		}
	}
}