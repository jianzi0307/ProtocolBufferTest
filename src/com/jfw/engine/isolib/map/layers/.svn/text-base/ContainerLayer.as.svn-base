package com.jfw.engine.isolib.map.layers
{

	import app.globals.interfaces.ILayer;
	
	import com.pianfeng.engine.global.interfaces.IDispose;
	
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;

	/**
	 * 
	 * @author PianFeng
	 * 
	 */	
	public class ContainerLayer extends BaseLayer implements IDispose
	{
		protected var _layerManager:LayerManager;
		
		public function ContainerLayer(name:String=null)
		{
			super(name);		
/*			if (getQualifiedClassName(this) == "engine.map.scene::MapScene") {
				throw new ArgumentError("不允许直接实例化");
			}*/		
			_layerManager=new LayerManager();
		}
		/**
		 * 把层加入容器和管理器
		 * @param layer 层
		 */		
		public function addItem(layer:*):void
		{
			if(layer is BaseLayer)
			{
				this.addChild(layer);
				this._layerManager.addItem(layer);
			}
		}
		/**
		 * 删除某个层
		 * @param layer 层对象
		 * @return   false不存在该层true代表删除成功
		 */			
		public function removeItem(layer:*):Boolean
		{
			if(layer is BaseLayer)
			{
				if(this._layerManager.isOwnItemName(layer.layerName()))
				{
					this.removeChild(layer);
					this._layerManager.removeItem(layer);
					return true;
				}
			}
			
			return false;
		}
		/**
		 * 删除某个层
		 * @param index 层索引
		 * @return   false不存在该索引true代表删除成功
		 */		
		public function removeItemAt(index:int):Boolean
		{
			if(this._layerManager.isOwnItemIndex(index))
			{
				this.removeChild(this._layerManager.getItemAt(index));
				this._layerManager.removeItemAt(index);
				return true;
			}
			
			return false;
		}
		/**
		 * 删除某个层
		 * @param name	层名字
		 * @return 	false不存在该名字的层true代表删除成功
		 */		
		public function removeItemByName(name:String):Boolean
		{
			if(this._layerManager.isOwnItemName(name))
			{
				this.removeChild(this._layerManager.getItemByName(name));
				this._layerManager.removeItemByName(name);
				return true;
			}
			
			return false;
		}
		/**
		 *删除所有层 ，只是清空
		 */		
		public function removeAll():void
		{
			for(var i:int=0;i<this._layerManager.getCount();i++)
			{
				this.removeChild(this._layerManager.getItemAt(i));
			}
			this._layerManager.removeAll();
		}
		/**
		 * 根据索引得到某层
		 * @param index  层索引
		 * @return  false为不存在
		 */		
		public function getItemAt(index:int):*
		{
			if(this._layerManager.isOwnItemIndex(index))
			{
				return this._layerManager.getItemAt(index);
			}
			
			return null;
		}
		/**
		 *得到层 
		 * @param name		层名
		 * @return 	如果不存在则返回null
		 */		
		public function getItemByName(name:String):*
		{
			if(this._layerManager.isOwnItemName(name))
			{
				return this._layerManager.getItemByName(name);
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
			return this._layerManager.getItemsByConditions(conditions);
		}
		/**
		 * 得到层数
		 * @param layer
		 * @return
		 */		
		public function getCount():int
		{
			return this._layerManager.getCount();
		}
		/**
		 * 得到层索引
		 * @param layer 层
		 * @return 
		 */		
		public function getIndex(layer:ILayer):int
		{
			return this._layerManager.getIndex(layer);
		}
		/**
		 * 根据层名得到索引
		 * @param name 层名
		 * @return  如果不存在该名字的层则返回-1
		 */		
		public function getIndexByName(name:String):int
		{
			if(this._layerManager.isOwnItemName(name))
				return this._layerManager.getIndexByName(name);
			
			return -1;
		}
		/**
		 *判断是否存在该层 
		 * @param layerName		层名子
		 * @return 		
		 */		
		public function isOwnItemName(name:String):Boolean
		{
			return this._layerManager.isOwnItemName(name);
		}
		/**
		 *判断索引是否存在 
		 * @param index		索引
		 * @return 
		 */		
		public function isOwnItemIndex(index:int):Boolean
		{
			return this._layerManager.isOwnItemIndex(index);
		}
		/**
		 *垃圾回收实现 
		 * 
		 */		
		public function dispose():void
		{
			////
		}
	}
}