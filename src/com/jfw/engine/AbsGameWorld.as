package com.jfw.engine
{
	import com.jfw.engine.core.base.Core;
	import com.jfw.engine.core.data.IStruct;
	import com.jfw.engine.core.mvc.view.BView;
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	/** 游戏世界抽象类 */
	public class AbsGameWorld extends Core
	{
		protected var gameStage:Stage = null;
		
		public function AbsGameWorld( )
		{
			super( );
		}
		
		/** 
		 * 模版方法 
		 * 使用final保证不被子类重写
		 */
		public final function initWorld( stage:Stage = null ):void
		{
			this.gameStage = stage;
			
			this.gameStage.scaleMode = StageScaleMode.NO_SCALE;
			this.gameStage.align = StageAlign.TOP_LEFT;
			
			
			
			this.initCmds();
			this.initModels();
			this.initViews();
			
			this.startGame();
		}
		
		/** 抽象方法，子类必须重写，初始化命令 */
		protected function initCmds():void
		{
			throw new Error("Abstract method: initCmds!");
		}
		
		/** 抽象方法，子类必须重写，初始化models */
		protected function initModels():void
		{
			throw new Error("Abstract method: initModels!");
		} 
		
		
		/** 抽象方法，子类必须重写，初始化视图 */
		protected function initViews():void
		{
			throw new Error("Abstract method: initViews!");
		}
		
		/** 抽象方法，子类必须重写，启动游戏 */
		protected function startGame():void
		{
			throw new Error("Abstract method: startGame!");
		}
	}
}