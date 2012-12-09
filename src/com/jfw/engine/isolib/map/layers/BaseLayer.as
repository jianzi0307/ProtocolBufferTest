package com.jfw.engine.isolib.map.layers
{
	import app.globals.interfaces.ILayer;
	
	import flash.display.Sprite;
	
	public class BaseLayer extends Sprite implements ILayer
	{
		protected var _layerName:String;
		/**
		 * 
		 * @param layerName 层名不允许为空
		 * 
		 */		
		public function BaseLayer(name:String)
		{
			super();
			
			this._layerName=name;
		}
		
		public function layerName():String
		{
			return this._layerName
		}
	}
}