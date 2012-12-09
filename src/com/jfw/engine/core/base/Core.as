package com.jfw.engine.core.base
{
	import com.jfw.engine.core.mvc.control.ICmd;
	import com.jfw.engine.core.mvc.model.IAssetModel;
	import com.jfw.engine.core.mvc.model.IConfigModel;
	import com.jfw.engine.core.mvc.model.IModel;
	import com.jfw.engine.utils.logger.Logger;

	public class Core implements IObServer
	{
		protected static const SINGLETON_MSG:String = '';
		
		/** 核心类实例 */
		protected static var _instance:Core
		
		/** 数据模型字典 */
		protected var modelMap:Object = { };
		
		/** 命令字典 */
		protected var cmdMap:Object = { };
		
		/** 被观察者单例 */
		protected var obs:Observable;
		
		/** 静态资源库引用 */
		protected var assetsLibModel:IAssetModel = null;
		
		/** 配置文件 */
		protected var configLibModel:IConfigModel = null;
		
		public function Core()
		{
			if ( null != _instance ) 
				throw Error( SINGLETON_MSG );
			_instance = this;
			
			obs = Observable.getInstance();
		}
		
		public static function get instance():Core
		{
			if ( null == _instance )
				_instance = new Core();
			return _instance as Core;
		}
		
		/** 获取配置文件 */
		public function get configModel():IConfigModel
		{
			if( this.configLibModel )
				return this.configLibModel;
			else
			{
				for each( var model:* in modelMap )
				{
					if( model is IConfigModel )
					{
						this.configLibModel = model as IConfigModel;
						return model;
					}
				}
			}
			return null;
		}
		
		/** 获取静态资源model */
		public function get assetsModel():IAssetModel
		{
			if( this.assetsLibModel )
				return this.assetsLibModel;
			else
			{
				for each( var model:* in modelMap )
				{
					if( model is IAssetModel )
					{
						this.assetsLibModel = model as IAssetModel;
						return model;
					}
				}
			}
			return null;
		}
		
		/** 添加model */
		public function regModel(model:IModel):void
		{
			modelMap[ model.getModelName() ] = model;
			model.onRegister();
			
			Logger.info( model.getModelName() , "<=== Reg Model");
		}
		
		/** 删除model */
		public function delModel( modelName:String ):IModel
		{
			var model:IModel = modelMap[ modelName ] as IModel;
			if( model )
			{
				modelMap[ modelName ] = null;
				model.onRemove();
			}
			return model;
		}
		
		/** 获取model */
		public function retModel( modelName:String ):IModel
		{
			return modelMap[ modelName ];
		}
		
		/** 检查model是否已经注册 */
		public function hasModel( modelName:String ):Boolean
		{
			return modelMap[ modelName ] != null;
		}
		
		/** 执行命令 */
		public function execCmd( evt:String,param:Object = null ):void
		{
			var cmdRef:Class = cmdMap[ evt ];
			if ( null == cmdRef ) 
				return;
			
			var cmd : ICmd = new cmdRef();
			cmd.execute( evt, param );
			//Logger.info( evt,cmd,"<=== Exec Cmd");
		}
		
		/** 注册命令 */
		public function regCmd( evt:String, cmdRef:Class ):void 
		{
			if( null == cmdMap[evt] )
				obs.regObServer( evt,this );
			cmdMap[ evt ] = cmdRef;
			//Logger.info( cmdRef,evt, "<=== Reg Cmd");
		}
		
		/**
		 * 批量注册命令 
		 * @param cmdAry
		 * @param cmdRef
		 * 
		 */
		public function regCmds( cmdAry:Array, cmdRef:Class ):void
		{
			for( var i:int = 0,len:int = cmdAry.length; i < len;i++ )
				regCmd( cmdAry[i],cmdRef );
		}
		
		/** 删除命令 */
		public function delCmd( evt:String ):void 
		{
			if( this.hasCmd( evt ) )
			{
				obs.unregObserver( evt,this );
				cmdMap[ evt ] = null;
			}
		}

		/** 检查是否注册命令 */
		public function hasCmd( evt:String ) : Boolean
		{
			return ( null != cmdMap[ evt ] );
		}
		
		public function update( evt:String, param:Object ):void
		{
			execCmd( evt,param );
		}
	}
}