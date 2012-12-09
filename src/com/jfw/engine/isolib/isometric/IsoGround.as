package com.jfw.engine.isolib.isometric
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class IsoGround extends Sprite
	{
		protected var _cols:int;
		protected var _rows:int;
		protected var _size:Number;
		protected var _alpha:Number;
		public var ScrWidth:Number;
		public var ScrHeight:Number;
		
		//行数列数都是垂直方向的偶数行列
		public function IsoGround(size:Number=50,cols:int=1,rows:int=1,alpha:Number=0)
		{
			super();
			_size=size;
			_cols=cols>1?cols:2;
			_rows=rows>1?rows:2;
			_alpha=alpha;
			ScrWidth=(_cols-1)*2*_size;
			ScrHeight=(_rows-1)*_size;
			drawGround();
		}
		
		protected function drawGround():void
		{			
			var p3d:Point3D=new Point3D();
			var p2d:Point=new Point();
			
			for(var i:int=0;i<_rows*2-1;i++)
			{	
				var n:int=i%2==0?_cols:_cols-1;
				for(var j:int=0;j<n;j++)
				{
					var tile:IsoTile=new IsoTile(_size,0x00ff00,_alpha);
					
					if(i%2==0)
					{
						p2d.x=j*2*_size;
						p2d.y=i*_size/2;
					}
					else
					{
						p2d.x=j*2*_size+_size;
						p2d.y=i*_size/2;
					}
					
					p3d=IsoUtils.screenToIso(p2d);
					tile.position=p3d;
					this.addChild(tile);
				}
			}
		}
		
		public function ScreenToGround(p:Point):Point
		{
			var p3d:Point3D=IsoUtils.screenToIso(p);
			var p2d:Point=new Point();
			p2d.x=Math.floor((p3d.x+_size/2)/_size);
			p2d.y=Math.floor((p3d.z+_size/2)/_size);
			return p2d;
		}
		
		public function GroundToScreen(p:Point):Point
		{
			var p3d:Point3D=new Point3D(p.x*_size,0,p.y*_size);
			var p2d:Point=IsoUtils.isoToScreen(p3d);
			return p2d;
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