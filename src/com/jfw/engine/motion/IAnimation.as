package com.jfw.engine.motion
{
	import com.jfw.engine.animation.IAnimatable;
	import com.jfw.engine.animation.Texture;
	import com.jfw.engine.core.base.IDestory;
	
	import flash.display.DisplayObject;

	/**
	 * 动画播放接口
	 * 
	 */
	public interface IAnimation extends IAnimatable,IDestory
	{
		/**
		 * 取得动画效果显示对象,承载资源
		 * 
		 * @param 			无
		 * 
		 * @return			动画效果对象
		 */
		function getAnimation():DisplayObject;
		/**
		 * 当前关键贞标签 
		 * @return 
		 * 
		 */		
		function get CurFrameName():String;
		function set CurFrameName(value:String):void;
		/**
		 * 动画对象相对原点偏移量 
		 * @return 
		 * 
		 */		
		function get XOffset():Number;
		function get YOffset():Number;
		/**
		 * 动画对象的放大倍数默认为1
		 * @return 
		 * 
		 */	
		function get Zoom():Number;
		function set Zoom(value:Number):void;
		
		/**
		 * 设置动画对象相对原点偏移量 ,此设置不会影响动画本身偏移量,主要用来给用户调整用
		 * @return 
		 * 
		 */		
		function set XAdjust(value:Number):void;
		function set YAdjust(value:Number):void;
		
		/**
		 * 脚下isoX坐标
		 * @return 
		 * 
		 */		
		function get OriginX():Number;
		function set OriginX(value:Number):void;
		/**
		 * 脚下isoY坐标
		 * @return 
		 * 
		 */			
		function get OriginY():Number;
		function set OriginY(value:Number):void;

		/** 播放动画 */
		function play():void;
		
		/** 暂停 */
		function pause():void;
		
		/** 停止 */
		function stop():void;
		
		/**
		 * 是否正在播放 
		 * @return 
		 * 
		 */		
		function get isPlaying():Boolean;
		/**
		 * 根据贞标签获取纹理
		 * @param value
		 * @return 
		 * 
		 */		
		function getFrameTexture(frameID:int):Texture;
		/**
		 * 获得当前贞的纹理
		 * @return 
		 * 
		 */		
		function get CurrTexture():Texture;
		/**
		 * 设置贞频 
		 * @param value
		 * @return 
		 * 
		 */		
		function set fps(value:Number):void;
		function get fps():Number;
		/**
		 * 总贞数 
		 * @return 
		 * 
		 */		
		function get totalFrames():int;
		/**
		 * 当前贞 
		 * @return 
		 * 
		 */		
		function get CurrFrame():int;
		/**
		 * 是否已被重绘
		 * @return 
		 * 
		 */		
		function get IsRedraw():Boolean;
		/**
		 * 是否已销毁
		 * @return 
		 * 
		 */		
		function get IsDestroy():Boolean;
	}
}