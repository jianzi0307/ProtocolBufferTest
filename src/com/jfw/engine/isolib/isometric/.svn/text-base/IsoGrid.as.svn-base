package com.jfw.engine.isolib.isometric
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class IsoGrid extends Sprite
	{
		protected var _cols:int;
		protected var _rows:int;
		protected var _size:Number;
		protected var _alpha:Number;
		protected var _lineAlpha:Number;
		public var ScrWidth:Number;
		public var ScrHeight:Number;
		public var gridX:Number;
		public var gridY:Number;
		protected var isoXOffset:Number;//x轴偏移量
		protected var isoZOffset:Number;//z轴偏移量	
		/** 
		 * 行列数分别为3d坐标系中的行列,size为菱形短对角线长度,行列分别为z轴和x轴的数目
		 */ 
		public function IsoGrid(size:Number=50,cols:int=1,rows:int=1,alpha:Number=0)
		{
			super();
			_size=size;
			_cols=cols;
			_rows=rows;
			_alpha=alpha;
			ScrWidth=_cols*2*_size;
			ScrHeight=_rows*_size;
			
			var p3d:Point3D=new Point3D();
			p3d=IsoUtils.screenToIso(new Point(_rows*_size,_size/2));
			isoXOffset=p3d.x;
			isoZOffset=p3d.z;
			
			drawGrid();
		}
		
		public function drawGrid():void
		{
			for(var i:int=0;i<_rows;i++)
			{
				for(var j:int=0;j<_cols;j++)
				{
					var tile:IsoTile=new IsoTile(_size,0x00ff00,_alpha);
		
					tile.position=new Point3D(i * _size+isoXOffset, 0, j * _size+isoZOffset); 
					this.addChild(tile);
				}
			}
		}
		/**
		 * 屏幕像素坐标转换为3d格子坐标
		 * @param p
		 * @return 
		 */		
		public function ScreenToGrid(p:Point):Point
		{
			var p3d:Point3D=IsoUtils.screenToIso(p);
			var p2d:Point=new Point();
			p2d.x=Math.floor((p3d.x-isoXOffset+_size/2)/_size);
			p2d.y=Math.floor((p3d.z-isoZOffset+_size/2)/_size);
			return p2d;
		}
		/**
		 *格子坐标转换为屏幕像素坐标,该坐标为格子的中心点 
		 * @param p
		 * @return 
		 */		
		public function GridToScreen(p:Point):Point
		{
			var p3d:Point3D=new Point3D(p.x*_size+isoXOffset,0,p.y*_size+isoZOffset);
			var p2d:Point=IsoUtils.isoToScreen(p3d);
			return p2d;
		}
		/**
		 * 网格3d坐标系中x轴偏移量
		 */
		public function getIsoXOffset():Number
		{
			return this.isoXOffset;
		}
		/**
		 * 网格3d坐标系中z轴偏移量
		 */
		public function getIsoZOffset():Number
		{
			return this.isoZOffset;
		}
		
		public function setIsoXZOffset(x:Number=0,z:Number=0):void
		{
			this.isoXOffset=x;
			this.isoZOffset=z;
			drawGrid();
		}
		
		public function get size():Number
		{
			return _size;
		}
		public function get cols():Number
		{
			return _cols;
		}
		public function get rows():Number
		{
			return _rows;
		}
	}
}