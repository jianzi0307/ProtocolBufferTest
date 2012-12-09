package com.jfw.engine.core.mvc.view
{
	import flash.display.DisplayObjectContainer;

	public interface IPanel extends IView
	{
		/** 注册面板中的button */
		function regButtons( container:DisplayObjectContainer ):void
		
		/** 注销面板中的button */
		function unregButtons( container:DisplayObjectContainer ):void
		
		/** 缓动方法 
		 * @param duration	持续时间
		 * @param params	缓动参数
		 * @param delay		延迟时间
		 * @param invert	是否倒放
		 */
		function tweenTo(duration:int,params:Object ):void;
		
		/** 重写宽高 */
		function get width():Number;
		function get height():Number;
	}
}