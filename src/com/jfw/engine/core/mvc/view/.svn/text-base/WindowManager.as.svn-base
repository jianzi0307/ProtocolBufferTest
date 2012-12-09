package com.jfw.engine.core.mvc.view
{
	import app.mvc.view.ui.panel.mainui.MainUI;
	
	import com.jfw.engine.utils.manager.PopUpManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;

	/**
	 * 窗口管理器
	 * 通过窗体的sign进行管理
	 * 
	 * @author jianzi
	 */	
	public class WindowManager
	{
		static private var instance:WindowManager;

		private var windowMap:Object ;
		
		/** 若窗口已打开，震动提示 */
		private var shakeInstance:BWindow ;
		private var shakeRect:Rectangle;
		private var oldRect:Rectangle;
		private var shaking:Boolean = false;
		
		public function WindowManager()
		{
			if( instance )
				throw new Error("窗口管理器为单例!");
			instance = this;
			
			windowMap = new Object();
		}
		
		static public function getInstance():WindowManager
		{
			if( !instance )
				instance = new WindowManager();
			return instance;
		}
		
		/** 创建一个窗口 */
		/**
		public function createWindow( windowClassRef:Class, param:Object = null, skinMC:MovieClip=null ,hasAction:Boolean = true ):void
		{
			var window:BWindow = null;
			if ( skinMC )
				window = new windowClassRef( skinMC , param ) as BWindow;
			else
				window = new windowClassRef() as BWindow;
			
			if( hasWindow( window.sign ) )
			{
				/////////////
				this.closeWindow( window.sign );
				return;
				////////////
				
				
				this.shakeInstance = getWindow( window.sign );
				//记录起始位置 shakeInstance.x,shakeInstance.y,
				this.oldRect = new Rectangle( 0,0,shakeInstance.width,shakeInstance.height );
				this.shakeRect = this.oldRect.clone();
				
				shakeWindow( window.sign );
				return;
			}
			
			window.addEventListener( Event.CLOSE, function onCloseWindow( evt:Event ):void
			{
				if( window.hasEventListener( Event.CLOSE ) )
					window.removeEventListener(Event.CLOSE,onCloseWindow);
				removeWindow( window.sign );
				PopUpManager.removePopUp( window,hasAction );
			});
			
			PopUpManager.addPopUp( window );
			this.windowMap[ window.sign ] = window;
		}*/
		
		/**
		 * 打开一个窗口
		 * 
		 * @param window
		 * @param param
		 * @param unshared 	是否独占
		 * @param hasAction
		 */		
		public function openWindow( window:BWindow, param:Object = null, unshared:Boolean = false,isModel:Boolean = true,hasAction:Boolean = true ):void
		{
			if( hasWindow( window.sign ) )
			{
				/////////////
				this.closeWindow( window.sign );
				return;
				////////////
				
				this.shakeInstance = getWindow( window.sign );
				//记录起始位置 shakeInstance.x,shakeInstance.y,
				this.oldRect = new Rectangle( 0,0,shakeInstance.width,shakeInstance.height );
				this.shakeRect = this.oldRect.clone();
				
				shakeWindow( window.sign );
				return;
			}
			
			window.addEventListener( Event.CLOSE, onCloseWindow );
			
			if( unshared )
			{
				PopUpManager.removeAllPopUp();
				this.windowMap = new Object();
			}
			PopUpManager.addPopUp( window,isModel );
			this.windowMap[ window.sign ] = window;
		}
		
		/**
		 * 关闭所有窗体 
		 * 
		 */
		public function removeAllWindow():void
		{
			for( var sign:String in this.windowMap )
			{
				this.closeWindow( sign );
			}
		}
		
		/**
		 * 关闭窗口 
		 * @param sign
		 * 
		 */
		public function closeWindow( sign:String ):void
		{
			var bWin:BWindow = this.getWindow( sign );
			if( !bWin )
				return;
			if( bWin.hasEventListener( Event.CLOSE ) )
				bWin.removeEventListener(Event.CLOSE,onCloseWindow);
			
			//关闭所有子窗体
			closeAllSons( bWin );
			//从管理器中删除自己
			removeWindow( bWin.sign );
			//如果存在父窗体，则从父窗体删除自己
			if( bWin.pSign )
			{
				var p:BWindow = getWindow( bWin.pSign );
				if( p )
					p.removeSon( bWin.sign );
			}
			//关闭
			PopUpManager.removePopUp( bWin,false );
		}
		
		public function shakeWindow( sign:String ):void
		{
			if( shaking )
				return;
			
			shaking = true;
			
			var shakeTimer:Timer = null;
			shakeTimer = new Timer(50, 10);
			shakeTimer.addEventListener(TimerEvent.TIMER, this.shakeOnce);
			shakeTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.shakeFinish);
			shakeTimer.start();
		}
		
		//============================================================================================= helper
		
		private function onCloseWindow( evt:Event ):void
		{
			var bWin:BWindow = evt.currentTarget as BWindow;
			closeWindow( bWin.sign );
		}
		
		private function shakeOnce(evt:TimerEvent):void
		{
			var timer:Timer = evt.currentTarget as Timer;
			if (timer.currentCount % 2 == 1)
			{
				shakeRect.x += 2;
				shakeRect.y += 10 - timer.currentCount*2;
			}
			else
			{
				shakeRect.x -= 2;
				shakeRect.y -= 10 - timer.currentCount*2;
			}
			shakeInstance.scrollRect = shakeRect;
		}
		
		private function shakeFinish(evt:TimerEvent):void
		{
			//还原到起始位置
			this.shakeInstance.scrollRect = this.oldRect;
			
			var timer:Timer = evt.currentTarget as Timer;
			timer.removeEventListener(TimerEvent.TIMER, this.shakeOnce);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.shakeFinish);
			timer.stop();
			timer = null;
			
			shaking = false;
		}

		private function closeAllSons( parent:BWindow ):void
		{
			var sons:Vector.<String> = parent.getSons();
			for each( var sign:String in sons )
			{
				var son:BWindow = this.getWindow( sign );
				//从管理器中删除
				removeWindow( son.sign );
				//从父窗体中删除
				parent.removeSon( son.sign );
				//关闭
				PopUpManager.removePopUp( son, false );
			}
		}
		
		private function hasWindow( sign:String ):Boolean
		{
			if( this.windowMap[ sign ] )
				return true;
			else
				return false;
		}
		
		private function getWindow( sign:String ):BWindow
		{
			if( !hasWindow( sign ) )
				return null;
			return this.windowMap[ sign ];
		}
		
		private function removeWindow( sign:String ):void
		{
			if( hasWindow( sign ) )
				this.windowMap[ sign ] = null;
		}
		
	}
}