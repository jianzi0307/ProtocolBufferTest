package com.jfw.engine.core.mvc.view.map
{
	import com.isolib.as3isolib.display.IsoSprite;
	
	import flash.filters.GlowFilter;
	
	public class BIsoMapItem extends IsoSprite implements IIsoMapItem
	{
		public function BIsoMapItem(descriptor:Object=null)
		{
			super(descriptor);
		}
		
		public function setHighLight( show:Boolean, color:uint = 0xFFFFFF, alpha:Number = 1 ):void
		{
			if ( show )
				container.filters = [ new GlowFilter( color, alpha, 8, 8, 20 ) ];
			else
				container.filters = [];
		}
	}
}