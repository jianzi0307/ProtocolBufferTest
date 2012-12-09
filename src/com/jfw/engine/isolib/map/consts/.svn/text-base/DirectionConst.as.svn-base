package com.jfw.engine.isolib.map.consts
{
	import flash.geom.Point;

	/**
	 * 
	 * @author pianfeng
	 * 方向相关常量
	 * 
	 */	
	public class DirectionConst
	{	
		public static const DOWN: String = "down";							
		public static const UP: String = "up";
		public static const LEFT: String = "left";
		public static const RIGHT: String = "right";
		public static const LEFTDOWN: String = "leftDown";				
		public static const LEFTUP: String = "leftUp";
		public static const RIGHTDOWN: String = "rightDown";
		public static const RIGHTUP: String = "rightUp";
		/**
		* 
		* 根据角度转换成八方向
		* 
		*/
		public static function getDirectionByAngle(angle: Number): String
		{
			var a: Number = angle;
			if (angle < 0) a = 360 + angle;
			
//			if ((a >= 0) && (a < 22.5)) return DirectionConst.RIGHT;
//			if ((a >= 22.5) && (a <= 67.5)) return DirectionConst.RIGHTDOWN;
//			if ((a > 67.5) && (a < 112.5)) return DirectionConst.DOWN;
//			if ((a >= 112.5) && (a <= 157.5)) return DirectionConst.LEFTDOWN;
//			if ((a > 157.5) && (a < 202.5)) return DirectionConst.LEFT;
//			if ((a >= 202.5) && (a <= 247.5)) return DirectionConst.LEFTUP;
//			if ((a > 247.5) && (a < 292.5)) return DirectionConst.UP;
//			if ((a >= 292.5) && (a <= 337.5)) return DirectionConst.RIGHTUP;
//			if ((a > 337.5) && (a < 360)) return DirectionConst.RIGHT;
			
			if ((a >= 0) && (a < 22.5)) return DirectionConst.RIGHT;
			if ((a >= 22.5) && (a <= 67.5)) return DirectionConst.RIGHTDOWN;
			if ((a > 67.5) && (a < 112.5)) return DirectionConst.DOWN;
			if ((a >= 112.5) && (a <= 157.5)) return DirectionConst.LEFTDOWN;
			if ((a > 157.5) && (a < 202.5)) return DirectionConst.LEFT;
			if ((a >= 202.5) && (a <= 247.5)) return DirectionConst.LEFTUP;
			if ((a > 247.5) && (a < 292.5)) return DirectionConst.UP;
			if ((a >= 292.5) && (a <= 337.5)) return DirectionConst.RIGHTUP;
			if ((a > 337.5) && (a < 360)) return DirectionConst.RIGHT;
			return DirectionConst.LEFT;
		}	
		/**
		 * 
		 * private static const DIRECT_ARRAY:Array=["down","rightDown","right","rightUp","up","leftUp","left","leftDown"];
		 * private static const NEXT_ARRAY:Array=[[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1]];
		 * 性能优化 把上面-1，0，1变成0，1，2这样就可以用数组取到方向，而不用FOR循环 	
		 *  
		 */
		public static const DIRECT_ARRAY:Array=[[UP,LEFTUP,LEFT],
												[RIGHTUP,"",LEFTDOWN],
												[RIGHT,RIGHTDOWN,DOWN]];
		/**
		 *方向集合 
		 */		
//		public static const ANIMATION_DIRECT_ARRAY:Array=[UP,LEFTUP,LEFT,RIGHTUP,LEFTDOWN,RIGHT,RIGHTDOWN,DOWN];
		public static const ANIMATION_DIRECT_ARRAY:Array=[LEFTUP,RIGHTUP,LEFTDOWN,RIGHTDOWN];
		/**
		 * 获取地图两个相邻格子的方向
		 * @param startX	开始地图格子x轴索引
		 * @param startZ	开始地图格子z轴索引
		 * @param endX   结束地图格子x轴索引
		 * @param endZ   结束地图格子z轴索引
		 * @return		相对方向(八方向-->"down","rightDown","right","rightUp","up","leftUp","left","leftDown"),此方向都是屏幕方向
		 */
		public static function getDirection(startX: int,startZ: int,endX: int,endZ: int): String
		{
			var _dirX: int = endX - startX;
			var _dirZ: int = endZ - startZ;	
			
			return DIRECT_ARRAY[_dirX+1][_dirZ+1];
		}
	}
}