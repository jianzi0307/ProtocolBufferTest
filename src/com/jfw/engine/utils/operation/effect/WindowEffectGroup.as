package com.jfw.engine.utils.operation.effect
{
	import com.jfw.engine.core.base.IDestory;
	import com.jfw.engine.utils.operation.OperationEvent;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	/**
	 * 窗口效果管理类 
	 * 
	 */
	public class WindowEffectGroup extends EventDispatcher
	{
		public var createEffect:IEffect;
		public var closeEffect:IEffect;
		public var showEffect:IEffect;
		public var hideEffect:IEffect;
		
		private var target:DisplayObject;
		public function WindowEffectGroup(target:DisplayObject,createEffect:IEffect = null,closeEffect:IEffect = null,showEffect:IEffect = null,hideEffect:IEffect = null)
		{
			this.target = target;
			
			this.createEffect = createEffect;
			this.closeEffect = closeEffect;
			this.showEffect = showEffect;
			this.hideEffect = hideEffect;
		}
		
		/**
		 * 创建 
		 * 
		 */
		public function create():void
		{
			if (createEffect)
			{
				createEffect.target = target;
				createEffect.execute();
			}
		}
		
		/**
		 * 显示 
		 * 
		 */
		public function show():void
		{
			target.visible = true;
			if (showEffect)
			{
				showEffect.target = target;
				showEffect.execute();
			}
		}
		
		/**
		 * 关闭 
		 * 
		 */
		public function close():void
		{
			if (createEffect)
			{
				createEffect.target = target;
				createEffect.addEventListener(OperationEvent.OPERATION_COMPLETE,closeHandler);
				createEffect.execute();
			}
			else
			{
				closeHandler(null);
			}
		}
		
		private function closeHandler(event:OperationEvent):void
		{
			if (event)
				(event.currentTarget as EventDispatcher).removeEventListener(OperationEvent.OPERATION_COMPLETE,closeHandler);
			
			if (target is IDestory)
				(target as IDestory).destory();
			else
				target.parent.removeChild(target);
		}
		
		/**
		 * 隐藏
		 * 
		 */
		public function hide():void
		{
			if (hideEffect)
			{
				hideEffect.target = target;
				hideEffect.addEventListener(OperationEvent.OPERATION_COMPLETE,hideHandler);
				hideEffect.execute();
			}
			else
			{
				target.visible = false;
			}
		}
		
		private function hideHandler(event:OperationEvent):void
		{
			if (event)
				(event.currentTarget as EventDispatcher).removeEventListener(OperationEvent.OPERATION_COMPLETE,hideHandler);
			
			target.visible = false;
		}
	}
}