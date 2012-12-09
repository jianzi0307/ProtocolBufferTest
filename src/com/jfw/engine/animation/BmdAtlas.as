package com.jfw.engine.animation
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;

	public class BmdAtlas
	{
		private var mBmd:BitmapData;
		private var mBmdRegions:Dictionary;
		private var mBmdFrames:Dictionary;
		
		//偏移量
		private var offsetPoint:Point;
		
		private var isClearAlphaRegions:Boolean ;
		
		/**
		 * 位图集
		 *  
		 * @param bmd		TexturePacker工具生成的位图
		 * @param atlasXml 	TexturePacker工具生成的xml
		 * @param clearAlphaRegions	是否扣掉透明区域
		 * 
		 * 【注】 
		 * 扣除透明区域可以减少大量内存占用
		 * 								
		 * 	TODO:  扣除透明区域为了对齐每帧动作，需要调整原点
		 * 【暂通过美工扣除透明区域】
		 */		
		public function BmdAtlas( bmd:BitmapData, atlasXml:XML=null, clearAlphaRegions:Boolean = false )
		{
			mBmdRegions = new Dictionary();
			mBmdFrames  = new Dictionary();
			offsetPoint = new Point();
			mBmd   = bmd;
			isClearAlphaRegions = clearAlphaRegions;
			
			if (atlasXml)
				parseAtlasXml(atlasXml);
		}
		
		/** Disposes the atlas texture. */
		public function dispose():void
		{
			mBmd.dispose();
		}
		
		private function parseAtlasXml(atlasXml:XML):void
		{
			//偏移量
			offsetPoint.x = atlasXml.@xOffset;
			offsetPoint.y = atlasXml.@yOffset;
			
			for each (var subTexture:XML in atlasXml.SubTexture)
			{
				var name:String        = subTexture.attribute("name");
				var x:Number           = parseFloat(subTexture.attribute("x"));
				var y:Number           = parseFloat(subTexture.attribute("y"));
				var width:Number       = parseFloat(subTexture.attribute("width"));
				var height:Number      = parseFloat(subTexture.attribute("height"));
				var frameX:Number      = parseFloat(subTexture.attribute("frameX"));
				var frameY:Number      = parseFloat(subTexture.attribute("frameY"));
				var frameWidth:Number  = parseFloat(subTexture.attribute("frameWidth"));
				var frameHeight:Number = parseFloat(subTexture.attribute("frameHeight"));
				
				var region:Rectangle = new Rectangle(x, y, width, height);
				var frame:Rectangle  = frameWidth > 0 && frameHeight > 0 ?
					new Rectangle(frameX, frameY, frameWidth, frameHeight) : null;
				
				addRegion(name, region, frame);
			}
		}
		
		/** Returns the offset point. */
		public function getOffset():Point
		{
			return this.offsetPoint;
		}
		
		/** Retrieves a subtexture by name. Returns <code>null</code> if it is not found. */
		public function getTexture(name:String):Texture
		{
			var region:Rectangle = mBmdRegions[name];
			var frame:Rectangle = mBmdFrames[name];
			var bmd:BitmapData = null;
			var _ebmp:BitmapData = null;

			if( null == region )
				return null;
			
			if( frame == null )
				frame = new Rectangle( 0, 0, region.width,region.height );
			
			bmd = new BitmapData( frame.width,frame.height,true,0x00ff0000 );
			bmd.copyPixels( mBmd,region,new Point( -frame.x,-frame.y ) );
				
			if( !isClearAlphaRegions )
			{
				return new Texture( bmd,frame,region );
			}
				
			//经测试：扣掉透明区域，能够减少大量内存占用
			var _r: Rectangle = bmd.getColorBoundsRect(0xFFFFFFFF, 0x0, false);
			if ((_r.width == 0) || (_r.height == 0))
			{
				_r = new Rectangle(0,0,bmd.width,bmd.height);
			}
			_ebmp = new BitmapData(_r.width, _r.height);
			_ebmp.copyPixels(bmd, _r, new Point(0,0),null,null);
			bmd.dispose();
			return new Texture( _ebmp,frame,region );
		}
		
		/** Returns the atlas object */
		public function getTextures(prefix:String=""):AtlasObject
		{
			var  atlasObject:AtlasObject = new AtlasObject();
			
			var bmds:Vector.<Texture> = new <Texture>[];
			var names:Vector.<String> = new <String>[];
			var name:String;
			for (name in mBmdRegions)
			{
				if (name.indexOf(prefix) == 0)
					names.push(name);
			}
			names.sort(Array.CASEINSENSITIVE);
			
			for each (name in names) 
				bmds.push(getTexture(name)); 
			
			atlasObject.xOffset = this.offsetPoint.x;
			atlasObject.yOffset = this.offsetPoint.y;
			atlasObject.textures = bmds;
			return atlasObject;
		}
		
		/** Creates a region for a subtexture and gives it a name. */
		public function addRegion(name:String, region:Rectangle, frame:Rectangle=null):void
		{
			mBmdRegions[name] = region;
			if ( frame )
				mBmdFrames[name] = frame;
		}
		
		/** Removes a region with a certain name. */
		public function removeRegion(name:String):void
		{
			delete mBmdRegions[name];
		}
	}
}