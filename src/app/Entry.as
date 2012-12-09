package app
{
	import app.mvc.model.net.NetModel;
	import app.mvc.model.net.NetRequest;
	
	import com.jfw.engine.AbsGameWorld;
	
	public class Entry extends AbsGameWorld
	{
		static private var _instance:Entry;
		
		public function Entry()
		{
			if( _instance )
				throw Error( "" );
			_instance = this;
		}
		
		static public function get instance():Entry
		{
			if( !_instance )
				_instance = new Entry();
			return _instance;
		}
		
		override protected function initCmds():void
		{
			//注册所有网络命令
			NetRequest.instance.init();
			var commands:Object = NetRequest.instance.commands;
			for( var cmd:String in commands )
			{
				var callCmd:String = commands[cmd][1];
				var callBackCmd:String = commands[cmd][2];
				var cmdCls:Class = commands[cmd][0];
				this.regCmds( [ callCmd,callBackCmd ], cmdCls ); 
			}
		}
		
		override protected function initModels():void
		{
			new NetModel();
		}
		
		override protected function initViews():void
		{
			
		}
		
		override protected function startGame():void
		{
			
		}
	}
}