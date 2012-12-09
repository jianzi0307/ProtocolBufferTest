package com.jfw.engine.utils.operation.effect
{
	import com.jfw.engine.utils.Geom;
	import com.jfw.engine.utils.operation.TweenOper;
	
	import flash.geom.Point;
	
	/**
	 * 旋转
	 * 
	 * 
	 */
	public class RotateEffect extends TweenOper
	{
		/**
		 * 中心点（父节点坐标系）
		 */
		public var center:Point;
		
		/**
		 * 目标角度
		 */
		public var targetRotation:Number;
		
		/**
		 * 
		 * @param target	目标
		 * @param center	中心点（父坐标系），默认取图形的中心
		 * @param rotation	缩放比
		 * @param duration
		 * @param params
		 * @param invert
		 * 
		 */
		public function RotateEffect(target:*=null, center:Point = null, targetRotation:Number = 0, duration:int=100, params:Object=null, invert:Boolean=false,clearTarget:* = 0)
		{
			this.center = center;
			this.targetRotation = targetRotation;
			
			super(target, duration, params, invert, clearTarget);
		}
		
		/** @inheritDoc*/
		public override function execute() : void
		{
			if (!params)
				params = new Object();
			
			if (!center)
				center = Geom.center(target);
			
//			params.scaleX = params.scaleY = this.scale;
//			params.x = target.x + (target.x - center.x) * (scale - target.scaleX) / target.scaleX;
//			params.y = target.y + (target.y - center.y) * (scale - target.scaleY) / target.scaleY;
			super.execute();
		}
	}
}