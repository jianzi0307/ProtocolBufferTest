package com.jfw.engine.core.mvc.view.map
{
	import flash.geom.Point;

	public interface IIsoMap
	{
		/** 初始化地图背景 */
		function initMapBg():void;
		
		/** 初始化场景 */
		function initScene():void;
		
		/** 坐标转换 */
		function gridToView(pt:Point):Point;
		function viewToGrid(pt:Point):Point;
		
		/** 添加项 */
		function addItem():void;
		
		/** 删除项 */
		function removeItem():void;
		
		/** 根据坐标获取项 */
		function getItemByPos( x:int,y:int ):void;
		
		/** 显示格子，调试用 */
		function showGrid(show:Boolean):void;
		
		/** 设置地图居中 */
		function makeCenter():void;
		
		/** 设置地图中心点 */
		function setCenter( x:Number,y:Number,effect:Boolean = true ):void;
	}
}