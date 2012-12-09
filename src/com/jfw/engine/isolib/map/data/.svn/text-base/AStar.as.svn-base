package com.jfw.engine.isolib.map.data
{
	public class AStar
	{
		private var _open:Array=null;
		private var _closed:Array=null;
		private var _mapData:IMapData=null;
		private var _endNode:Tile=null;
		private var _startNode:Tile=null;
		private var _conditions:Function=null;
		private var _path:Array=null;
		private var _heuristic:Function=null;
		private var _straightCost:Number=1.0;
		private var _diagCost:Number=Math.SQRT2;

		public function AStar(mapData:IMapData)
		{
			_mapData=mapData;
			_heuristic=diagonal;
		}
		
		public function findPath(startX:int,startY:int,endX:int,endY:int,conditions:Function=null):Boolean
		{
			if(startX==endX&&startY==endY)
				return false;
			
			_startNode=_mapData.getTileAtGrid(startX,startY);
			_endNode=_mapData.getTileAtGrid(endX,endY);
			_conditions=conditions;
			_open=[];
			_closed=[];
			_startNode.g=0;
			_startNode.h=_heuristic(_startNode);
			_startNode.f=_startNode.g+_startNode.h;
			
			return search();
		}
		
		private function search():Boolean
		{
			var node:Tile=_startNode;
			
			while(node!=_endNode)
			{
				var startX:int=Math.max(0,node.getXIndex()-1);
				var endX:int=Math.min(_mapData.gridCols-1,node.getXIndex()+1);
				var startY:int=Math.max(0,node.getZIndex()-1);
				var endY:int=Math.min(_mapData.gridRows-1,node.getZIndex()+1);
				
				for(var i:int=startX;i<=endX;i++)
				{
					for(var j:int=startY;j<=endY;j++)
					{
						var test:Tile=_mapData.getTileAtGrid(i,j);		
						//排除斜角位置
						//排除当前位置
						if(test==node||(test.getXIndex()!=node.getXIndex()&&test.getZIndex()!=node.getZIndex()))
							continue;
						
						//排除不满足条件的位置
						if(_conditions(test))
						{
							var g:Number=node.g+test.cost;
							var h:Number=_heuristic(test);
							var f:Number=g+h;
							
							if(isOpen(test)||isClosed(test))
							{
								if(test.f>f)
								{
									test.f=f;
									test.g=g;
									test.h=h;
									test.Parent=node;
								}
							}
							else
							{
								test.f=f;
								test.g=g;
								test.h=h;
								test.Parent=node;
								_open.push(test);
							}
						}
					}
				}
				
				_closed.push(node);
				
				if(_open.length==0)
				{
					trace("no path found");
					return false;
				}
				
				_open.sortOn("f",Array.NUMERIC);
				node=_open.shift() as Tile;
			}
			
			buildPath();
			return true;
		}
		
		public function get Path():Array
		{
			return _path;	
		}
		
		private function isOpen(node:Tile):Boolean
		{
			return _open.indexOf(node)!=-1;
		}
		
		private function isClosed(node:Tile):Boolean
		{
			return _closed.indexOf(node)!=-1;
		}
		
		private function buildPath():void
		{
			_path=[];
			var node:Tile=_endNode;
			_path.push(node);
			
			while(node!=_startNode)
			{
				node=node.Parent;
				_path.unshift(node);
			}
		}
		/**
		 * 对角线算法消耗 
		 * @param node
		 * @return 
		 * 
		 */		
		private function diagonal(node:Tile):Number
		{
			var dx:Number=Math.abs(node.getXIndex()-_endNode.getXIndex());
			var dy:Number=Math.abs(node.getZIndex()-_endNode.getZIndex());
			var diag:Number=Math.min(dx,dy);
			var straight:Number=dx+dy;
			return _diagCost*diag+_straightCost*(straight-2*diag);
		}
	}
}