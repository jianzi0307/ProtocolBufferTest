package app.mvc.model.net
{
	import app.gameconf.GameConf;
	import app.mvc.cmd.net.GetInfoCmd;

	public class NetRequest
	{
		static private var _instance:NetRequest;
		private var _commands:Object;
		public function NetRequest()
		{
			if( _instance )
				throw new Error();
			_instance = this;
		}
		
		static public function get instance():NetRequest
		{
			if( !_instance )
				_instance = new NetRequest();
			return _instance ;
		}
		
		/**
		 * 绑定所有网络接口 
		 */
		public function init():void
		{
			_commands = {};
			
			bindingCMD( NetEventsConst.GET_USERINFO,GetInfoCmd );
		}
		
		/**
		 * 获取所有网络接口 
		 * @return 
		 */
		public function get commands():Object
		{
			return this._commands;
		}
		
		private function bindingCMD( cmd:String ,cmdCls:Class ):void
		{
			_commands[ cmd ] = [ cmdCls,cmd,cmd + GameConf.CALLBACK ];
		}
	}
}