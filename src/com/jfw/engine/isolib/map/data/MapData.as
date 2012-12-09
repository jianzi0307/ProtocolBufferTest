package com.jfw.engine.isolib.map.data
{
	import com.jfw.engine.isolib.isometric.IsoUtils;
	import com.jfw.engine.isolib.isometric.Point3D;
	import com.jfw.engine.isolib.map.consts.DirectionConst;
	import com.jfw.engine.isolib.map.consts.MathConst;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.PerspectiveProjection;
	import flash.geom.Point;

	/**
	 * 
	 * @author pianfeng
	 * 地图相关类,包括坐标系转换等
	 * 可以保存bg图片数据,但不显示
	 * 
	 */	
	public class MapData implements IMapData
	{
		private static var instance:MapData=null;
		protected var _name:String;//地图名
		protected var _bgPath:String//背景图片路径
		protected var _BG:BitmapData;//背景图片
		protected var _gridCols:int;//路点格子z轴列数
		protected var _gridRows:int;//路点格子x轴行数
		protected var _cellSize:Number//菱形格子的短对角线2d长度;
		protected var _bgWidth:Number;//背景图片2d宽度
		protected var _bgHeight:Number;//背景图片2d高度
		protected var _data:Array;//路点矩阵集合
		protected var _isoXOffset:Number;//x轴偏移量
		protected var _isoYOffset:Number;//y轴偏移量	
		/**
		 * @param name	地图名
		 * @param gridCols	路点网格x轴列数
		 * @param gridRows   路点网格y轴行数
		 * @param cellSize   菱形块短对角线屏幕长度
		 * @param bgWidth    背景宽
		 * @param bgHeight   背景高
		 * @param bgPath   背景图路径
		 */
		public function MapData()
		{
		}
		
		public static function get Instance():MapData
		{
			return instance||=new MapData();
		}
		
		public function setData(xml:XML):MapData
		{
			this._name=xml.@name;
			this._gridCols=xml.@mapW;
			this._gridRows=xml.@mapH;
			this._cellSize=xml.@cellW;
			this._bgWidth=xml.@bgWidth;
			this._bgHeight=xml.@bgHeight;
			this._bgPath=xml.@bgPath;
			//加载矩阵数据
			loadGridData(xml);
			//更新坐标系原点便宜量
			var p3d:Point3D=IsoUtils.screenToIso(new Point(_bgWidth/2,(_bgHeight-_cellSize*_gridRows-_cellSize)/2));
			this._isoXOffset=p3d.x;
			this._isoYOffset=p3d.z;
			return this;
		}
		/**
		 * 
		 * 读取矩阵数据
		 * @param xml	导入的xml文件信息
		 * 
		 */		
		protected function loadGridData(xml:XML):void
		{
			this._data=[];
			
			for(var i:int=0;i<xml.grids.children().length();i++)
			{
				var str:String=xml.grids.x[i];
				var arr:Array=str.split(",");
				var tempArr:Array=[];
				for(var j:int=0;j<arr.length;j++)
				{
					var tile:Tile=new Tile(j,i,arr[j]);
					tempArr.push(tile);
				}
				
				this._data.push(tempArr);
			}
		}
		/**
		 * 根据x,z索引得到该位置的路点,可以先调用getPointOverRide(x:int,z:int)函数判断是否越界
		 * @param x x轴格子索引
		 * @param z z轴格子索引
		 * @return	该格子所代表的地图标号
		 */
		public function getTileAtGrid(x:int,z:int):Tile
		{
			return this._data[z][x] as Tile;
		}
		/**
		 * 根据路点值查询路点集合
		 * @param obj	路点对象包含的值
		 * @return 
		 * 此方法频繁调用效率低下
		 */
		public function getTilesByData(data:Object=null):Array
		{
			if(!data)
				return this._data.concat();
			
			var arr:Array=[];
			
			for(var i:int=0;i<this._data.length;i++)
			{
				for(var j:int=0;j<this._data[0].length;j++)
				{
					if((this._data[i][j] as Tile).getData()===data)
						arr.push(this._data[i][j]);
				}
			}
			
			return arr;
		}
		/**
		 * 判断指定的点是否越界
		 * @param x x轴索引
		 * @param y y轴索引
		 * @return 	如果越界则返回true,否则返回false
		 */		
		public function checkPointOverRide(x:int,y:int):Boolean
		{
			if(x<0||x>this._gridCols-1||y<0||y>this._gridRows-1)
				return true;
			else
				return false;
		}
		/**
		 * 把某一个结点的类型改变为val 
		 * @param val
		 * @param x
		 * @param y
		 * 
		 */	
		public function setTileAtGrid(val:int=0,x:int=0,y:int=0):void
		{
			(this._data[y][x] as Tile).setData(val);
		}
		/**
		 * 根据屏幕坐标求网格坐标
		 */
		public function screenToGrid(p:Point):Point
		{
			var p3d:Point3D=IsoUtils.screenToIso(p);
			p3d.x=Math.floor((p3d.x-_isoXOffset)/_cellSize);
			p3d.z=Math.floor((p3d.z-_isoYOffset)/_cellSize);
			return new Point(p3d.x,p3d.z);
		}
		/**
		 * 根据网格坐标求屏幕坐标
		 */
		public function gridToScreen(p:Point):Point
		{
			p.x=p.x*this._cellSize+_isoXOffset+(_cellSize>>1);
			p.y=p.y*this._cellSize+_isoYOffset+(_cellSize>>1);		
			var p2d:Point=IsoUtils.isoToScreen(new Point3D(p.x,0,p.y));
			return p2d;
		}
		/**
		 * 获取任意两个格子组成的角度 
		 * @return 
		 * 
		 */	
		public function getDirection(t1:Tile,t2:Tile):String
		{
			var p2d:Point =this.gridToScreen(new Point(t1.getXIndex(),t1.getZIndex()));
			var p2d2:Point =this.gridToScreen(new Point(t2.getXIndex(),t2.getZIndex()));
			var Angle:Number=MathConst.getAngle(p2d.x,p2d.y,p2d2.x,p2d2.y);
			return DirectionConst.getDirectionByAngle(Angle);
		}
		/**
		 * 地图名
		 */	
		public function get name():String
		{
			return this._name;
		}
		/**
		 * 背景图路径
		 */			
		public function get bgPath():String
		{
			return this._bgPath;
		}	
		/**
		 * 背景宽
		 */	
		public function get bgWidth():Number
		{
			return this._bgWidth;
		}
		/**
		 * 背景高
		 */			
		public function get bgHeight():Number
		{
			return this._bgHeight;
		}
		/**
		 * 设置背景图片
		 */	
		public function set BG(value:BitmapData):void
		{
			this._BG=value;
			this._bgWidth=value.width;
			this._bgHeight=value.height;
		}
		/**
		 * 路点矩阵
		 */	
		public function get data():Array
		{
			return this._data.concat();
		}
		/**
		 * 菱形格子的短对角线2d长度;
		 */	
		public function get cellSize():Number
		{
			return this._cellSize;
		}
		/**
		 * 露点网格列数
		 */
		public function get gridCols():int
		{
			return this._gridCols;
		}
		/**
		 * 露点网格行数
		 */
		public function get gridRows():int
		{
			return this._gridRows;
		}
		/**
		 * 网格屏幕高
		 */
		public function get gridHeight():Number
		{
			return this._cellSize*this._gridRows;
		}
		/**
		 * 网格屏幕宽
		 */
		public function get gridWidth():Number
		{
			return 2*this._cellSize*this._gridCols;
		}
		/**
		 * 网格3d坐标系中x轴偏移量
		 */
		public function get isoXOffset():Number
		{
			return this._isoXOffset;
		}
		/**
		 * 网格3d坐标系中z轴偏移量
		 */
		public function get isoYOffset():Number
		{
			return this._isoYOffset;
		}
	}
}