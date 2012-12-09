package com.jfw.engine.animation
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	public class Texture implements ITexture
	{
		private var _bitmapdata:BitmapData = null;
		private var _region:Rectangle = null;
		private var _frame:Rectangle = null;
		
		private var _xoffSet:Number;
		private var _yoffSet:Number;
		
		public function Texture( bmd:BitmapData,f:Rectangle,r:Rectangle )
		{
			this.bitmapdata = bmd;
			this._frame = f;
			this._region = r;
		}
		
		public function destroy():void
		{
			this._bitmapdata.dispose();
			this._bitmapdata = null;
			this._region = null;
			this._frame = null;
		}
		
		public function get bitmapdata():BitmapData
		{
			return this._bitmapdata;
		}
		
		public function set bitmapdata( bmd:BitmapData ):void
		{
			this._bitmapdata = bmd;
		}
		
		//原始frame宽高，偏移
		public function get width():Number
		{
			return this._frame.width;
		}
		
		public function get height():Number
		{
			return this._frame.height;	
		}
		
		public function get frame():Rectangle
		{
			return this._frame;
		}
		public function get frameX():Number
		{
			return this.frame.x;
		}
		
		public function get frameY():Number
		{
			return this.frame.y;
		}
		
		//裁剪后
		public function get region():Rectangle
		{
			return this._region;
		}
		public function get regionWidth():Number
		{
			return this.region.width;	
		}
		public function get regionHeight():Number
		{
			return this.region.height;
		}
		
		public function get xoffSet():Number
		{
			return _xoffSet;
		}
		
		public function set xoffSet(val:Number ):void
		{
			this._xoffSet = val;
		}
		
		public function get yoffSet():Number
		{
			return this._yoffSet ;
		}
		
		public function set yoffSet(val:Number ):void
		{
			this._yoffSet = val;
		}

	}
}