package com.jfw.engine.utils
{
	import flash.events.IEventDispatcher;

	/** 队列项 */
	public interface IQueueItem extends IEventDispatcher
	{
		/** 立即执行 */		
		function execute( obj:* = null ):void;
		
		/** 执行过程中 */
		function process( obj:* = null ):void;
		
		/** 执行结束  */		
		function result():void
	}
}