package com.jfw.engine.core.mvc.view
{
	import com.jfw.engine.core.data.IStruct;
	import com.jfw.engine.utils.IQueueItem;
	
	/** 窗口接口 */
	public interface IWindow extends IPanel, IQueueItem
	{
		/** 获取父窗体的sign */
		function get pSign():String;
		
		/** 设置父窗体 */
		function set pSign( sign:String ):void;
		
		/** 获取所有子窗体的sign */
		function getSons():Vector.<String>;
		
		/** 添加子窗体 */
		function addSon( sign:String ):void;
		
		/** 删除子窗体 */
		function removeSon( sign:String ):void;
		
		function close():void;
	}
}