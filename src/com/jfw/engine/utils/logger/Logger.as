package com.jfw.engine.utils.logger
{
	public final class Logger
	{
		public static const LEVEL_NOTSET:int = 0;
		public static const LEVEL_DEBUG:int = 10;
		public static const LEVEL_INFO:int = 20;
		public static const LEVEL_WARN:int = 30;
		public static const LEVEL_ERROR:int = 40;
		
		public static var level:int = LEVEL_NOTSET;
		
		public static function debug(... args):void
		{
			if(level > LEVEL_DEBUG)
			{
				return;
			}
			log('[DEBUG]', args);
		}

		public static function info(... args):void
		{
			if(level > LEVEL_INFO)
			{
				return;
			}
			log('[INFO]', args);
		}
		
		public static function warn(... args):void
		{
			if(level > LEVEL_WARN)
			{
				return;
			}
			log('[WARN]', args);
		}
		
		public static function error(... args):void
		{
			if(level > LEVEL_ERROR)
			{
				return;
			}
			log('[ERROR]', args);
		}
		
		private static function log(level:String, ... args):void
		{
//			CONFIG::debug {
//				var stackTrace:String = new Error().getStackTrace();
//				if(!Boolean(stackTrace))
//				{
//					return;
//				}
//				var s:String = stackTrace.split("\n", 4)[3];
//				var tmp:Array = s.split('[', 2);
//				var funcName:String = (tmp[0].split(' ') as Array).pop();
//				s = ( tmp[1].split(':') as Array).pop();
//				var lineNo:String = s.split(']').shift();
//				//支持MonsterDebugger
//				MonsterDebugger.log( level + ' [' +funcName + ':' + lineNo + '] ' + args.toString() );
//			}
			
		}
		
	}
}