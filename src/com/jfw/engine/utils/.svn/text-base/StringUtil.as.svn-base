package com.jfw.engine.utils
{
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	
	public class StringUtil
	{
		/**
		 * 忽略大小字母比较字符是否相等; 
		 * @param char1
		 * @param char2
		 * @return 
		 * 
		 */		
		public static function equalsIgnoreCase(char1:String,char2:String):Boolean
		{  
			return char1.toLowerCase() == char2.toLowerCase();  
		}  
		
		/**
		 * 比较字符是否相等;  
		 * @param char1
		 * @param char2
		 * @return 
		 * 
		 */		
		public static function equals(char1:String,char2:String):Boolean
		{  
			return char1 == char2;  
		}  
		
		/**
		 * 是否为Email地址;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isEmail(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char);  
			var pattern:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * 是否是数值字符串;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isNumber(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			return !isNaN(Number(char));  
		}  
		
		/**
		 * 是否为Double型数据;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isDouble(char:String):Boolean
		{  
			char = trim(char);  
			var pattern:RegExp = /^[-\+]?\d+(\.\d+)?$/;   
			var result:Object = pattern.exec(char);  
			if(result == null)
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * Integer;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isInteger(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char);  
			var pattern:RegExp = /^[-\+]?\d+$/;   
			var result:Object = pattern.exec(char);  
			if(result == null)
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * English;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isEnglish(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char);  
			var pattern:RegExp = /^[A-Za-z]+$/;   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * 中文;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isChinese(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char);  
			var pattern:RegExp = /^[\u0391-\uFFE5]+$/;   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * 双字节  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isDoubleChar(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char);  
			var pattern:RegExp = /^[^\x00-\xff]+$/;   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * 含有中文字符
		 * @param char
		 * @return 
		 * 
		 */		  
		public static function hasChineseChar(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char);  
			var pattern:RegExp = /[^\x00-\xff]/;   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * 注册字符;  
		 * @param char
		 * @param len
		 * @return 
		 * 
		 */		
		public static function hasAccountChar(char:String,len:uint=15):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			if(len < 10)
			{  
				len = 15;  
			}  
			char = trim(char);  
			var pattern:RegExp = new RegExp("^[a-zA-Z0-9][a-zA-Z0-9_-]{0,"+len+"}$", "");   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * URL地址;  
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isURL(char:String):Boolean
		{  
			if(char == null)
			{  
				return false;  
			}  
			char = trim(char).toLowerCase();  
			var pattern:RegExp = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;   
			var result:Object = pattern.exec(char);  
			if(result == null) 
			{  
				return false;  
			}  
			return true;  
		}  
		
		/**
		 * 是否为空白; 
		 * @param char
		 * @return 
		 * 
		 */		
		public static function isWhitespace(char:String):Boolean
		{  
			switch (char)
			{  
				case " ":  
				case "\t":  
				case "\r":  
				case "\n":  
				case "\f":  
					return true;      
				default:  
					return false;  
			}  
		}  
		
		/**
		 * 去左右空格
		 * @param char
		 * @return 
		 * 
		 */		
		public static function trim(char:String):String
		{  
			if(char == null)
			{  
				return null;  
			}  
			return rtrim(ltrim(char));  
		}  
		
		/**
		 * 去左空格
		 * @param char
		 * @return 
		 * 
		 */		
		public static function ltrim(char:String):String
		{  
			if(char == null){  
				return null;  
			}  
			var pattern:RegExp = /^\s*/;   
			return char.replace(pattern,"");  
		}  
		
		/**
		 * 去右空格
		 * @param char
		 * @return 
		 * 
		 */		
		public static function rtrim(char:String):String
		{  
			if(char == null){  
				return null;  
			}  
			var pattern:RegExp = /\s*$/;   
			return char.replace(pattern,"");  
		}  
		
		/**
		 * 是否为前缀字符串
		 * @param char
		 * @param prefix
		 * @return 
		 * 
		 */		
		public static function beginsWith(char:String, prefix:String):Boolean
		{            
			return (prefix == char.substring(0, prefix.length));  
		}  
		
		/**
		 * 是否为后缀字符串
		 * @param char
		 * @param suffix
		 * @return 
		 * 
		 */		
		public static function endsWith(char:String, suffix:String):Boolean
		{  
			return (suffix == char.substring(char.length - suffix.length));  
		}  
		
		/**
		 * 去除指定字符串
		 * @param char
		 * @param remove
		 * @return 
		 * 
		 */		
		public static function remove(char:String,remove:String):String
		{  
			return replace(char,remove,"");  
		}  
		
		/**
		 * 字符串替换
		 * @param char
		 * @param replace
		 * @param replaceWith
		 * @return 
		 * 
		 */		
		public static function replace(char:String, replace:String, replaceWith:String):String
		{           
			return char.split(replace).join(replaceWith);  
		}  
		
		/**
		 * utf16转utf8编码
		 * @param char
		 * @return 
		 * 
		 */		
		public static function utf16to8(char:String):String
		{  
			var out:Array = new Array();  
			var len:uint = char.length;  
			for(var i:uint=0;i<len;i++){  
				var c:int = char.charCodeAt(i);  
				if(c >= 0x0001 && c <= 0x007F)
				{  
					out[i] = char.charAt(i);  
				} else if (c > 0x07FF) 
				{  
					out[i] = String.fromCharCode(0xE0 | ((c >> 12) & 0x0F),  
						0x80 | ((c >>  6) & 0x3F),  
						0x80 | ((c >>  0) & 0x3F));  
				} else 
				{  
					out[i] = String.fromCharCode(0xC0 | ((c >>  6) & 0x1F),  
						0x80 | ((c >>  0) & 0x3F));  
				}  
			}  
			return out.join('');  
		}  
		
		/**
		 * utf8转utf16编码
		 * @param char
		 * @return 
		 * 
		 */		
		public static function utf8to16(char:String):String
		{  
			var out:Array = new Array();  
			var len:uint = char.length;  
			var i:uint = 0;  
			var char2:int,char3:int;  
			while(i<len)
			{  
				var c:int = char.charCodeAt(i++);  
				switch(c >> 4)
				{  
					case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:  
						// 0xxxxxxx  
						out[out.length] = char.charAt(i-1);  
						break;  
					case 12: case 13:  
						// 110x xxxx   10xx xxxx  
						char2 = char.charCodeAt(i++);  
						out[out.length] = String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));  
						break;  
					case 14:  
						// 1110 xxxx  10xx xxxx  10xx xxxx  
						char2 = char.charCodeAt(i++);  
						char3 = char.charCodeAt(i++);  
						out[out.length] = String.fromCharCode(((c & 0x0F) << 12) |  
							((char2 & 0x3F) << 6) | ((char3 & 0x3F) << 0));  
						break;  
				}  
			}  
			return out.join('');  
		}  
		
		/**
		 * 转换字符编码
		 * @param char
		 * @param charset
		 * @return 
		 * 
		 */		  
		public static function encodeCharset(char:String,charset:String):String
		{  
			var bytes:ByteArray = new ByteArray();  
			bytes.writeUTFBytes(char);  
			bytes.position = 0;  
			return bytes.readMultiByte(bytes.length,charset);  
		}  
		
		/**
		 * 添加新字符到指定位置
		 * @param char
		 * @param value
		 * @param position
		 * @return 
		 * 
		 */		
		public static function addAt(char:String, value:String, position:int):String 
		{  
			if (position > char.length) 
			{  
				position = char.length;  
			}  
			var firstPart:String = char.substring(0, position);  
			var secondPart:String = char.substring(position, char.length);  
			return (firstPart + value + secondPart);  
		}  
		
		/**
		 * 替换指定位置字符
		 * @param char
		 * @param value
		 * @param beginIndex
		 * @param endIndex
		 * @return 
		 * 
		 */		
		public static function replaceAt(char:String, value:String, beginIndex:int, endIndex:int):String 
		{  
			beginIndex = Math.max(beginIndex, 0);             
			endIndex = Math.min(endIndex, char.length);  
			var firstPart:String = char.substr(0, beginIndex);  
			var secondPart:String = char.substr(endIndex, char.length);  
			return (firstPart + value + secondPart);  
		}  
		
		/**
		 * 删除指定位置字符
		 * @param char
		 * @param beginIndex
		 * @param endIndex
		 * @return 
		 * 
		 */		
		public static function removeAt(char:String, beginIndex:int, endIndex:int):String 
		{  
			return StringUtil.replaceAt(char, "", beginIndex, endIndex);  
		}  
		
		/**
		 * 修复双换行符
		 * @param char
		 * @return 
		 * 
		 */		
		public static function fixNewlines(char:String):String 
		{  
			return char.replace(/\r\n/gm, "\n");  
		}  
		
		
		public static function transformHtmlText(str:String,textformat:TextFormat,link:String=""):String
		{
			if(link != "")
			{
				str = "<a href=\"event:" + link + "\">" + str + "</a>";
			}
			if(textformat.bold)
			{
				//str = "<b>" + str + "</b>";
			}
			return "<font color=\"" + transColor(uint(textformat.color)) + "\" size=\"" + textformat.size + "\" face=\"" + textformat.font + "\">" +str + "</font>" ;
		}
		
		
		public static function replaceHtmlText(htmlStr:String,replaceStr:String,newText:String,textformat:TextFormat,link:String=""):String
		{
			var fontFirstIndex:int = htmlStr.indexOf("<");
			var fontEndIndex:int = htmlStr.indexOf(">");
			
			var fontStr:String = htmlStr.substring(fontFirstIndex,fontEndIndex +1);
			
			
			var index:int = htmlStr.indexOf(replaceStr);
			if(index >= 0)
			{
				newText = "</font>" + transformHtmlText(newText,textformat,link) + fontStr;
				htmlStr = htmlStr.replace(replaceStr,newText);
				
				if(htmlStr.indexOf(replaceStr) >= 0)
				{
					htmlStr = replaceHtmlText(htmlStr,replaceStr,newText,textformat,link);
				}
			}
			return htmlStr;
		}
		
		public static function transColor(color:uint):String
		{
			var c:String = color.toString(16);
			c = "#" + c;
			
			return c;
		}
		
		private static const TEMPLATE_VALUE_NOT_FOUND:String = "#NOT FOUND#";
		
		/**
		 * 字符串格式化，有三种不同的用法<br/>
		 * <code>
		 * e1. format("{0} + {1} = {2}", 1, 2, 3); 得到 "1 + 2 = 3"<br/>
		 * e2. format("{0} + {1} = {2}", [2, 3, 5]); 得到 "2 + 3 = 5"<br/>
		 * e3. format("用户名：{username}, 注册日期：{created}", {username: "张三", created: "2010/9/12"}); 得到 "用户名：张三, 注册日期：2010/9/12"
		 * </code>
		 * @author KK
		 * @param template 模板
		 * @param params 要替换的变量
		 * @return 
		 * 
		 */
		public static function format(template:String, ...params):String
		{
			
			var templateData:Object = null;
			
			
			
			var numArgs:int = params.length;
			if (numArgs > 0)
			{
				var arg1:* = params[0];
				switch (arg1.constructor)
				{
					case String:
					case int:
					case uint:
					case Number:
					case Boolean:
						templateData = params;
						break;
					default: // Date Object Array
						templateData = arg1;
						var templateDataIsDate:Boolean = templateData is Date;
						break;
				}
				
			}
			
			var result:String = template;
			if (templateData != null)
			{
				const TEMPLATE_REPLACEMENT:int = 0;
				const VARIABLE:int = 1;
				var match:Array;
				while (match = result.match( /\{([a-zA-Z0-9]+)\}/ ))
				{
					var templateReplacement:String = match[TEMPLATE_REPLACEMENT];
					var varName:String = match[VARIABLE];
					
					
					if(templateData[varName] != null)
					{
						var varValue:* = templateData[varName];
						if (templateDataIsDate)
						{
							// 日期特殊处理
							if (varName == "month")
							{
								varValue++;
							}
							else if (varName == "minutes")
							{
								if (varValue < 10)
								{
									varValue = "0" + varValue;
								}
							}
						}
						result = result.replace( templateReplacement, varValue);
					}
					else
					{
						result = result.replace( templateReplacement, TEMPLATE_VALUE_NOT_FOUND );
					}
				}
			}
			return result;
		}
	}  
} 