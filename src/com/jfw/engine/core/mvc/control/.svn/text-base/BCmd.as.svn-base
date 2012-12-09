package com.jfw.engine.core.mvc.control
{
	import com.jfw.engine.core.base.ISender;
	import com.jfw.engine.core.base.Observable;
	
	public class BCmd implements ICmd, ISender
	{
		public function execute(evt:String, param:Object):void
		{
			
		}
		
		public function sendEvent( evt:String, param:Object=null ):void
		{
			Observable.getInstance().sendEvent( evt,param );
		}
	}
}