package com.jfw.engine.animation
{
	public interface IAnimatable
	{
		/** 
		 * Advance the time by a number of seconds. 
		 * @param time in seconds. 逻辑要写在super上边
		 */
		function advanceTime(time:Number):void;
	}
}