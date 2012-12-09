package com.jfw.engine.motion
{
	import app.manager.IResourceManager;
	
	import com.jfw.engine.animation.AtlasObject;
	import com.jfw.engine.animation.BmdAtlas;
	import com.jfw.engine.animation.Texture;
	import com.jfw.engine.isolib.map.consts.DirectionConst;
	import com.jfw.engine.motion.AnimationConst;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;

	/**
	 * 实现动态资源加载,更新偏移量 
	 * @author Administrator
	 * 
	 */	
	public class BaseAnimation extends MutiStateMovieClip implements IAnimation
	{
		protected var id:String;
		protected var manager:IResourceManager=null;
		protected var bmdAtlas:BmdAtlas=null;//资源工具
		protected var currFps:int=12;
		protected var xAdjust:Number=0;
		protected var yAdjust:Number=0;
		protected var zoom:Number=1.0;
		protected var currFrameName:String;	
		protected var isDestroy:Boolean=false;//是否已经被卸载
		protected var isRedraw:Boolean=false;//是否被重绘过
		
		public function BaseAnimation(srcId:String,manager:IResourceManager,frameName:String,defaultTextures:BitmapData,fps:Number=12)
		{
			this.id=srcId;
			this.manager=manager;
			this.currFrameName=frameName;
			this.currFps=fps;

			bmdAtlas=manager.getSource(srcId);
			var atlasObj:AtlasObject=null;
			
			if(bmdAtlas)
			{
				atlasObj=bmdAtlas.getTextures(currFrameName);
				
				if(atlasObj.textures.length==0)
				{
					isRedraw=false;
					atlasObj=getTextures(defaultTextures);
				}
				else
				{
					isRedraw=true;
				}
			}
			else
			{
				isRedraw=false;
				atlasObj=getTextures(defaultTextures);
			}
			
			super(atlasObj,fps);
			updateOffset();
			
			if(bmdAtlas==null)
				manager.loadRes(srcId,redraw);
		}
		
		private function getTextures(bmd:BitmapData):AtlasObject
		{
			var atlasObj:AtlasObject=new AtlasObject();
			atlasObj.textures=new Vector.<Texture>();
			atlasObj.textures.push( new Texture(bmd,bmd.rect,bmd.rect));
			atlasObj.xOffset=bmd.width/2;
			atlasObj.yOffset=bmd.height;
			return atlasObj;
		}
		/**
		 * 重绘动态资源 
		 * 
		 */		
		public function redraw(bmdAtlas:BmdAtlas):void
		{
			if(this.isDestroy)
				return;
			
			if(this.mDurations==null)
				return;
			
			this.bmdAtlas=bmdAtlas;
			update();
			this.dispatchEvent(new AnimationEvent(AnimationEvent.UPDATE_TEXTURES,true,true));
			isRedraw=true;
		}
		/**
		 * 跳到某个关键帧 
		 * @param frameName	关键帧名称
		 */		
		protected function update():void
		{
			if(bmdAtlas==null)
				return;
			
			var atlasObj:AtlasObject=bmdAtlas.getTextures(currFrameName);
			
			if(atlasObj.textures.length>0)
			{
				this.changeTextures(atlasObj);
				updateOffset();
			}
			else
			{
				atlasObj=null;
				return;
			}
		}
		/**
		 * 更新偏移量 ,预留方法,用来直接继承时用
		 * 
		 */		
		protected function updateOffset():void
		{
		}
		
		public function get CurFrameName():String
		{
			return currFrameName;
		}
		
		public function set CurFrameName(value:String):void
		{
			if(value!=currFrameName)
			{
				currFrameName=value;
				update();
			}
		}
		
		public function get CurrTexture():Texture
		{
			return this.getFrameTexture(this.currentFrame);
		}

		public function get CurrFrame():int
		{
			return this.currentFrame;
		}
		
		public function get totalFrames():int
		{
			return this.numFrames;
		}
		
		public function getAnimation():DisplayObject
		{
			return this;
		}
		
		public function get XOffset():Number
		{
			return zoom*(this.xOffset-this.xAdjust);
		}
		
		public function get YOffset():Number
		{
			return zoom*(this.yOffset-this.yAdjust);
		}
		
		public function set XAdjust(value:Number):void
		{
			this.xAdjust=value;
		}
		
		public function set YAdjust(value:Number):void
		{
			this.yAdjust=value;
		}
		
		public function get Zoom():Number
		{
			return this.zoom;
		}
		
		public function set Zoom(value:Number):void
		{
			if(value!=zoom)
			{
				this.zoom=value;
				this.scaleX=value;
				this.scaleY=value;
				this.dispatchEvent(new AnimationEvent(AnimationEvent.UPDATE_TEXTURES,true,true));
			}
		}
		
		public function get OriginX():Number
		{
			return x;
		}
		
		public function set OriginX(value:Number):void
		{
			x=value;
		}
		
		public function get OriginY():Number
		{
			return y;
		}
		
		public function set OriginY(value:Number):void
		{
			y=value;
		}
		
		override public function advanceTime(passedTime:Number):void
		{
			this.updateOffset();
			
			super.advanceTime(passedTime);
		}

		public function get IsRedraw():Boolean
		{
			return this.isRedraw;
		}
	
		public function get IsDestroy():Boolean
		{
			return this.isDestroy;
		}
		
		override public function destroy():void
		{	
			this.isDestroy=true;
			super.destroy();
			
			manager=null;
			bmdAtlas=null;//资源工具
		}
	}
}