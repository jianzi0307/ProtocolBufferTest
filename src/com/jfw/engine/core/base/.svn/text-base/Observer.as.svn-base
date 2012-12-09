package com.jfw.engine.core.base
{
	import flash.display.Sprite;
	
	public class Observer extends Sprite implements IObServer,ISender
	{
		/** Observable 的引用  */ 
		protected var obs:Observable = null;
		
		public function Observer()
		{
			/** 得到 model 的引用 */
			obs = Observable.getInstance();
			
			/** 把自己注册到观察者列表 */
			var evts:Array = listEventInterests();
			for each ( var evt:String in evts )
				obs.regObServer( evt, this );
		}
		
		public function update( evt:String, param:Object ):void
		{
			this.handleEvent( evt , param );
		}
		
		public function sendEvent( evt:String, param:Object=null ):void
		{
			obs.sendEvent( evt, param );
		}
		
		protected function listEventInterests():Array
		{
			return [];
		}
		
		protected function handleEvent( evt:String, param:Object ):void
		{
			
		}
	}
}