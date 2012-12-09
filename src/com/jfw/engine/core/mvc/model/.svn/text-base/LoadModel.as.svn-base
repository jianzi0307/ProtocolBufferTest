package com.jfw.engine.core.mvc.model
{
	import app.mvc.control.events.LoadingEvent;
	
	import com.jfw.engine.core.data.LoadStruct;
	import com.jfw.engine.utils.IQueueItem;
	import com.stimuli.loading.BulkLoader;
	import com.stimuli.loading.BulkProgressEvent;
	import com.stimuli.loading.loadingtypes.LoadingItem;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/** 加载静态资源基类 ,实现 IEventDispatcher接口,可发送事件 */
	public class LoadModel extends BModel implements ILoadModel,IQueueItem
	{
		/** 下载失败重试次数 */
		static private const RETRY_LIMIT:int = 10;
		
		protected var dispatcher:EventDispatcher = null;
		
		protected var applicationDomain:ApplicationDomain = null;		
		
		/** 加载器 */
		protected var loader:BulkLoader = null;
		
		protected var baseAssetsList:Array = null;
		
		/** xml数据 */
		protected var xmlMap:Object;
		
		/** 游戏数据库 */
		protected var database:Object;
		
		public function LoadModel()
		{
			super();
			
			xmlMap = new Object();
		}
		
		override public function onRegister():void
		{
			applicationDomain = ApplicationDomain.currentDomain;//new ApplicationDomain( ApplicationDomain.currentDomain );
			dispatcher = new EventDispatcher( this );
		}
		
		override public function onRemove():void
		{
			applicationDomain = null;
			dispatcher = null;
		}
		
		public function loadRes( res:Array ):void
		{
			baseAssetsList = res;
			loader = new BulkLoader( sign );
			//输出加载日志
			loader.logLevel = BulkLoader.LOG_ERRORS;
			
			loader.addEventListener( BulkProgressEvent.PROGRESS, onAssetsLoading );
			loader.addEventListener( BulkProgressEvent.SINGLE_COMPLETE, onSingleAssetLoaded );
			loader.addEventListener( BulkProgressEvent.COMPLETE, onAssetsLoaded );
			
			var loaderContext:LoaderContext = new LoaderContext();
			loaderContext.applicationDomain = this.applicationDomain;
			
			for each ( var assets:LoadStruct in baseAssetsList )
			{
				loader.add( assets.path, 
					{ 
						id:assets.id,
						maxTries:RETRY_LIMIT,
						type:assets.type,
						context:loaderContext 
					} 
				);
			}
			loader.start();
		}
		
		public function execute( obj:* = null ):void
		{
			var resArr:Array = ( !obj ) ? this.getBaseAssetsList() : ( obj as Array ) ;
			this.loadRes( resArr );
		}
		
		public function process( obj:* = null ):void
		{
			
		}
		
		public function result():void
		{
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		/**
		 * 需要下载的资源列表 
		 * @return 
		 * 
		 */
		protected function getBaseAssetsList():Array
		{
			return [
			
			];
		}
		
		/**
		 * 需要完成后要做的事
		 * @return 
		 * 
		 */
		protected function initAssets():void
		{
			
		}
		
		private function onAssetsLoading( evt:BulkProgressEvent ):void
		{
			//trace( evt.loadingStatus() );
			process( evt );
		}
		
		/**
		 * 单独文件下载完调用 
		 * @param evt
		 * 
		 */
		protected function onSingleAssetLoaded( evt:BulkProgressEvent ):void
		{
			if( LoadStruct.TYPE_BINARY == evt.item.type )
			{
				var content:ByteArray = loader.getBinary( evt.item.id );
				try
				{
					content.uncompress( );
				}
				catch( e:Error )
				{
					throw e;
				}
				this.xmlMap[ evt.item.id ] = XML( content );
			}
		}
		
		private function onAssetsLoaded( evt:BulkProgressEvent ):void
		{
			initAssets();
			
			loader.removeEventListener(BulkProgressEvent.PROGRESS,onAssetsLoading);
			loader.removeEventListener(BulkProgressEvent.SINGLE_COMPLETE,onSingleAssetLoaded);
			loader.removeEventListener(BulkProgressEvent.COMPLETE,onAssetsLoaded);
			loader.clear();
			loader = null;
			
			baseAssetsList = [];
			
			
			
			result();
		}
		
		/**
		 * 是否包含类 
		 * @param name
		 * @return 
		 * 
		 */
		public function hasClass( name:String ):Boolean
		{
			return applicationDomain.hasDefinition( name );
		}
		
		/**
		 * 获取类 
		 * @param name
		 * @return 
		 * 
		 */
		public function getClass( name:String ):Class
		{
			if( !hasClass( name ) )
				return null;
			return applicationDomain.getDefinition( name ) as Class;
		}
		
		/**
		 * 获取实例 
		 * @param name
		 * @return 
		 * 
		 */
		public function getDisplayObj( name :String ):DisplayObject
		{
			var cls:Class = getClass( name );
			if( null == cls )
				return null;
			return (new cls()) as DisplayObject;
		}
		
		/**
		 * 获取bitmap实例 
		 * @param name
		 * @return 
		 * 
		 */
		public function getBitmap( name:String ):Bitmap
		{
			var cls:Class = getClass( name );
			if( null == cls )
				return null;
			var bmd:BitmapData = new cls(0,0);
			return new Bitmap(bmd);
		}
		
		/**
		 * 获取bitmapdata 
		 * @param name
		 * @return 
		 * 
		 */
		public function getBitmapData( name:String ):BitmapData
		{
			var cls:Class = getClass( name );
			if( null == cls )
				return null;
			return new cls(0,0) as BitmapData;
		}
		
		/**
		 * 获取数据库 
		 * @return 
		 * 
		 */
		public function getDB():Object
		{
			return this.database;
		}
		
		/**
		 * 获取xml 
		 * @param name
		 * @return 
		 */
		public function getXML( name:String ):XML
		{
			return this.xmlMap[ name ];
		}
		
		/**
		 * 存储xml 
		 * @param name
		 * @param xml
		 * 
		 */
		public function addXML( name:String, xml:XML ):void
		{
			if( this.xmlMap[ name ] )
				return;
			
			this.xmlMap[ name ] = xml;
		}
		
		public function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void
		{
			dispatcher.addEventListener( type,listener,useCapture,priority,useWeakReference );
		}
		
		public function dispatchEvent( evt:Event ):Boolean
		{
			return dispatcher.dispatchEvent( evt );
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return dispatcher.hasEventListener( type );
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			dispatcher.removeEventListener( type,listener,useCapture );
		}
		
		public function willTrigger(type:String):Boolean
		{
			return dispatcher.willTrigger( type );
		}
	}
}