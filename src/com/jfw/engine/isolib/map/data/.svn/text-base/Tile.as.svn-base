package com.jfw.engine.isolib.map.data
{
	public class Tile
	{
		protected var _xIndex:int;
		protected var _zIndex:int;
		protected var _data:Object;
		public var f:Number=0;
		public var g:Number=0;
		public var h:Number=0;
		public var cost:Number=1.0;
		protected var _parent:Tile=null;
		
		public function Tile(x:int=0,z:int=0,data:Object=null)
		{
			this._xIndex=x;
			this._zIndex=z;
			this._data=data;
		}
		
		public function set Parent(tile:Tile):void
		{
			_parent=tile;
		}
		
		public function get Parent():Tile
		{
			return _parent
		}
		
		public function getXIndex():int
		{
			return _xIndex;
		}
		
		public function getZIndex():int
		{
			return _zIndex;
		}
		
		public function getData():Object
		{
			return _data;
		}
		
		public function setData(value:int):void
		{
			_data=value;
		}
	}
}