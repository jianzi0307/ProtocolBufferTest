package com.jfw.engine.core.mvc.view.map
{
	import com.greensock.TweenLite;
	import com.isolib.as3isolib.display.IsoView;
	import com.isolib.as3isolib.display.scene.IsoGrid;
	import com.isolib.as3isolib.display.scene.IsoScene;
	import com.isolib.as3isolib.geom.IsoMath;
	import com.isolib.as3isolib.geom.Pt;
	import com.isolib.as3isolib.graphics.Stroke;
	import com.jfw.engine.core.data.IStruct;
	import com.jfw.engine.core.mvc.view.BView;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 支持iso的视图基类
	 * 
	 * @author jianzi
	 */	
	public class BIsoMap extends BView implements IIsoMap
	{
		protected var mapWidth:int = 24;
		protected var mapHeight:int = 24;
		protected var cellWidth:int = 30;
		protected var cellHeight:int = 30;
		
		protected var isoView:IsoView;
		protected var isoScene:IsoScene;
		protected var isoGrid:IsoGrid;
		
		protected var gridStartX:int = 0;
		protected var gridStartY:int = 0;
		protected var downPt:Point = null;
		
		
		private var dragStartX:int = 0;
		private var dragStartY:int = 0;
		private var lastX:Number = 0;
		private var lastY:Number = 0;
		
		private var dragStartMouseX:int = 0;
		private var dragStartMouseY:int = 0;
		private var isDraging:Boolean = false;
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var acceleration:Number = 0.5;//加速度
		
		protected var sceneRect:Rectangle = null;
		
		public function BIsoMap(data:IStruct=null)
		{
			super(data);
		}
		
		override protected function onInit():void
		{
			this.initMapBg();
			this.initScene();
		}
		
		public function initMapBg():void
		{
			
		}
		
		public function initScene():void
		{
			sceneRect = new Rectangle( 0, 0, 2400, 2400 );
			
			this.isoGrid = new IsoGrid();
			this.isoGrid.showOrigin = false;
			this.isoGrid.gridlines = new Stroke( 0,0x888888,0);
			this.isoGrid.setGridSize( mapWidth,mapHeight );
			this.isoGrid.cellSize = cellWidth;
			this.isoGrid.container.cacheAsBitmap = true;
			
			gridStartX = sceneRect.width * .5;
			gridStartY = sceneRect.height * .5 - cellWidth * mapWidth * .5;
			
			this.isoScene = new IsoScene();
			this.isoScene.render();
			
			isoView = new IsoView();
			isoView.setSize( sceneRect.width, sceneRect.height );
			isoView.showBorder = true;
			isoView.panTo( 0, cellWidth * mapWidth * .5 );
			isoView.addScene( isoScene );
			
			addChild( isoView );
			
			addEventListener( MouseEvent.CLICK, onClick );
			addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
		}
		
		protected function onMouseMove(event:MouseEvent):void
		{
			
		}
		
		protected function onMouseDown(event:MouseEvent):void
		{
			
			startDrag( false, new Rectangle( 
				stage.stageWidth - sceneRect.width, 
				stage.stageHeight - sceneRect.height, 
				sceneRect.width - stage.stageWidth, 
				sceneRect.height - stage.stageHeight ) );
			
			downPt = new Point( event.stageX, event.stageY );
		}
				
		protected function onMouseUp(event:MouseEvent):void
		{
			stopDrag();
		}
		
		protected function onClick(event:MouseEvent):void
		{
//			 移动过大，表示正在拖动场景
			if ( Math.abs( event.stageX - downPt.x ) > 2 || 
				Math.abs( event.stageY - downPt.y ) > 2 ) 
				return;
			
		}
		
		public function gridToView(pt:Point):Point
		{
			pt.x *= cellWidth;
			pt.y *= cellHeight;
			var isopt:Pt = new Pt( pt.x, pt.y );
			isopt = IsoMath.isoToScreen( isopt );
			
			var ptRet:Point = new Point( isopt.x, isopt.y );
			ptRet.x += gridStartX;
			ptRet.y += gridStartY;
			return ptRet;
		}
		
		public function viewToGrid( pt:Point ):Point
		{
			pt.x -= gridStartX;
			pt.y -= gridStartY;
			var isopt:Pt = new Pt( pt.x, pt.y );
			isopt = IsoMath.screenToIso( isopt );
			
			var ptRet:Point = new Point( isopt.x, isopt.y );
			ptRet.x = int( ptRet.x / cellWidth );
			ptRet.y = int( ptRet.y / cellHeight );
			return ptRet;
		}
		
		public function formatView( pt:Point ):Point
		{
			var ptRet:Point = viewToGrid( pt );
			ptRet = gridToView( ptRet );
			return ptRet;
		}
		
		public function addItem():void
		{
			
		}
		
		public function removeItem():void
		{
			
		}
		
		public function getItemByPos( x:int,y:int ):void
		{
			
		}
		
		public function showGrid( show:Boolean ):void
		{
			if ( show )
			{
				if ( -1 == this.isoScene.getChildIndex( this.isoGrid ) )
				{
					this.isoScene.addChildAt( this.isoGrid, 0 );
					this.isoScene.render();
				}
			}
			else
			{
				if ( -1 != this.isoScene.getChildIndex( this.isoGrid ) )
				{
					this.isoScene.removeChild( this.isoGrid );
					this.isoScene.render();
				}
			}
		}
		
		public function makeCenter():void
		{
			x = ( stage.stageWidth - sceneRect.width ) * 0.5;
			y = 0;
		}
		
		// 设置地图中心点
		public function setCenter( x:Number, y:Number, effect:Boolean = true ):void
		{
			x = stage.stageWidth*0.5 - x;
			y = stage.stageHeight*0.5 - y;
			
			if ( x > 0 )
				x = 0;
			if ( y > 0 )
				y = 0;
			if ( x < stage.stageWidth - sceneRect.width )
				x = stage.stageWidth - sceneRect.width;
			if ( y < stage.stageHeight - sceneRect.height )
				y = stage.stageHeight - sceneRect.height;
			
			if ( effect )
			{
				TweenLite.to( this, 0.6, { x:x, y:y } );
			}
			else
			{
				this.x = x;
				this.y = y;
			}
		}
	}
}