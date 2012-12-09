package com.jfw.engine.animation
{
	import com.jfw.engine.core.base.IDestory;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public interface ITexture extends IDestory
	{
		function get bitmapdata():BitmapData;
		function set bitmapdata( bmd:BitmapData ):void;
		
		//原始frame宽高，偏移
		function get width():Number;
		function get height():Number;	
		function get frame():Rectangle;
		function get frameX():Number;
		function get frameY():Number;
		
		//裁剪后
		function get region():Rectangle;
		function get regionWidth():Number;
		function get regionHeight():Number;
		
		//画布原点到角色投影点的偏移量
		function get xoffSet():Number;
		function set xoffSet(val:Number ):void;
		function get yoffSet():Number;
		function set yoffSet(val:Number ):void;
	}
}