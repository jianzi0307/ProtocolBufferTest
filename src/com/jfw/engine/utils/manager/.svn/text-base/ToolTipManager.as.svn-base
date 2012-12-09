package com.jfw.engine.utils.manager
{
	import flash.accessibility.AccessibilityProperties;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	import flash.text.TextFormat;

	public class ToolTipManager
	{
		private static var impl:ToolTipManagerImpl;

		private static function getImpl():ToolTipManagerImpl
		{
			return impl ||= new ToolTipManagerImpl();
		}

		/**
		 * 
		 * @param base 按钮提示管理器视图容器
		 * @param format TextFormat
		 * @param bgColor
		 * @param bgAlpha
		 * @param hasShadow
		 * @param hasBorder
		 * @param borderColor
		 * @param borderAlpha
		 * @param borderThickNess
		 */
		public static function init( base:DisplayObjectContainer, format:TextFormat, style:StyleSheet,
			bgColor:uint = 0xffffff, bgAlpha:Number = 1, hasShadow:Boolean = true, hasBorder:Boolean = false,
			borderColor:uint=0xffffff, borderAlpha:Number=1, borderThickNess:Number=1, bgFading:Boolean=true ):void
		{
			base.addChild( getImpl() );
			if(style)
				getImpl().setStyle(style);
			if(format && !style)
				getImpl().setLabelFormat( format );
			getImpl().setBgStyle( bgColor, bgAlpha, hasShadow, hasBorder, borderColor, 
				borderAlpha, borderThickNess, bgFading );
		}

		public static function register( area:DisplayObject, message:String ):void
		{
			if( '' != message )
			{
				//
				// 将按钮提示信息，附在按钮元件的accessibilityProperties属性之中
				// 并且给按钮元件添加ROLL_OVER事件，交由ToolTipManagerImpl进行显示
				//
				var prop:AccessibilityProperties = new AccessibilityProperties();
				message = message.replace( '[br]', '\n' );
				message = message.replace( /\\n/g, '<br/>' );
				prop.description = message;
				area.accessibilityProperties = prop;
				area.addEventListener( MouseEvent.ROLL_OVER, getImpl().handler );
			}
			else if( area.hasEventListener( MouseEvent.ROLL_OVER ) && null != area.accessibilityProperties )
				area.removeEventListener( MouseEvent.ROLL_OVER, getImpl().handler );
		}
		
		public static function unregister( area:DisplayObject ):void
		{
			area.removeEventListener( MouseEvent.ROLL_OVER, getImpl().handler );
		}
	}
}


import com.greensock.TweenLite;
import com.greensock.easing.Back;
import com.jfw.engine.utils.FilterUtil;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.StyleSheet;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

class ToolTipManagerImpl extends Sprite
{
	private var label:TextField;
	private var area:DisplayObject;
	
	private var defaultTextFormat:TextFormat;
	
	private var bgColor:uint = 0xffffff;
	
	private var bgAlpha:Number = 1;
	private var hasShadow:Boolean = true;
	
	private var hasBorder:Boolean = true;
	private var borderColor:uint = 0xffffff;
	private var borderAlpha:Number = 1;
	private var borderThickNess:Number = 1;
	private var bgFading:Boolean = true;
	
	public function ToolTipManagerImpl()
	{
		label = new TextField();
	//	label.embedFonts = true;
		label.textColor = 0xffffff;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.selectable = false;
		label.multiline = true;
		label.condenseWhite = true;
		label.wordWrap = false;
		FilterUtil.setFontFilter(label);
		//label.text = "提示信息";
		label.x = 10;
		label.y = 8;
		addChild(label);
		//redraw();
		visible = false;
		mouseEnabled = mouseChildren = false;
	}
	
	public function setStyle(style:StyleSheet):void
	{
		label.styleSheet = style;
	}

	public function setLabelFormat(format:TextFormat):void
	{
		defaultTextFormat = format;
		label.defaultTextFormat = format;
	}
	
	public function setBgStyle(bgColor:uint,bgAlpha:Number,hasShadow:Boolean,hasBorder:Boolean=false,borderColor:uint=0xffffff,borderAlpha:Number=1,borderThickNess:Number=1, bgFading:Boolean = true):void
	{
		this.bgColor = bgColor;
		this.bgAlpha = bgAlpha;
		this.hasShadow = hasShadow;
		
		this.hasBorder = hasBorder;
		this.borderColor = borderColor;
		this.borderAlpha = borderAlpha;
		this.borderThickNess = borderThickNess;
		this.bgFading = bgFading;
	}

	private function redraw( up:Boolean=true, point:Point=null ):void
	{
		var w:Number = 18 + label.width;
		var h:Number = 16 + label.height;
		
		var pointX:Number = 0;
		if( null != point )
			pointX = point.x;
		else
			pointX = w / 2;
		
		graphics.clear();
		
		if ( hasShadow )
			redrawBg( 3, 3, w + 3, h + 3, 10, up, pointX + 3, 10, 0x000000, 0.4,this.hasBorder );
		
		redrawBg(0, 0, w, h,10, up, pointX, 10, bgColor, bgAlpha, this.hasBorder);
	}
	
	private function redrawBg( sX:Number, sY:Number, eX:Number, eY:Number, ellipsSize:Number, up:Boolean, arrowX:Number, arrowSize:Number, color:uint, alpha:Number, border:Boolean = false ):void
	{
		graphics.beginFill( color, alpha );
		if ( border )
			graphics.lineStyle( borderThickNess, borderColor, borderAlpha, true );
		//graphics.drawRoundRect(0, 0, w, h, 8,8);
		if ( up )
		{
			graphics.moveTo(sX,ellipsSize);
			graphics.curveTo(sX,sY,ellipsSize,sY);
			graphics.lineTo(eX - ellipsSize,sY);
			graphics.curveTo(eX,sY,eX,ellipsSize);
			graphics.lineTo(eX,eY - ellipsSize);
			graphics.curveTo(eX,eY,eX - ellipsSize,eY);
			graphics.lineTo(arrowX + 5,eY);
			graphics.lineTo(arrowX,eY + arrowSize);
			graphics.lineTo(arrowX - 5,eY);
			graphics.lineTo(ellipsSize,eY);
			graphics.curveTo(sX,eY,sX,eY - ellipsSize);
			graphics.lineTo(sX,ellipsSize);
		}
		else
		{
			graphics.moveTo(sX,ellipsSize);
			graphics.curveTo(sX,sY,ellipsSize,sY);
			graphics.lineTo(arrowX - 5,sY);
			graphics.lineTo(arrowX,sY - arrowSize);
			graphics.lineTo(arrowX + 5,sY);
			graphics.lineTo(eX - ellipsSize,sY);
			graphics.curveTo(eX,sY,eX,ellipsSize);
			graphics.lineTo(eX,eY - ellipsSize);
			graphics.curveTo(eX,eY,eX - ellipsSize,eY);
			graphics.lineTo(ellipsSize,eY);
			graphics.curveTo(sX,eY,sX,eY - ellipsSize);
			graphics.lineTo(sX,ellipsSize);
		}
		this.graphics.endFill();
	}

	public function show( area:DisplayObject ):void
	{
		this.area = area;
		//this.area.addEventListener(MouseEvent.MOUSE_MOVE, this.handler);
		
		var str:String = String(area.accessibilityProperties.description);
		
		if(str.indexOf("html:") == 0)
		{
			str = str.substr(5);
			label.htmlText = str;
		}else
		{
			label.text					= str;
		}
		
		
		
		redraw();
	}


	public function hide():void
	{
		if(this.area)
		{
			if(this.area.hasEventListener(MouseEvent.ROLL_OUT))
				this.area.removeEventListener(MouseEvent.ROLL_OUT, this.handler);
			//this.area.removeEventListener(MouseEvent.MOUSE_MOVE, this.handler);
			this.area = null;
		//		visible = false;
		}
	}

	/*public function move(point:Point):void
	   {
	   var lp:Point = this.parent.globalToLocal(point);
	   this.x = lp.x - 6;
	   this.y = lp.y - label.height - 12;

	   this.x = this.x < 0 ? 0 : this.x;
	   this.y = this.y < 0 ? 0 : this.y;

	   var stage:Stage = area.stage;
	   if(x + width > stage.stageWidth)
	   {
	   x = stage.stageWidth - width;
	   }
	   if(y + height > stage.stageHeight)
	   {
	   y = stage.stageHeight - height;
	   }

	   if(!visible){
	   visible = true;
	   }
	 }*/

	public function move( rec:Rectangle ):void
	{
		var lp:Point = new Point(rec.x + rec.width / 2, rec.y);
		var end:Point = new Point(rec.x + rec.width / 2, rec.y + rec.height);
		
		var w:Number = 10 + label.width;
		var defaultX:Number = lp.x - w/2;
		this.x = defaultX;
		var defaultY:Number = lp.x - w/2 + 5;
		this.y = lp.y - label.height - 12;

		this.x = this.x < 0 ? 0 : this.x;
		
		var up:Boolean = this.y >= 0;
		if (this.y < 0)
		{
			this.y = end.y + 5;
			
		}

		var stage:Stage = area.stage;
		if (x + width > stage.stageWidth)
		{
			x = stage.stageWidth - width;
		}
		if (y + height > stage.stageHeight)
		{
			y = stage.stageHeight - height;
		}
		
		redraw(up,globalToLocal(new Point(rec.x + rec.width/2,rec.y)));

//		if (!visible)
//		{
//			visible = true;
//		}
	}

	public function handler(event:MouseEvent):void
	{
		var area:DisplayObject = DisplayObject(event.target);
		switch (event.type)
		{
			case MouseEvent.ROLL_OUT:
				TweenLite.killDelayedCallsTo(endDelay);
				this.hide();
				hideAction();
				break;
			/*case MouseEvent.MOUSE_MOVE:
			   this.move(new Point(area.y, event.stageY));
			 break;*/
			case MouseEvent.ROLL_OVER:
				area.addEventListener(MouseEvent.ROLL_OUT, this.handler);
				TweenLite.delayedCall(.3,endDelay,[area]);
				break;
		}
	}
	
	private function endDelay(display:DisplayObject):void
	{
		this.show(display);
		this.move(display.getRect(this.parent))
		showAction();
	}
		
		
	
	private function showAction():void
	{
		if (bgFading)
		{
			alpha = .1;
			visible = true;
			
			var end:Object = new Object();
			end.alpha = 1;
			end.onComplete = showActionComplete;
			//end.ease = Back.easeIn;
			TweenLite.to(this, 0.7, end);
		}
		else
		{
			visible = true;
			alpha = 1;
			showActionComplete();
		}
	}
	
	private function showActionComplete():void
	{
		
	}
	
	private function hideAction():void
	{
		if (bgFading)
		{
			alpha = 1;
			visible = true;
			
			var end:Object = new Object();
			end.alpha = .1;
			end.onComplete = hideActionComplete;
			//end.ease = Back.easeIn;
			TweenLite.to(this, 0.7, end);
		}
		else
		{
			alpha = 0;
			hideActionComplete();
		}
	}
	
	private function hideActionComplete():void
	{
		visible = false;
	}
}
