  package com.jfw.engine.isolib.isometric
{
	import flash.geom.Point;
	
	public class IsoUtils
	{		
		public static const Y_CORRECT:Number = Math.cos(-Math.PI / 6) * Math.SQRT2;//可以用1.2247代替,但并不精确  
		
		public function IsoUtils()
		{
		}
		/**
		 * 坐标转换
		 * @param pos
		 * @return 
		 */
		public static function isoToScreen(pos:Point3D):Point  
		{  
			var screenX:Number = pos.x - pos.z;  
			var screenY:Number = pos.y * Y_CORRECT + (pos.x + pos.z) * .5;  
			return new Point(screenX, screenY);  
		}
		public static function screenToIso(point:Point):Point3D  
		{  
			var xpos:Number = point.y + point.x * .5;  
			var ypos:Number = 0;  
			var zpos:Number = point.y - point.x * .5;  
			return new Point3D(xpos, ypos, zpos);  
		}  
		/**
		 * 返回深度
		 * @param x
		 * @param y
		 * @param z
		 * @return 
		 */		
		public static function getDepth(x:Number,y:Number,z:Number):Number
		{
			return (x+z)*0.866-y*0.707;
		}
		/**
		 * 长度转换
		 * @param length
		 * @return 
		 */
		public static function screenLengthToIso(length:Number):Number
		{
			return length/Math.sqrt(1.25);
		}
		public static function isoLengthToScreen(length:Number):Number
		{
			return length*Math.sqrt(1.25);
		}
	}
}