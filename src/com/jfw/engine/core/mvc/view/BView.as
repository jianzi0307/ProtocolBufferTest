package com.jfw.engine.core.mvc.view
{
	import com.jfw.engine.core.base.Core;
	import com.jfw.engine.core.base.IDestory;
	import com.jfw.engine.core.base.Observable;
	import com.jfw.engine.core.base.Observer;
	import com.jfw.engine.core.data.IStruct;
	import com.jfw.engine.utils.Tick;
	import com.jfw.engine.utils.TickEvent;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	
	/** 所有视图的基类 实现 observer 接收数据层发出的通知，也可以发通知 */
	public class BView extends Observer implements IView
	{
		/** 是否在移出显示列表的时候删除自身 */
		protected var destoryWhenRemove:Boolean = true;
		
		/** 是否已经被销毁 */
		public var destoryed:Boolean = false;
		
		/** 数据 */
		protected var viewData:IStruct;
		
		/** 核心单例类 */
		protected var core:Core = null;
		
		private var _paused:Boolean = false;
		private var _enabledTick:Boolean = false;
		
		public function BView( data:IStruct = null )
		{
			super( );
			viewData = data;
			
			core = Core.getInstance();
			
			this.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		public function get sign( ):String
		{
			var cls:String = getQualifiedClassName( this );
			return cls.split('::')[1];
		}
		
		public function get data( ):IStruct
		{
			return viewData;
		}
		
		public function set data( v:IStruct ):void
		{
			viewData = v;
		}
		
		public function get toolTip():*
		{
			
		}
		
		public function get toolTipObj():*
		{
			
		}
		
		public function set paused(v:Boolean):void
		{
			
		}
		
		public function get paused():Boolean
		{
			return true;
		}
		
		public function set enabledTick(v:Boolean):void
		{
			if ( _enabledTick == v )
				return;
			
			_enabledTick = v;
			
			if ( !_paused && _enabledTick )
			{
				getTickInstance().addEventListener(TickEvent.TICK,tickHandler);
			}
			else
			{
				getTickInstance().removeEventListener(TickEvent.TICK,tickHandler);
			}
		}
		
		public function get enabledTick():Boolean
		{
			return this._enabledTick;
		}
		
		/**
		 * 更新显示并发事件 
		 * 
		 */
		public function vaildDisplayList(noEvent:Boolean = false):void
		{
			updateDisplayList();
			
//			if ( !noEvent )
//				dispatchEvent(new GEvent(GEvent.UPDATE_COMPLETE));
		}
		
		/**
		 * 更新显示的操作
		 * 
		 */
		protected function updateDisplayList(): void
		{
		}
		
		
		public function destroy():void
		{
			if ( destoryed )
				return;
			
			destoryed = true;
			
//			try{
//				if( parent )
//					parent.removeChild( this );
//			} catch ( e:Error ){
//				trace( e.getStackTrace());
//			}
		}
		
		protected function getTickInstance():Tick
		{
			return Tick.instance;
		}
		
		/**
		 * 时基事件
		 * @param event
		 * 
		 */
		protected function tickHandler(event:TickEvent):void
		{
			vaildDisplayList();
		}
		
		/** 添加到显示列表事件 */
		protected function addToStageHandler(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
			
			onInit();
		}
		
		/** 从显示列表删除事件 */
		protected function removeFromStageHandler(event:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
			
			if( destoryWhenRemove )
			{
				//将自己从观察者列表删除
				var evts:Array = this.listEventInterests();
				for each(var e:String in evts)
				{
					obs.unregObserver( e , this );
				}
				
				destroy( );
			}
		}
		
		/** 初始化，加入显示列表调用 */
		protected function onInit():void
		{
			
		}
	}
}