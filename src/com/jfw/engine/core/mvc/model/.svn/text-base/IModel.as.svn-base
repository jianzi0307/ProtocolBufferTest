package com.jfw.engine.core.mvc.model
{
	import com.jfw.engine.core.base.ISender;
	import com.jfw.engine.core.base.ISign;
	import com.jfw.engine.core.data.IStruct;

	/** model接口 */
	public interface IModel extends ISign, IModelData,ISender
	{
		/** 获取model名称 */
		function getModelName():String;
		
		/** 当注册model时调用 */
		function onRegister():void;
		
		/** 当删除model时调用 */
		function onRemove():void;
	}
}