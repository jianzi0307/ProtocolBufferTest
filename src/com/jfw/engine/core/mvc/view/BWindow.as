package com.jfw.engine.core.mvc.view
{
	
	import app.mvc.control.events.ModelEvent;
	
	import com.jfw.engine.core.base.CoreConst;
	import com.jfw.engine.core.data.IStruct;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/** 窗口基类 */
	public class BWindow extends BPanel implements IWindow
	{
		/** 是否模式窗口 */
		public var isModal:Boolean = true;
		
		/** 是否可拖曳 */
		public var isDrag:Boolean = true;
		
		/** 是否支持缓动 */
		public var isTween:Boolean = true;
		
		protected var _pSign:String = null;
		protected var _sons:Vector.<String> = null;
		
		public function BWindow(cls_ref:Object=null, data:IStruct=null,parentSign:String = null )
		{
			super( cls_ref, data );
			
			if( parentSign )
				this.pSign = parentSign;
			
			_sons = new Vector.<String>();
		}
		
		public function set pSign( sign:String ):void
		{
			this._pSign = sign;
		}
		
		public function get pSign():String
		{
			return _pSign;
		}
		
		public function addSon( sign:String ):void
		{
			for each( var s:String in this._sons )
			{
				if( s === sign )
					return;
			}
			this._sons.push( sign );
		}
		
		public function removeSon( sign:String ):void
		{
			for( var i:int = 0,len:int = _sons.length;i<len;i++)
			{
				if( _sons[i] === sign )
				{
					_sons[i] = null;
					_sons.splice( i,1 );
				}
			}
		}
		
		protected function openWindow( window:BWindow,param:Object = null,unshared:Boolean = false,isModel:Boolean=true, hasAction:Boolean=true):void
		{
			if( window != this )
			{
				this.addSon( window.sign );
				window.pSign = this.sign;
			}
			WindowManager.getInstance().openWindow( window,param,unshared,isModel,hasAction );
		}
		
		public function getSons():Vector.<String>
		{
			return _sons;
		}
		
		public function close():void
		{
			dispatchEvent( new Event( Event.CLOSE ) );
			
			result();
		}
		
		public function execute( obj:* = null ):void
		{
			WindowManager.getInstance().openWindow( this );
		}
		
		public function process( obj:* = null ):void
		{
			trace("...");
		}
		
		public function result():void
		{
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		override protected function onMouseClick(evt:MouseEvent):void
		{
			super.onMouseClick( evt );
			
			switch( getMcName( evt.target as DisplayObject ) )
			{
				case CoreConst.TAG_PB + 'Close':
					close();
					break;
			}
		}
		
		override protected function onMouseDown(evt:MouseEvent):void
		{
			super.onMouseDown( evt );
			
			switch( getMcName( evt.target as DisplayObject ) )
			{
				case CoreConst.TAG_PB + 'Drag':
					var dragObj:Sprite = evt.target as Sprite;
					var w:int = dragObj.parent.stage.stageWidth - dragObj.parent.width;
					var h:int = dragObj.parent.stage.stageHeight - dragObj.height;
					var rect:Rectangle = new Rectangle(0,0,w,h);
					(dragObj.parent as Sprite).startDrag(false,rect);
					break;
			}
		}
		
		override protected function onMouseUp(evt:MouseEvent):void
		{
			super.onMouseUp( evt );
			
			switch (getMcName( evt.target as DisplayObject ) )
			{
				case CoreConst.TAG_PB + 'Drag':
					evt.target.parent.stopDrag();
					break;
			}
		}
		
	}
}