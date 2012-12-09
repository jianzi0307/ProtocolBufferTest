package com.jfw.engine.core.mvc.model
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	
	/** 静态资源库接口 */
	public interface ILoadModel
	{
		/** 加载资源列表 */
		function loadRes( res:Array ):void;
			
		/** 是否存在该类 */
		function hasClass( name:String ):Boolean;
		
		/** 根据类名获取类 */
		function getClass( name:String ):Class;
		
		/** 根据类名获取类实例 */
		function getDisplayObj( name:String ):DisplayObject;
		
		/** 根据类名获取位图 */
		function getBitmap( name:String ):Bitmap;
		
		/** 根据类名获取位图数据 */
		function getBitmapData( name:String ):BitmapData;
		
		/** 根据类名获取XML */
		function getXML( name:String ):XML;
		
		/** 获取数据 */
		function getDB( ):Object;
		
		/** 缓存xml */
		function addXML( name:String ,xml:XML ):void;
	}
}