package com.jfw.engine.utils.operation.effect
{
	import com.jfw.engine.utils.operation.RepeatOper;

	/**
	 * 重复效果
	 * 
	 */
	public class RepeatEffect extends RepeatOper implements IEffect
	{
		private var _target:*;
		
		/** @inheritDoc*/
		public function get target():*
		{
			return _target;
		}
		
		public function set target(v:*):void
		{
			_target = v;
			
			for each (var oper:* in children)
			{
				if (oper is IEffect)
					(oper as IEffect).target = v;
			}
		}
		
		public function RepeatEffect(children:Array=null, loop:int=-1)
		{
			super(children, loop);
		}
	}
}