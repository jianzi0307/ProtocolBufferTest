package com.jfw.engine.isolib.map.layers
{
	import app.globals.interfaces.ILayer;

	/**
	 * 
	 * @author PianFeng
	 * 图层管理器
	 * 
	 */
	public class LayerManager
	{
		protected var _layers:Array;
		
		public function LayerManager()
		{
			this._layers=[];
		}
		/**
		 * 把层加入管理器
		 * @param layer 层
		 */		
		public function addItem(layer:ILayer):void
		{
			if(layer)
				this._layers.push(layer);
		}
		/**
		 * 删除某个层
		 * @param layer 层对象
		 */			
		public function removeItem(layer:ILayer):void
		{
			this._layers.splice(this._layers.indexOf(layer),1);
		}
		/**
		 * 删除某个层
		 * @param index 层索引
		 */		
		public function removeItemAt(index:int):void
		{
			this._layers.splice(index,1);
		}
		/**
		 * 删除某个层
		 * @param name	层名字
		 */		
		public function removeItemByName(name:String):void
		{
			this._layers.splice(this._layers.indexOf(this.getItemByName(name)),1);
		}
		/**
		 *删除所有层 ，只是清空
		 */		
		public function removeAll():void
		{
			this._layers=[];
		}
		/**
		 * 根据索引得到某层
		 * @param index  层索引
		 * @return
		 */		
		public function getItemAt(index:int):*
		{
			return this._layers[index];
		}
		/**
		 *得到层 
		 * @param name		层名
		 * @return 	如果不存在则返回null
		 */		
		public function getItemByName(name:String):*
		{
			for each(var layer:ILayer in this._layers)
			{
				if(layer.layerName()==name)
					return layer;
			}
			return null;
		}
		/**
		 * 根据条件查询层集合
		 * @param conditions  指定的条件，参数为当前查询的层
		 * @return   包含层的集合
		 */		
		public function getItemsByConditions(conditions:Function):Array
		{
			var arr:Array=[];
			
			for each(var layer:* in this._layers)
			{
				if(conditions(layer))
					arr.push(layer);
			}
			
			return arr;
		}
		/**
		 * 得到层数
		 * @param layer
		 * @return
		 */		
		public function getCount():int
		{
			return this._layers.length;
		}
		/**
		 * 得到层索引
		 * @param layer 层
		 * @return 
		 */		
		public function getIndex(layer:ILayer):int
		{
			return this._layers.indexOf(layer);
		}
		/**
		 * 根据层名得到索引
		 * @param name 层名
		 * @return  如果不存在该名字的层则返回-1
		 */		
		public function getIndexByName(name:String):int
		{
			for(var i:int=0;i<this._layers.length;i++)
			{
				if((this._layers[i] as ILayer).layerName()==name)
				{
					return i;
				}	
			}
			return -1;
		}
		/**
		 *判断是否存在该层 
		 * @param layerName		层名子
		 * @return 		
		 */		
		public function isOwnItemName(name:String):Boolean
		{
			for each(var layer:ILayer in this._layers)
			{
				if(layer.layerName()==name)
					return true;
			}
			
			return false;
		}
		/**
		 *判断索引是否存在 
		 * @param index		索引
		 * @return 
		 *
		 */		
		public function isOwnItemIndex(index:int):Boolean
		{
			if(index<this._layers.length&&index>=0)
			{
				return true;
			}
			
			return false;
		}
	}
}