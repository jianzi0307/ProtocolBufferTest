package com.jfw.engine.utils.manager
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	//
	// 鼠标指针管理器
	//
	public class MouseManager
	{
		private static var isShow:Boolean			= false; // 控制显示属性
		private static var currentCursor:String		= '';
		private static var currentCursorPath:String	= '';
		private static var currentType:int			= -1;
		
		private static var defaultCursor:MovieClip = null;
		private static var defaultLoadCursor:Loader = null;
		
		private static var currentContainer:DisplayObjectContainer = null;
		private static var cursorContainer:DisplayObjectContainer = null;
		
		private static var currentPoint:Point = null;
		
		/**
		 * 初始化
		 * @param container
		 * @param DefaultCursorClass
		 * 
		 */		
		public static function init( container:DisplayObjectContainer, DefaultCursorClass:Class=null ):void
		{
			currentPoint					= new Point();
			
			currentContainer				= container;
			cursorContainer					= new Sprite();
			cursorContainer.mouseChildren	= false;
			cursorContainer.mouseEnabled	= false;
			
			defaultCursor					= new DefaultCursorClass() as MovieClip;
			defaultCursor					= defaultCursor == null ? new MovieClip() : defaultCursor;
			defaultCursor.visible			= false;
			
			
			defaultLoadCursor				= new Loader();
			defaultLoadCursor.visible		= false;
			
			cursorContainer.addChild(defaultLoadCursor);
			cursorContainer.addChild(defaultCursor);
			currentContainer.addChild(cursorContainer);
		}
		/**
		 * 设置指针样式 
		 * @param cursor
		 * @param cursorPath
		 * 
		 */		
		public static function setCursor(cursor:String, cursorPath:String=''):void
		{
			if(currentCursor != cursor)
			{
				currentCursor		= cursor;
				
			}
			
			//发布鼠标指针样式更改事件
			currentContainer.dispatchEvent(new Event(Event.CHANGE));
			
			currentCursorPath	= cursorPath;
			
			currentPoint.x		= 0;
			currentPoint.y		= 0;
			
			var name:String		= cursor.slice(cursor.lastIndexOf('/')+1, cursor.length);;
			var version:int		= name.indexOf('?') 
			var expend:String	= name.slice(name.indexOf('.'), Boolean(version == -1) ? name.length : version);
			update(currentCursor, currentCursorPath);
		}
		
		public static function get dispatcher():IEventDispatcher
		{
			return currentContainer as IEventDispatcher;
		}
		
		/**
		 * 获取当前指针样式
		 * @return 
		 * 
		 */		
		public static function getCursor():String
		{
			return currentCursor;
		}
		
		/**
		 * 获取当前指针路径
		 * @return 
		 * 
		 */		
		public static function getCursorPath():String
		{
			return currentCursorPath;
		}
		
		/**
		 * 设置指针的坐标位置
		 */
		public static function setPoint(pointX:int, pointY:int):void
		{
			currentPoint.x		= pointX;
			currentPoint.y		= pointY;
			
			defaultLoadCursor.x	= pointX;
			defaultLoadCursor.y	= pointY;
		}
		
		private static function update(name:String='', path:String=''):void
		{
			defaultCursor.visible		= false;
			defaultLoadCursor.visible	= false;

			if(name.length > 0 && isShow)
			{
				//trace('mouse cursor:', name);
				defaultCursor.gotoAndStop(name);
				defaultCursor.visible		= true;
			}
			if(path.length > 0 && isShow)
			{
				defaultLoadCursor.load(new URLRequest(path));
				defaultLoadCursor.visible	= true;
			}else
			{
				defaultLoadCursor.unload();
			}
		}
		
		public static function show():void
		{
			if(!isShow)
			{
				isShow	= true;
				currentContainer.dispatchEvent(new Event(Event.CHANGE));
			}
			
			//当鼠标指针容器，不包含EnterFrame帧频事件时，添加时事件
			if (!cursorContainer.hasEventListener(Event.ENTER_FRAME))
			{
				Mouse.hide();
				cursorContainer.addEventListener(Event.ENTER_FRAME, onEnterFrames);//帧频事件：移动鼠标指针图形
				cursorContainer.stage.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);//移入舞台事件：系统鼠标指针和管理器鼠标指针切换
				cursorContainer.stage.addEventListener(Event.MOUSE_LEAVE, onMouseLeave);//移除舞台事件：系统鼠标指针和管理器鼠标指针切换
			}
			
			update(currentCursor, currentCursorPath);
		}
		
		public static function hide():void
		{
			if(isShow)
			{
				isShow	= false;
				currentContainer.dispatchEvent(new Event(Event.CHANGE));
			}
			
			if (cursorContainer.hasEventListener(Event.ENTER_FRAME))
			{
				Mouse.show();
				cursorContainer.removeEventListener(Event.ENTER_FRAME, onEnterFrames);
				cursorContainer.stage.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				cursorContainer.stage.removeEventListener(Event.MOUSE_LEAVE, onMouseLeave);
			}
			update();
		}
		
		public static function get isShowMouse():Boolean
		{
			return isShow;
		}
		
		private static function onEnterFrames(e:Event):void
		{
			cursorContainer.x	= cursorContainer.stage.mouseX
//				+ currentPoint.x;
			cursorContainer.y	= cursorContainer.stage.mouseY
//				+ currentPoint.y;
		}
		
		private static function onMouseOver(e:MouseEvent):void
		{
			cursorContainer.visible	= true;
			Mouse.hide();
		}
		
		private static function onMouseLeave(e:Event):void
		{
			cursorContainer.visible	= false;
			Mouse.show();
		}
	}
}