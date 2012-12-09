package com.jfw.engine.utils.data
{
	import flash.utils.ByteArray;
	
	/**
	 * XML辅助类 
	 */
	public final class XMLUtil
	{

		/**
		 * XML转Object 
		 * @param xml
		 * @return 
		 * 
		 */
		static public function xml2Obj( xml:XML ):Object
		{
			var obj:Object = new Object();
			var ls:XMLList = xml.children();
			
			obj = attributesToObject( xml,obj );
//			var atts:XMLList = xml.attributes();
//			
//			for each (var att:XML  in atts)
//			{
//				obj[att.name().toString()]= att.toString();
//			}
			
			if(ls.length() > 0)
			{
				for each(var node:XML in ls) 
				{
					var objsub:Object = xml2Obj(node);
					var tmp:Object = obj[node.name()];
					if( tmp == null )
					{
						obj[node.name()]=objsub;
					}
					else if(tmp is Array)
					{
						(tmp as Array).push(objsub);
					}
					else
					{
						obj[node.name()]=new Array(tmp,objsub);
					}
				}
			}
			return obj;
		}
		
		/**
		 * XML转JSON
		 *  
		 * @param xml
		 * @return 
		 * 
		 */
		static public function xml2Json( xml:XML ):String
		{
			return  JSON.stringify( xml2Obj( xml ) );
		}
		
		/**
		 * 创建XML 
		 * @param source
		 * @return 
		 * 
		 */
		public static function createFrom(source:*):XML
		{
			if (source is Class)
				source = new source();
			
			if (source is ByteArray)
			{
				try
				{
					(source as ByteArray).uncompress();
				}
				catch (e:Error)
				{}
				source = source.toString();
			}
			
			if (source is String)
			{
				while (source.substr(0,1) != "<") //去掉额外的文件首字符
					source = source.substr(1);
				return new XML(source);
			}
			else
				trace("不支持的类型");
			return null;
		}
		
		/**
		 * 将@value转换为Object 
		 * @param xml
		 * @param result
		 * @return 
		 * 
		 */
		public static function attributesToObject(xml:XML,result:Object = null):Object
		{
			if (!result)
				result = new Object();
			
			for each (var xml:XML in xml.attributes())
				result[xml.name().toString()] = xml.toString();
			
			return result;
		}
		
		/**
		 * 将Object转换为@value 
		 * @param obj
		 * @param result
		 * @return 
		 * 
		 */
		public static function objectToAttributes(obj:Object,result:XML = null):XML
		{
			if (!result)
				result = <xml/>;
			
			for (var key:String in obj)
				result["@"+key] = obj[key];
			
			return result;
		}
		
		/**
		 * 将子节点转换为@value 
		 * @param obj
		 * @param result
		 * @return 
		 * 
		 */
		public static function childrenToAttributes(obj:XML,result:XML = null):XML
		{
			if (!result)
				result = <xml/>;
			
			for each (var xml:XML in obj.children())
				result["@" + xml.name().toString()] = xml.toString();
			
			return result;
		}
		
		/**
		 * 将@value转换为子节点 
		 * @param obj
		 * @param result
		 * @return 
		 * 
		 */
		public static function attributesToChildren(obj:XML,result:XML = null):XML
		{
			if (!result)
				result = <xml/>;
			
			for each (var xml:XML in obj.attributes())
			{
				var child:XML = <xml/>
				child.setName(xml.name());
				child.appendChild(xml.toString());
				result.appendChild(child);
			}
			return result;
		}
		
		/**
		 * 格式化XML格式 
		 * @param str
		 * @param isCompress
		 * @return 
		 * 
		 */
		public static function format(str:String):String
		{
			try
			{
				var ignoreComments:Boolean = XML.ignoreComments;
				XML.ignoreComments = false;
				
				var xml:XML = new XML(str);
				str = xml.toXMLString()
				
				XML.ignoreComments = ignoreComments;
			} 
			catch(e:Error){};
			
			return str;
		}
		
		/**
		 * 删除XML中的注释，换行和缩进
		 * @param str
		 * @return 
		 * 
		 */
		public static function compress(str:String):String
		{
			return str.replace(/^\s+|\r|\n|<!--.*?-->/gsm,"");
		}
	}
}