package com.jfw.engine.motion
{
	import flash.events.Event;
	
	public class AnimationEvent extends Event
	{
		public static const UPDATE_TEXTURES:String='update_textures';
		public static const WALK_COMPLETE:String='walk_complete';
		
		public function AnimationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}