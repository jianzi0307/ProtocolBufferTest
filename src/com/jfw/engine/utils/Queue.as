package com.jfw.engine.utils
{
	import flash.events.Event;

	public class Queue
	{
		protected var actionAry:Array = null;
		/**
		 * 是否在队列不为空时自动执行
		 */
		public var autoStart:Boolean = false;
		
		public function Queue( )
		{
			actionAry = [ ];
		}
		
		/** 添加项 */
		public function add( item:IQueueItem ):void
		{
			this.actionAry.push( item );
			
			if ( autoStart && this.actionAry.length == 1 )
				doNext();
		}
		
		/** 开始队列 */
		public function execute( ):void
		{
			doNext( );
		}
		
		/** 中断队列 */
		public function halt( ):void
		{
			this.actionAry = [];
		}
		
		protected function doNext( ):void
		{
			var item:IQueueItem = null;
			if ( this.actionAry.length > 0 )
			{
				item = this.actionAry.shift( );
				if( item )
				{
					item.addEventListener( Event.COMPLETE, onCompleted );
					item.execute( );
				}				
			}
		}
		
		protected function onCompleted( evt:Event = null ):void
		{
			if( null != evt )
				evt.currentTarget.removeEventListener( Event.COMPLETE, onCompleted );
			
			if( this.actionAry.length <= 0 )
				return;
			
			doNext( );
		}
	}
}