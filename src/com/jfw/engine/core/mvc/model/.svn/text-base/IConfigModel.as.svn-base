package com.jfw.engine.core.mvc.model
{
	import com.jfw.engine.core.data.IStruct;
	import com.jfw.engine.core.data.LoadStruct;

	/** 配置文件接口 */
	public interface IConfigModel
	{
		/** 获取配置文件 */
		function get configData( ):IStruct;
		
		/** 根据id获取配置,p是否预加载 */
		function getVal( id:String,p:Boolean = false ):LoadStruct;
	}
}