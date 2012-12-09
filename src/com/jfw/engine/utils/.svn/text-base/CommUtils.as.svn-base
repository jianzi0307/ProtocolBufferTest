package com.jfw.engine.utils
{
	import app.battle.components.TurnDirMenu;
	
	import fl.motion.Color;
	import fl.motion.ColorMatrix;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Transform;
	import flash.net.LocalConnection;
	import flash.system.ApplicationDomain;
	import flash.system.System;
	import flash.text.TextField;

	/**
	 * 常用函数
	 * 
	 */
	public class CommUtils 
	{
		
		public function CommUtils() 
		{
		}
		
		/**
		 * 获取当前ApplicationDomain内的类定义
		 * 
		 * @param p_name	类名称，必须包含完整的命名空间,如 net.eidiot.net.SWFLoader
		 * @param p_domain	加载swf的LoadInfo，不指定则从当前域获取
		 * @return			获取的类定义，如果不存在返回null
		 */		
		public static function getClass(p_name : String, p_domain : ApplicationDomain = null) : Class
		{
			try
			{
				if (p_domain == null)
					return ApplicationDomain.currentDomain.getDefinition(p_name) as Class;
				return p_domain.getDefinition(p_name) as Class;
			} catch (p_e : ReferenceError)
			{
				trace("getClass时出错：定义 " + p_name + " 不存在");
				return null;
			}
			return null;
		}
		
		/**
		 * 强制垃圾回收机制，将内存进行强制回收(移除显示对象并置null或者unload loader后)
		 * 
		 * @param p_name	无
		 * @return			无
		 */	
		public static function recycle(): void{
			try{
				new LocalConnection().connect('foo');
                new LocalConnection().connect('foo');
            }
            catch (err:Error){
			    trace("======gc memery");
            }
		}
		
		/**
		 * 画MC函数，如果这个mc的显示元素并不是从mc的坐标原点开始的，就会出现仅能绘制出原点右下象限的图形的问题,
		 * 通过指定第二个Matrix参数，让它从mc显示区域的左上角开始绘制。先用getBounds()方法获取显示区域左上角相对于此对象的坐标，
		 * 然后再进行绘制
		 * 
		 * @param displayObject	是画的对象
		 * @return				BitmapData
		 */	
		public static function drawDisplayObject(displayObject: DisplayObject): BitmapData{
			var _bounds: Rectangle = displayObject.getBounds(displayObject);
			var xOffset:Number = _bounds.x; 
			var yOffset:Number = _bounds.y; 
			
			var bitmapdata: BitmapData = new BitmapData((displayObject.width < 1) ? 1 : displayObject.width, 
														(displayObject.height < 1) ? 1 : displayObject.height, true, 0x00);														
			bitmapdata.draw(displayObject,new Matrix(1,0,0,1,-xOffset,-yOffset));			
			return bitmapdata;
		}
		/**
		 * 画出一个对象的非透明区域 
		 * @param displayObject
		 * @return 
		 * 
		 */		
		public static function getTransBitmapData(displayObject: DisplayObject,matrix:Matrix=null):BitmapData
		{
			var _tbmp:BitmapData=new BitmapData(displayObject.width,displayObject.height,true,0x00000000);
			_tbmp.draw(displayObject,matrix);
			var _r: Rectangle = _tbmp.getColorBoundsRect(0xFFFFFFFF, 0x0, false);
			if ((_r.width == 0) || (_r.height == 0)){
				_r = new Rectangle(0,0,_tbmp.width,_tbmp.height);
			}
			var _ebmp: BitmapData = new BitmapData(_r.width, _r.height);
			_ebmp.copyPixels(_tbmp, _r, new Point());
			_tbmp.dispose();
			return _ebmp;
		}
		/**
		 * 拷贝对象 
		 * @param source
		 * @param destion
		 * 
		 */		
		public static function copyObject(source: Object, destion: Object): void {
			for (var i:* in source){
				destion[i] = source[i];
			}
		}
		
		public static function clearContainer(obj: DisplayObjectContainer): void{
			for(var i: int=obj.numChildren-1;i>=0;i--){
				if((obj.getChildAt(i) is DisplayObjectContainer) && !(obj.getChildAt(i) is Loader)){
					clearContainer(obj.getChildAt(i) as DisplayObjectContainer);
				}
				
				obj.removeChildAt(i);
			}
		}
		
		public static function randRange(min:Number, max:Number):Number 
		{
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
		
		/**
		 * 合并两个对象 
		 * @param obj1
		 * @param obj2
		 * 用obj1 替换 obj2
		 */
		public static function mergeObject( obj1:Object,obj2:Object ):Object
		{
//			var obj:Object = {};
//			for( var p:String in obj1 )
//			{
//				obj[p] = obj1[p];
//			}
//			for( var p1:String in obj2 )
//			{
//				obj[p1] = obj2[p1];
//			}
//			return obj;
			
			//优化，只遍历属性较少的一个对象
			for( var p:String in obj1 )
			{
				if( obj2[p] == null || obj2[p] == undefined )
					obj2[p] = obj1[p];
			}
			return obj2;
		}
		
		/**
		 * 根据百分比调整颜色 
		 * 0-255
		 * 1为中间值
		 * 0为灰度值
		 */
		public static function setBarColor( mc:DisplayObject,per:int ):void
		{
			var mat:ColorMatrix = new ColorMatrix();
			var filter:ColorMatrixFilter = new ColorMatrixFilter();
			var val:int = int( 255 * per / 100 );
			mat.SetSaturationMatrix( val );
			filter.matrix = mat.GetFlatArray();
			mc.filters = [ filter ];
		}
		
		/**
		 * 给simpbutton类型的按钮加入文本说明 
		 */
		public static function setSimpleButtonLabel( mc:SimpleButton,tx:String,useEmbedFonts:Boolean = false,fontName:String='YaHei' ):void
		{
			if( useEmbedFonts )
			{
				FontUtil.setEmbedFonts( (((mc.upState as Sprite).getChildAt(1)) as TextField),tx,fontName );
				FontUtil.setEmbedFonts( (((mc.overState as Sprite).getChildAt(1)) as TextField),tx,fontName );
				FontUtil.setEmbedFonts( (((mc.downState as Sprite).getChildAt(1)) as TextField),tx,fontName );
			}
			else
			{
				FontUtil.setText( (((mc.upState as Sprite).getChildAt(1)) as TextField),tx );
				FontUtil.setText( (((mc.overState as Sprite).getChildAt(1)) as TextField),tx );
				FontUtil.setText( (((mc.downState as Sprite).getChildAt(1)) as TextField),tx );
			}
		}
		
		/**
		 * 元件颜色渐变过渡 
		 * @param clip
		 * @param per
		 * @param color
		 * 
		 */
		public static function changeColor( clip:MovieClip , per:int ,color:Array ):void
		{
			var curVal:Number = Math.ceil( 1 / ( 255 -1 ) * per*2 * 100) / 100;
			var clipTransform:ColorTransform = new ColorTransform();
			clipTransform.color=Color.interpolateColor( color[0],color[1],curVal );
			clip.transform.colorTransform=clipTransform;
		}
	}
	
}