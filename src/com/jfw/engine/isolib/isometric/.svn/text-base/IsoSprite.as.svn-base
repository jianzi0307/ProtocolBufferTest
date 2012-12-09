package com.jfw.engine.isolib.isometric
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle; 
	
	public class IsoSprite extends Sprite 
	{ 
		protected var _position:Point3D; 
		protected var _size:Number; 
		protected var _walkable:Boolean = false; 
		
		// 1.2247的精确计算版本 
		public static const Y_CORRECT:Number = Math.cos(-Math.PI / 6) *Math.SQRT2; 
		
		public function IsoSprite(size:Number=0) 
		{ 
			_size = size>=0?size:0; 
			_position = new Point3D(); 
			updateScreenPosition(); 
		} 
		/** 
		 * 把当前时刻的一个 3D坐标点转换成屏幕上的 2D坐标点 
		 * 并将自己安置于该点 
		 */ 
		protected function updateScreenPosition():void 
		{ 
			var screenPos:Point = IsoUtils.isoToScreen(_position); 
			super.x = screenPos.x; 
			super.y = screenPos.y; 
		} 
		/** 
		 * 自身的具体描述方式 
		 */ 
		override public function toString():String 
		{ 
			return "[IsoSprite (x:" + _position.x + ", y:" + _position.y+ ", z:" + _position.z + ")]"; 
		} 
		/** 
		 * 设置/读取 屏幕空间中的 x坐标 
		 */ 
		public function set ScrX(value:Number):void
		{
			super.x=value;
		}
		public function get ScrX():Number
		{
			return super.x;
		}
		/** 
		 * 设置/读取 屏幕空间中的 y坐标 
		 */ 
		public function set ScrY(value:Number):void
		{
			super.y=value;
		}
		public function get ScrY():Number
		{
			return super.y;
		}
		/** 
		 * 设置/读取 3D空间中的 x坐标 
		 */ 
		override public function set x(value:Number):void 
		{ 
			_position.x = value; 
			updateScreenPosition(); 
		} 
		override public function get x():Number 
		{ 
			return _position.x; 
		} 
		/** 
		 *  设置/读取3D空间中的 y坐标 
		 */ 
		override public function set y(value:Number):void 
		{ 
			_position.y = value; 
			updateScreenPosition(); 
		} 
		override public function get y():Number 
		{ 
			return _position.y; 
		} 
		/** 
		 *  设置/读取3D空间中的 z 坐标 
		 */ 
		override public function set z(value:Number):void 
		{ 
			_position.z = value; 
			updateScreenPosition(); 
		} 
		override public function get z():Number 
		{ 
			return _position.z; 
		} 
		/** 
		 *  设置/读取3D空间中的坐标点 
		 */ 
		public function set position(value:Point3D):void 
		{ 
			_position = value; 
			updateScreenPosition(); 
		} 
		public function get position():Point3D 
		{ 
			return _position; 
		} 
		/** 
		 * 返回形变后的层深 
		 */ 
		public function get depth():Number 
		{ 
			return (_position.x + _position.z) * .866 - _position.y * .707; 
		} 	
		/** 
		 * 指定其它对象是否可以经过所占的位置 
		 */ 
		public function set walkable(value:Boolean):void 
		{ 
			_walkable = value; 
		} 
		public function get walkable():Boolean 
		{ 
			return _walkable; 
		} 	
		/** 
		 * 返回和设置尺寸 
		 */ 	
		public function set size(value:Number):void 
		{ 
			_size = value>=0?value:0;  
		} 
		public function get size():Number 
		{ 
			return _size; 
		} 
		/** 
		 * 返回占用着的矩形 
		 */ 
		public function get rect():Rectangle 
		{ 
			return new Rectangle(super.x - size, super.y - size/2, 2*size, size); 
		} 
	}
}