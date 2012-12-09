package com.jfw.engine.animation
{
	import flash.events.Event;
	
	public class JugglerEvent extends Event
	{
		
		static public const REMOVE_FROM_JUGGLER:String = 'JugglerEvent_REMOVE_FROM_JUGGLER';
		
		public function JugglerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone() : Event
		{
			var evt:JugglerEvent = new JugglerEvent(type,bubbles,cancelable);
			return evt;
		}
	}
}