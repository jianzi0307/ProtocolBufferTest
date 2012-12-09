package com.jfw.engine.core.mvc.view
{
	import com.jfw.engine.core.data.IStruct;
	import com.jfw.engine.utils.FilterUtil;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	
	/** 实现直接映射资源 */
	public class BSprite extends BView
	{
		/** 皮肤 */
		protected var _skin:DisplayObjectContainer = null;
		
		/** 父容器 */
		protected var pSkin:DisplayObjectContainer = null;
		
		public function BSprite(cls_ref:Object = null,data:IStruct=null)
		{
			super( data );
			
			if( !cls_ref )
				cls_ref = assetClass;
			initSprite( cls_ref );
		}
		
		override public function destroy():void
		{
			if( destoryed )
				return;
			destoryed = true;
			
			super.removeChild( _skin );
			this._skin = null;
			this.pSkin = null;
			
			super.destroy();
		}
		
		override protected function addToStageHandler(event:Event):void
		{
			super.addToStageHandler( event );
			
			this.pSkin = this.parent;
		}
		
		override protected function removeFromStageHandler( event:Event ):void
		{
			super.removeFromStageHandler( event );
		}
		
		protected function get skin():DisplayObjectContainer
		{
			return this._skin;
		}
		
		protected function set skin(v:DisplayObjectContainer):void
		{
			this._skin = v;
		}
		
		
		/**
		 * 获取元件全局坐标 
		 * @return 
		 * 
		 */
		public function get globalPoint():Point
		{
			var gPoint:Point = null;
			if( this.parent )
			{
				var globalP:Point = this.parent.localToGlobal( new Point( this.x,this.y ) );
				gPoint = globalP;
			}
			return gPoint;
		}
		
		/**
		 * 设置mc显示隐藏 
		 * @param mc
		 * @param show
		 * 
		 */
		protected function showMc( mc:DisplayObject,show:Boolean ):void
		{
			if( mc )
				mc.visible = show;
		}
		
		protected function disableMc( mc:* , disabled:Boolean, useFilter:Boolean = true ):void
		{
			if( mc is DisplayObjectContainer || mc is DisplayObject || mc is SimpleButton )
			{ 
				mc.mouseEnabled = disabled;
//				if( mc is DisplayObjectContainer )
//					mc.mouseChildren = disabled;
				FilterUtil.clearAllFilters( mc );
				if( useFilter )
				{
					if( disabled )
						FilterUtil.clearAllFilters( mc );
					else
						FilterUtil.applyblack( mc );
				}
			}
		}
		
		
		/** 初始化资源 */
		protected function initSprite( cls_ref:Object ):void
		{
			if( null == _skin && null != cls_ref )
			{
				if( cls_ref is Class )
					_skin = new cls_ref() as DisplayObjectContainer;
				else if( cls_ref is DisplayObjectContainer )
				{
					_skin = cls_ref as DisplayObjectContainer;
					x = _skin.x;
					y = _skin.y;
					if( null != _skin.parent )
						_skin.parent.removeChild( _skin );
				}
				_skin.mouseEnabled = false;
				super.addChild( _skin );
				_skin.x = 0;
				_skin.y = 0;
				
				initAttr();
			}
		}
		
		/** 初始化属性 */
		protected function initAttr():void
		{
			if( _skin )
			{
				var len:int = _skin.numChildren;
				var attrName:String = '';
				var child:Object = null;
				for (var i:int = 0; i < len; i++)
				{
					child = _skin.getChildAt( i ) ;
					attrName = child.name;
					if( hasOwnProperty( attrName ) )
						this[ attrName ] = child;
				}
			}
		}
		
		/** 根据类名获取反射类 */
		protected function get assetClass():Class
		{
			return core.assetsModel.getClass( sign );
		}
		
		protected function addSuperChild( child:DisplayObject ):void
		{
			super.addChild( child );
		}
		
		protected function removeSuperChild( child:DisplayObject ):void
		{
			super.removeChild( child );
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			return _skin.addChild( child );
		}
		
		override public function addChildAt( child:DisplayObject, index:int ):DisplayObject
		{
			return _skin.addChildAt( child, index );
		}
		
		override public function getChildIndex( child:DisplayObject ):int
		{
			return _skin.getChildIndex( child  );
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			return _skin.removeChild( child );
		}
		
		override public function removeChildAt(index:int):DisplayObject
		{
			return _skin.removeChildAt( index );
		}
		
		override public function setChildIndex( child:DisplayObject, index:int ):void
		{
			_skin.setChildIndex( child, index );
		}
	}
}