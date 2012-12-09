package com.jfw.engine.utils
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.GradientGlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class FilterUtil
	{
		// 变灰
		public static function applyblack(child:DisplayObject,isCover:Boolean = true,index:int=0):void 
		{      
            var matrix:Array = new Array();
            matrix = matrix.concat([0.3086,0.6094,0.082,0,0]); // red
            matrix = matrix.concat([0.3086,0.6094,0.082,0,0]); // green
            matrix = matrix.concat([0.3086,0.6094,0.082,0,0]); // blue
            matrix = matrix.concat([0,0,0,1,0]); // alpha

            applyFilter(child,matrix,isCover,index);
        }
		
        public static function applyRed(child:DisplayObject,isCover:Boolean = true,index:int=0):void {
           
            var matrix:Array = new Array();
            matrix = matrix.concat([1, 0, 0, 0, 0]); // red
            matrix = matrix.concat([0, 0, 0, 0, 0]); // green
            matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha

			applyFilter(child,matrix,isCover,index);
        }

        public static function applyGreen(child:DisplayObject,isCover:Boolean = true,index:int=0):void {
            var matrix:Array = new Array();
            matrix = matrix.concat([0, 0, 0, 0, 0]); // red
            matrix = matrix.concat([0, 1, 0, 0, 0]); // green
            matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha

			applyFilter(child,matrix,isCover,index);
        }

        public static function applyBlue( child:DisplayObject,isCover:Boolean = true,index:int=0):void {
            var matrix:Array = new Array();
            matrix = matrix.concat([0, 0, 0, 0, 0]); // red
            matrix = matrix.concat([0, 0, 0, 0, 0]); // green
            matrix = matrix.concat([0, 0, 1, 0, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha

			applyFilter(child,matrix,isCover,index);
        }
		
		public static function applyOrange( child:DisplayObject,isCover:Boolean = true,index:int=0 ):void {
			var matrix:Array = new Array();
			matrix = matrix.concat([0, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, 0, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, 1, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			applyFilter(child,matrix,isCover,index);
		}
		
		public static function applyPurple( child:DisplayObject,isCover:Boolean = true,index:int=0 ):void {
			var matrix:Array = new Array();
			matrix = matrix.concat([1, 1, 1, 1, 1]); // red
			matrix = matrix.concat([0, 0, 0, 0, 0]); // green
			matrix = matrix.concat([1, 1, 1, 1, 1]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			applyFilter(child,matrix,isCover,index);
		}
		
		public static function applyContrast( child:DisplayObject, filter:ColorMatrixFilter = null ):void
		{
			if( !filter )
				//filter = new ColorMatrixFilter([2.69,-0.61,-0.08,0,-128,-0.31,2.39,-0.08,0,-128,-0.31,-0.61,2.92,0,-128,0,0,0,1,0]);
				//filter = new ColorMatrixFilter([1.69,-0.61,-0.08,0,0,-0.31,1.39,-0.08,0,0,-0.31,-0.61,1.92,0,0,0,0,0,1,0]);
				//filter = new ColorMatrixFilter([1.2,0,0,0,-0.1,0,1.2,0,0,-0.1,0,0,1.2,0,-0.1,0,0,0,1,0]);
				//filter = new ColorMatrixFilter([1.55,-0.3,-0.04,0,-0.1,-0.15,1.4,-0.04,0,-0.1,-0.15,-0.3,1.66,0,-0.1,0,0,0,1,0]);
				filter = new ColorMatrixFilter([1.89,-0.61,-0.08,0,-0.1,-0.31,1.59,-0.08,0,-0.1,-0.31,-0.61,2.12,0,-0.1,0,0,0,1,0]);
//			new ColorTransform(1.09,1,1,1,0,0,0,0)
			child.filters = [ filter ];
		}
		/**
		 * 
		 * @param child
		 * @param matrix
		 * @param isCover false添加true修改
		 * 
		 */
        public static function applyFilter(child:DisplayObject, matrix:Array,isCover:Boolean = true,index:int=0):void 
		{
            var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
			var arr:Array;
			
			if(isCover)
			{
				if(index>=child.filters.length)
				{			
					arr=child.filters;
					arr.push(filter);			
				}
				else
				{
					arr=child.filters;
					arr[index]=filter;
				}
			}
			else
			{
				arr=child.filters;
				arr.push(filter);
			}
			
			child.filters=arr;
        }
		
		/** 
		 * 鼠标经过楼体的滤镜效果
		 * @param 
		 */
		public static function setGlowFilter(child:DisplayObject,blurSize:int = 2,strengthSize:int = 1, col:uint = 0xffff00,isCover:Boolean = true,index:int=0):void 
		{
			var color:Number=0xffffff;
			var alpha:Number=1;
			var blur:Number=blurSize;
			var strength:Number=strengthSize;
			var inner:Boolean=false;
			var knockout:Boolean=false;
			var quality:Number=BitmapFilterQuality.HIGH;
			//var _glowFilter:GlowFilter = new GlowFilter(color, alpha, blurX, blurY, strength, quality, inner, knockout);
			var _glowFilter:GradientGlowFilter = new GradientGlowFilter(0, 45, [col, col], [0, 1, 1, 1], [0, 63, 126, 255], blur, blur,strength, BitmapFilterQuality.HIGH, BitmapFilterType.OUTER, false);
			
			var arr:Array;
			
			if(isCover)
			{
				if(index>=child.filters.length)
				{
					arr=child.filters;
					arr.push(_glowFilter);
				}
				else
				{
					arr=child.filters;
					arr[index]=_glowFilter;
				}
			}
			else
			{
				arr=child.filters;
				arr.push(_glowFilter);

			}
			
			child.filters=arr;
		}
		/**
		 * 指定索引是否有滤镜 
		 * @param index
		 * 
		 */		
		public static function hasFilter(child:DisplayObject,index:int):Boolean
		{
			return index<child.filters.length;
		}
		/**
		 * 设置字体描边样式
		 *  
		 * @param tx
		 * @param tf
		 * @param color
		 */
		public static function setFontFilter(tx:TextField,color:uint = 0x0,borderSize:int = 2):void 
		{
			var alpha:Number	= 1;
			var blurX:Number	= borderSize;
			var blurY:Number	= borderSize;
			var strength:Number = 10;
			var inner:Boolean	= false;
			var knockout:Boolean = false;
			var quality:Number=BitmapFilterQuality.LOW;
			var _glowFilter:BitmapFilter = new GlowFilter(color,alpha,blurX,blurY,strength, BitmapFilterQuality.LOW, inner, knockout)
			var filters:Array = new Array();
			filters.push(_glowFilter);
			
			tx.filters = filters;
		}
		
		/**
		 * 清除滤镜效果 
		 * 
		 */
		public static function clearGlowFilter(child:DisplayObject,index:int=0):void
		{
			if(index < child.filters.length)
			{
				var arr:Array=child.filters;
				arr.splice(index,1);
				child.filters=arr;
			}
		}
		
		/**
		 * 清空所有滤镜效果 
		 * 
		 */
		public static function clearAllFilters(child:DisplayObject):void
		{
			child.filters = [];
		}
		
		/** 
		 * 鼠标移出墙纸的滤镜效果
		 * @param 
		 */
		public static function getGlowFilter(color:Number):GlowFilter
		{
			var _glowFilter:GlowFilter = null;
			var color:Number = color;
			var alpha:Number = 1;
			var blurX:Number = 6;
			var blurY:Number = 6;
			var strength:Number = 6;
			var inner:Boolean = false;
			var knockout:Boolean = false;
			var quality:Number = BitmapFilterQuality.HIGH;
			_glowFilter = new GlowFilter(color, alpha, blurX, blurY, strength, quality, inner, knockout);
			
			return _glowFilter;
		}
		
		public static function setTextLightBorder(displayObject:DisplayObject,color:uint=0xffffff,blur:Number=1.5,strength:Number=10,alpha:Number=1):void
		{
			
			var blurX:Number=blur;
			
			var blurY:Number=blur;
			
			var quality:Number=BitmapFilterQuality.HIGH;
			
			displayObject.filters = [new GlowFilter(color, alpha, blurX, blurY, strength, quality)];
		}
	}

}