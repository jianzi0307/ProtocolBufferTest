package com.jfw.engine.core.mvc.view
{
	import com.jfw.engine.core.base.IDestory;
	import com.jfw.engine.core.base.ISign;

	public interface IView extends ISign, IDestory, IViewData, IToolTipClient
	{
		/**
		 * 是否暂停
		 * @param v
		 * 
		 */
		function set paused(v:Boolean):void
		function get paused():Boolean;
		
		/**
		 * 是否激活时基
		 * @param v
		 * 
		 */
		function set enabledTick(v:Boolean):void
		function get enabledTick():Boolean;
		
		/**
		 * 更新显示并发事件 
		 */
		function vaildDisplayList(noEvent:Boolean = false):void
	}
}