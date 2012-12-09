package com.jfw.engine.motion
{
	import app.manager.IResourceManager;
	
	import com.jfw.engine.animation.BmdAtlas;
	import com.jfw.engine.animation.Texture;
	import com.jfw.engine.isolib.map.consts.DirectionConst;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * 
	 * @author Administrator
	 * 
	 */	
	public class AsynAnimation extends Sprite implements IAnimation
	{
		private var _motion:IAnimation=null;
		protected var _originX:Number=0;
		protected var _originY:Number=0;
		protected var isPause:Boolean=false;
		
		public function AsynAnimation(srcid:String,manager:IResourceManager,frameName:String,defaultTextures:BitmapData,fps:Number=12)
		{
			_motion=new BaseAnimation(srcid,manager,frameName,defaultTextures,fps);
			
			this.addChild(_motion.getAnimation());
			this.addEventListener(AnimationEvent.UPDATE_TEXTURES,updateOrigin);
			_motion.getAnimation().addEventListener(Event.COMPLETE,onAnimationEnd);
		}
		
		public function play():void
		{
			if(_motion)_motion.play();
		}
		
		public function pause():void
		{
			if(_motion)_motion.pause();
		}
		
		public function stop():void
		{
			if(_motion)_motion.stop();
		}
		
		public function get isPlaying():Boolean
		{
			return _motion?_motion.isPlaying:false;
		}
		
		public function getAnimation():DisplayObject
		{
			return _motion?_motion.getAnimation():null;
		}
		
		public function get CurFrameName():String
		{
			return _motion?_motion.CurFrameName:"";
		}
		
		public function set CurFrameName(value:String):void
		{
			if(_motion)
				_motion.CurFrameName=value;
		}
		
		public function get CurrTexture():Texture
		{
			return _motion?_motion.CurrTexture:null;
		}
		
		public function get CurrFrame():int
		{
			return _motion?_motion.CurrFrame:0;
		}
		
		public function get totalFrames():int
		{
			return _motion?_motion.totalFrames:0;
		}
		
		public function get XOffset():Number
		{
			return _motion?_motion.XOffset:0;
		}
		
		public function get YOffset():Number
		{
			return _motion?_motion.YOffset:0;
		}
		/**
		 * 设置动画对象相对原点偏移量 ,此设置不会影响动画本身偏移量,主要用来给用户调整用
		 * @return 
		 * 
		 */	
		public function set XAdjust(value:Number):void
		{
			if(_motion)
				_motion.XAdjust=value;
		}
		/**
		 * 设置动画对象相对原点偏移量 ,此设置不会影响动画本身偏移量,主要用来给用户调整用
		 * @return 
		 * 
		 */	
		public function set YAdjust(value:Number):void
		{
			if(_motion)
				_motion.YAdjust=value;
		}
		
		public function get Zoom():Number
		{
			return _motion?_motion.Zoom:1;
		}
		
		public function set Zoom(value:Number):void
		{
			if(_motion)
				_motion.Zoom=value;
		}
		
		public function get OriginX():Number
		{
			return this._originX;
		}
		
		public function set OriginX(value:Number):void
		{
			this._originX=value;
			x=value-this.XOffset;
		}
		
		public function get OriginY():Number
		{
			return this._originY;
		}
		
		public function set OriginY(value:Number):void
		{
			this._originY=value;
			y=value-this.YOffset;
		}
		
		public function getFrameTexture(frameID:int):Texture
		{
			return _motion?_motion.getFrameTexture(frameID):null;
		}
		
		public function set fps(value:Number):void
		{
			if(_motion)
				_motion.fps=value<1?1:value;
		}
		
		public function get fps():Number
		{
			return _motion?_motion.fps:12;
		}
		
		public function advanceTime(time:Number):void
		{
			if(!isPause)
			{
				if(_motion)
					_motion.advanceTime(time);
			}
		}
		/**
		 * 子类业务逻辑如果需要舰艇动作结束需要重写 
		 * @param evt
		 * 
		 */		
		protected function onAnimationEnd(evt:Event):void
		{
			
		}
		/**
		 * 由子类重写,处理方法
		 * 
		 */		
		protected function onUpdateOrigin():void
		{
			
		}
		/**
		 * 更新原点位置 
		 * @param evt
		 * 
		 */		
		private function updateOrigin(evt:AnimationEvent):void
		{
			evt.stopImmediatePropagation();
			x=_originX-(_motion?_motion.XOffset:0);
			y=_originY-(_motion?_motion.YOffset:0);
			onUpdateOrigin();
		}
		
		public function get IsRedraw():Boolean
		{
			return this._motion.IsRedraw;
		}
		
		public function get IsDestroy():Boolean
		{
			return _motion==null||this._motion.IsDestroy;
		}
		
		public function destroy():void
		{
			this.removeEventListener(AnimationEvent.UPDATE_TEXTURES,updateOrigin);
			
			if(_motion)
			{
				if(this.contains(_motion.getAnimation()))
					this.removeChild(_motion.getAnimation());
				_motion.getAnimation().removeEventListener(Event.COMPLETE,onAnimationEnd);
				_motion.destroy();
				_motion=null;
			}
		}
	}
}