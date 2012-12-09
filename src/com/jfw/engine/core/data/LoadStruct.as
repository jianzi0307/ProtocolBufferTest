package com.jfw.engine.core.data
{
	/** 下载资源 */
	public class LoadStruct extends BaseStruct
	{
		/** Tells this class to use a <code>Loader</code> object to load the item.*/
		public static const TYPE_BINARY : String = "binary";
		/** Tells this class to use a <code>Loader</code> object to load the item.*/
		public static const TYPE_IMAGE : String = "image";
		/** Tells this class to use a <code>Loader</code> object to load the item.*/
		public static const TYPE_MOVIECLIP : String = "movieclip";
		/** Tells this class to use a <code>Sound</code> object to load the item.*/
		public static const TYPE_SOUND : String = "sound";
		/** Tells this class to use a <code>URLRequest</code> object to load the item.*/
		public static const TYPE_TEXT : String = "text";
		/** Tells this class to use a <code>XML</code> object to load the item.*/
		public static const TYPE_XML : String = "xml";
		/** Tells this class to use a <code>NetStream</code> object to load the item.*/
		public static const TYPE_VIDEO : String = "video";
		
		/** 下载资源ID */
		public var id:String;
		
		/** 下载资源类型 */
		public var type:String;
		
		/** 下载资源路径 */
		public var path:String;
		
		/** 下载资源名称 */
		public var name:String;
		
		/** 下载资源描述 */
		public var desc:String;
		
		public function LoadStruct(obj:Object=null)
		{
			super(obj);
		}
		
		override public function clone():Object
		{
			var to:Object = super.clone();
			
			to.id = this.id;
			to.type = this.type;
			to.path = this.path;
			to.name = this.name;
			to.desc = this.desc;
			
			return to;
		}
		
		override protected function parse(obj:Object):void
		{
			super.parse( obj );
			
			this.id = obj.id;
			this.type = obj.type;
			this.path = obj.path;
			this.name = obj.name;
			this.desc = obj.desc;
		}
	}
}