package com.jfw.engine.core.mvc.view
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	import com.jfw.engine.core.base.CoreConst;
	import com.jfw.engine.core.data.IStruct;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	/** 面板基类 */
	public class BPanel extends BSprite implements IPanel
	{
		/** 背景 */
		public var $mcBg:MovieClip = null;
//		protected var doubleClickTimer:Timer;
//		protected var doubleClick:Boolean = false;
		
		public function BPanel( cls_ref:Object=null, data:IStruct=null )
		{
			super( cls_ref, data );
		}
		
		override protected function addToStageHandler(event:Event):void
		{
			super.addToStageHandler( event );
		}
		
		override protected function removeFromStageHandler( event:Event ):void
		{
			unregButtons( skin );
			
			super.removeFromStageHandler( event );
		}
		
		override protected function onInit():void
		{
			super.onInit();
			
			regButtons( skin );
		}
		
		/** 注册所有按钮 */
		public function regButtons( container:DisplayObjectContainer ):void
		{
			var len:int = container.numChildren;
			var chd:DisplayObject ;
			
			while( len-- )
			{
				chd = container.getChildAt( len );
				if ( null != chd )
				{
					if( chd is TextField )
					{
						if(TextFieldType.INPUT != ( chd as TextField).type )
						{
							(chd as TextField).selectable = false;
//							(chd as TextField).mouseEnabled = false;
						}
					}
					
					if( this.checkMcType( chd.name ) )
					{
						if( chd is MovieClip )
							( chd as MovieClip ).gotoAndStop( 1 );
						
						addBtnEvent( chd );
						
						if( chd is DisplayObjectContainer )
						{
							var child:DisplayObjectContainer = chd as DisplayObjectContainer;
							if( child.numChildren > 1 )
								regButtons( child );
						}
					}
				}
			}
		}
		
		/** 注销所有按钮 */
		public function unregButtons( container:DisplayObjectContainer ):void
		{
			var len:int = container.numChildren;
			var chd:DisplayObject;
			while( len-- )
			{
				chd = container.getChildAt( len );
				if( !chd )
					continue;
				if(this.checkMcType( chd.name ))
				{
					this.clearBtnEvent(chd);
					if(chd is DisplayObjectContainer)
					{
						var child:DisplayObjectContainer = chd as DisplayObjectContainer;
						if(child.numChildren > 1)
							unregButtons(child);
					}
				}
			}
		}
		
		public function tweenTo(duration:int,params:Object ):void
		{
			TweenLite.to( this,duration,params );
		}
		
		protected function onMouseOver( evt:MouseEvent ):void
		{
//			if( evt.target is MovieClip )
//			{
//				var end:Object = new Object();
//				end.scaleX = 1.2;
//				end.scaleY = 1.2;
//				end.ease = Bounce.easeOut;
//				TweenLite.to( evt.target, 0.5, end );
//			}
		}
		
		protected function onMouseOut( evt:MouseEvent ):void
		{
//			if( evt.target is MovieClip )
//			{
//				var end:Object = new Object();
//				end.scaleX = 1;
//				end.scaleY = 1;
//				end.ease = Bounce.easeOut;
//				TweenLite.to( evt.target,0.5,end );
//			}
		}
		
		protected function onMouseDown( evt:MouseEvent ):void
		{
			evt.currentTarget.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}
		
		protected function onMouseUp(evt:MouseEvent):void
		{
			evt.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
//		protected function onMouseClickCheck( evt:MouseEvent ):void
//		{
//			if (doubleClick)
//			{
//				doubleClick = false;
//				return;
//			}
//			doubleClick = true;
//			doubleClickTimer = new Timer(260, 1);
//			doubleClickTimer.addEventListener(TimerEvent.TIMER, onDoubleClickTimer);
//			doubleClickTimer.start();
//			
//			function onDoubleClickTimer(event:TimerEvent):void
//			{
//				if(doubleClick){
//					trace("在这里处理单击事件");
//					onMouseClick( evt );
//				} else {
//					trace("在这里处理双击事件");
//					onDoubleClick( evt );
//				}
//				doubleClickTimer.removeEventListener(TimerEvent.TIMER, onDoubleClickTimer);
//				doubleClick = false;
//			}
//		}
		
		
		protected function onMouseMove(evt:MouseEvent):void
		{
			
		}
		
		protected function onMouseClick( evt:MouseEvent ):void
		{
			
		}
		
		protected function onDoubleClick(evt:MouseEvent):void
		{
			
		}
		
		//==========================================================
		// helper
		//==========================================================
		
		protected function setButtonMode( mc:MovieClip,mode:Boolean = true ):void
		{
			if( !mc )
				return;
			mc.buttonMode = mode;
			mc.mouseEnabled = mode;
		}
		
		/**
		 * 从名称获取对象名称前缀
		 * 例如：$pbClose_3 返回 $pbClose 
		 * @return 
		 * 
		 */
		protected function getMcName( mc:DisplayObject ):String
		{
			var fullName:String = mc.name;
			var index:int = fullName.lastIndexOf('_');
			
			if(index < 0)
				return fullName;
			else
				return fullName.substring(0,index);
		}
		
		/**
		 * 从名称获取对象名称索引
		 * 例如：$pbClose_3  返回3
		 *  
		 * @param mc
		 * @return 
		 */
		protected function getMcIndex( mc:DisplayObject ):int
		{
			var fullName:String = mc.name;
			var index:int = fullName.lastIndexOf('_');
			
			if(index < 0)
				return -1;
			else
				return uint(fullName.slice(index + 1));
		}
		
		/**
		 * 添加按钮事件 
		 * @param btn
		 */
		protected function addBtnEvent( btn:DisplayObject ):void 
		{
			var type:String = btn.name.substr( 0 , 3 );
			switch( type )
			{
				case CoreConst.TAG_PB:
					if(btn is Sprite || btn is MovieClip)
					{
						(btn as MovieClip).mouseChildren = false;
						(btn as MovieClip).buttonMode = true;
						(btn as MovieClip).tabEnabled = false;
						//(btn as MovieClip).doubleClickEnabled = true;
					}
					addListner(btn);
					break;
				case CoreConst.TAG_PM:
					if(btn is Sprite || btn is MovieClip )
					{
						(btn as MovieClip).mouseChildren = false;
						(btn as MovieClip).buttonMode = false;
						(btn as MovieClip).tabEnabled = false;
						//(btn as MovieClip).doubleClickEnabled = true;
					}
					addListner(btn);
					break;
				case CoreConst.TAG_MC:
					(btn as MovieClip).buttonMode = false;
					break;
			}
		}
		
		protected function clearBtnEvent(mc:DisplayObject):void
		{
			mc.removeEventListener( MouseEvent.ROLL_OVER, onMouseOver );
			mc.removeEventListener( MouseEvent.ROLL_OUT, onMouseOut );
			mc.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
			mc.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			mc.removeEventListener(MouseEvent.CLICK,onMouseClick);
			//mc.removeEventListener(MouseEvent.DOUBLE_CLICK,onDoubleClick);
		}
		
		protected function addListner(mc:DisplayObject):void
		{
			mc.addEventListener( MouseEvent.ROLL_OVER, onMouseOver );
			mc.addEventListener( MouseEvent.ROLL_OUT, onMouseOut );
			mc.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
			mc.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			mc.addEventListener(MouseEvent.CLICK,onMouseClick);
			//mc.addEventListener(MouseEvent.DOUBLE_CLICK,onDoubleClick);
		}
		
		/**
		 * 检查displayObj类型
		 * 例如：$pbBtn_1、$pmBtn_1、$mcAbc_1
		 * 
		 * $pb 为按钮元件SimpleButton 或  MovieClip（响应鼠标事件，buttonMode=true）
		 * $pm 为mc组件（响应鼠标事件，buttonMode=false）
		 * $mc 影片剪辑 （不响应鼠标事件）
		 * 
		 * @param name
		 * @return 
		 */
		protected function checkMcType(mcName:String):Boolean
		{
			var str:String = mcName.substring(0, 3);

			if( CoreConst.TAG_MC == str || CoreConst.TAG_PB == str || CoreConst.TAG_PM )
				return true;
			else
				return false;
		}
		
		override public function get width():Number
		{
			if ( null != $mcBg )
				return $mcBg.width * scaleX;
			else
				return super.width * scaleX;
		}
		
		override public function get height():Number
		{
			if ( null != $mcBg )
				return $mcBg.height * scaleY;
			else
				return super.height * scaleY;
		}
		
		override public function destroy():void
		{
			if( destoryed )
				return;
			destoryed = true;
			
			this.$mcBg = null;
			super.destroy();
		}
	}
}