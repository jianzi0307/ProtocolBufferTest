package com.jfw.engine.isolib.isometric
{
	/** 
	 * 菱形类
	 */ 
	public class IsoTile extends IsoSprite 
	{ 
		protected var _height:Number; 
		protected var _color:uint=0; 
		protected var _lineColor:uint=0;
		protected var _lineWidth:Number=0;
		protected var _alpha:Number=0;
		protected var _lineAlpha:Number=0
		
		public function IsoTile(size:Number, color:uint,alpha:Number=1,lineColor:uint=0,lineWidth:Number=0,lineAlpha:Number=1) 
		{ 
			super(size); 
			_color = color; 
			_height = height; 
			_alpha=alpha;
			_lineColor=lineColor;
			_lineWidth=lineWidth;
			_lineAlpha=lineAlpha;
			draw(); 
		} 
		/** 
		 * Draws the tile. 
		 */ 
		protected function draw():void 
		{ 
			graphics.clear(); 
			graphics.beginFill(_color,_alpha); 
			graphics.lineStyle(_lineWidth, _lineColor,_lineAlpha); 
			graphics.moveTo(-size, 0); 
			graphics.lineTo(0, -size * .5); 
			graphics.lineTo(size, 0); 
			graphics.lineTo(0, size * .5); 
			graphics.lineTo(-size, 0); 
			graphics.endFill();
		} 
		/** 
		 * Sets / gets the color of this tile. 
	    */ 
		public function set color(value:uint):void 
		{ 
			_color = value; 
			draw(); 
		} 
		public function get color():uint 
		{ 
			return _color; 
		} 
		override public function set alpha(value:Number):void 
		{ 
			_alpha = value; 
			draw(); 
		} 
		override public function get alpha():Number 
		{ 
			return _alpha; 
		} 
	} 
}