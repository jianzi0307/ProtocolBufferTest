package com.jfw.engine.utils.manager
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;

	public class PopUpManager
	{

		private static var impl:PopUpManagerImpl;

		private static var popupArray:Array	= [];

		private static var isAllowMulti:Boolean;
		
		private static var popupWaitArray:Array	= [];

		private static function getImpl():PopUpManagerImpl
		{
			return impl ||= new PopUpManagerImpl();
		}
		
		public static function getPopups():Array
		{
			return popupArray;
		}
		
		public static function getWaitPopups():Array
		{
			return popupWaitArray;
		}

		/**
		 * 再使用此manager以前，先给所有的弹出窗口设定一个容器 
		 * @param parent
		 * @param isAllowMul
		 * @param modalCol     窗口背后遮罩的颜色
		 * @param modalAlpha   窗口背后遮罩的透明度
		 * 
		 */
		public static function init(parent:DisplayObjectContainer,isAllowMul:Boolean=true,modalCol:uint=0x0,modalAlpha:Number=0):void
		{
			var imple:PopUpManagerImpl = getImpl();
			imple.parent = parent;//设计目的：MainMediator
			
			isAllowMulti = isAllowMul;
			
			
			if(!isAllowMulti)
			{
				imple.addEventListener(Event.REMOVED,onWindowRemove);
			}
			imple.setModal(modalCol,modalAlpha);
		}

		/**
		 * 弹出一个 factoryClass 的实例
		 * @param factoryClass 要实例化的类
		 * @param hasModal 弹出是否是模态的
		 * @return 弹出的实例
		 *
		 */
		public static function createPopUp(factoryClass:Class, hasModal:Boolean=true):DisplayObject
		{
			
			var obj:DisplayObject=new factoryClass();
			addPopUp(obj, hasModal);
			
			return obj;
		}

		/**
		 * 删除一个由PopUpManager.createPopUp创建的实例
		 * @param obj
		 *
		 */
		public static function removePopUp(obj:DisplayObject,hasAction:Boolean=true):void
		{
			if (popupArray != null && popupArray.length > 0)
			{
				var index:int = popupArray.indexOf(obj);
				if (index >= 0)
				{
					impl.removePopUp(obj,hasAction);
					popupArray[index] = null;
					delete popupArray[index];
					//popupArray.splice(index, 1);
				}
				else if(popupWaitArray != null)
				{
					index = popupWaitArray.indexOf(obj);
					if (index >= 0)
					{
						popupWaitArray[index] = null;
						delete popupWaitArray[index];
						//popupWaitArray.splice(index, 1);
					}
				}
			}
		}
		
		
		/**
		 * 是否包含对象
		 *  
		 * @param obj
		 * @return 
		 * 
		 */
		public static function contains(obj:DisplayObject):Boolean
		{
			if(impl)
				return impl.parent.contains(obj);
			else
				return false;
		}

		/**
		 * 删除所有窗体 
		 * 
		 */
		public static function removeAllPopUp():void
		{
			if (popupArray != null)
			{
				for each (var obj:DisplayObject in popupArray )
				{
					removePopUp(obj,false);
				}
				popupArray = [];
			}

		}


		/**
		 * 添加一个已有的实例到PopUpManager管理的列表中
		 * @param obj 添加的对象
		 * @param hasModal 弹出是否是模态的
		 *
		 */
		public static function addPopUp(obj:DisplayObject, hadModal:Boolean=true):void
		{
			//判断条件：如果现有的弹出窗口队列有窗口存在，并且不是多窗口显示模式的话
			if(popupArray != null && popupArray.length > 0 && !isAllowMulti)
			{
				//true：有窗口存在并且不是多窗口显示模式
				//添加进等待列表
				if (popupWaitArray == null)
				{
					popupWaitArray=[];
				}
				popupWaitArray.push(obj);
			}
			else
			{
				//false：没有弹出窗口 或是 多窗口模式
				//添加进控制器（将负责添加到显示列表）
				getImpl().addPopUp(obj, hadModal);
				obj.addEventListener(Event.ENTER_FRAME, initPopUpLater);//初始化完成后进行设置
				
				//添加进显示队列
				if (popupArray == null)
				{
					popupArray=[];
				}
				popupArray.push(obj);
				
			}
			
		}
		
		private static function onWindowRemove(e:Event):void
		{
			if(popupWaitArray != null && popupWaitArray.length > 0)
			{
				addPopUp(popupWaitArray.shift() as DisplayObject);
			}
		}

		/**
		 * 把一个不是模态弹出的实例移动到最前，不能移动模态弹出的实例
		 * @param obj 弹出的实例
		 *
		 */
		public static function bringToTop(obj:DisplayObject):void
		{
			focusPopUp(obj);
		}

		/**
		 * 让弹出的实例居中
		 * @param obj 弹出的实例
		 *
		 */
		public static function center(obj:DisplayObject):void
		{
			impl.center(obj);
		}

		//等弹出的实例一段时间做初始化工作，当这个过程完成的时候，修整它的focus和layout属性
		private static function initPopUpLater(event:Event):void
		{
			var obj:DisplayObject=event.target as DisplayObject;
			obj.removeEventListener(Event.ENTER_FRAME, initPopUpLater);
			//focusPopUp(obj);
			//如果这个弹出的实例没有被修整过layout属性的情况下，让他居中
			if (obj.x == 0 && obj.y == 0)
			{
				center(obj);
			}
		}

		//把焦点移动到弹出的实例上，这将会使不在最顶层的实例移动到顶层
		private static function focusPopUp(obj:DisplayObject):void
		{
			//var focusComponent:IFocusManagerComponent = obj as IFocusManagerComponent;
			impl.bringToTop(obj);
			//if(focusComponent != null)
			// {
			//    focusComponent.setFocus();
			// }
		}
	}
}


import com.greensock.TweenLite;
import com.greensock.easing.Back;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;
import flash.filters.BitmapFilterQuality;
import flash.filters.BlurFilter;
import flash.filters.DisplacementMapFilter;
import flash.utils.Dictionary;
import flash.utils.setInterval;



class PopUpManagerImpl extends EventDispatcher
{
	//最小的高度，用于计算modal因为是popup在stage上的
	private static var LOWEST:int;
	private static var instance:PopUpManagerImpl;

	public static function getInstance():PopUpManagerImpl
	{
		return instance||=new PopUpManagerImpl();
	}

	private var _parent:DisplayObjectContainer;
	private var modalObject:Sprite;
	private var modalWindowArray:Array=[];//模式弹出窗口列表
	private var windowArray:Array=[];


	public function PopUpManagerImpl():void
	{
		
	}
	
	/**
	 * 设置屏蔽层
	 */
	public function setModal(modalColor:uint,modalTransparency:Number):void
	{
		modalObject=new Sprite();
		modalObject.addEventListener(MouseEvent.MOUSE_DOWN, function():void
		{
		});
		modalObject.graphics.beginFill(modalColor, modalTransparency);
		modalObject.graphics.drawRect(-100, -100, 2000, 2000);
		//modalObject.graphics.drawRect(0, 0, this.parent.stage.stageWidth, this.parent.stage.stageHeight);
		modalObject.graphics.endFill();
	}
	
	public function get parent():DisplayObjectContainer
	{
		return _parent;
	}
	
	public function set parent(value:DisplayObjectContainer):void
	{
		_parent = value;
		_parent.stage.addEventListener(Event.RESIZE,onResize);
	}

	public function removePopUp(obj:DisplayObject,hasAction:Boolean=true):void
	{
		//移除当前的弹出窗口，从模式弹出窗口列表
		var indexInModalArray:int = modalWindowArray.indexOf(obj);
		if (indexInModalArray != -1)
		{
			modalWindowArray.splice(indexInModalArray, 1);
			
		}
		
		//移除当前的弹出窗口，从弹出窗口列表
		var indexArray:int = windowArray.indexOf(obj);
		if (indexArray != -1)
		{
			windowArray.splice(indexArray, 1);
			
		}
		
		//移除当前的弹出窗口，从显示列表
		if(parent.contains(obj))
		{
			if (hasAction)
			{
				//播放移除动画
				startHideAction(obj);
			}
			else
			{
				removePopUpComplete(obj);
			}
		}
		
		
	}
	
	private function removePopUpComplete(obj:DisplayObject):void
	{
		if (parent.contains(obj))
		{
			parent.removeChild(obj);
		}
		
		
		//移动屏蔽层
		if (parent.contains(modalObject))
		{

				if (modalCanBeRemoved())
				{
					parent.removeChild(modalObject);
				}
				else
				{
					/*var numChildren:int=parent.numChildren;
					if(numChildren > 1)
					{
						parent.setChildIndex(modalObject, numChildren - 2);
					}else
					{
						parent.removeChild(modalObject);
					}*/
					
					var index:int = parent.getChildIndex(DisplayObject(modalWindowArray[modalWindowArray.length - 1]));
					if(parent.getChildIndex(modalObject) > index)
					{
						parent.setChildIndex(modalObject, index);
					}
					
				}
		}
		dispatchEvent(new Event(Event.REMOVED));
	}


	private function modalCanBeRemoved():Boolean
	{
		return modalWindowArray.length == 0;
	}


	public function addPopUp(obj:DisplayObject, hasModal:Boolean=true):void
	{
		//将弹出窗口添加到对应的队列
		if (hasModal)
		{
			var modalIndex:int = parent.numChildren;
			//			if (parent.contains(modalObject))
			//			{
			//				parent.setChildIndex(modalObject, modalIndex - 2);
			//			}
			//			else
			//			{
			//parent.addChildAt(modalObject, modalIndex - 1);
			parent.addChild(modalObject);//将屏蔽层添加到显示列表
			//			}
			modalWindowArray.push(obj);
		}else
		{
			windowArray.push(obj);
		}
		
		//将弹出窗口添加到显示列表
		parent.addChild(obj);
		
		
		

		startShowAction(obj);
	}


	public function bringToTop(obj:DisplayObject):void
	{
		if (parent.contains(obj))
		{
			parent.setChildIndex(obj, parent.numChildren - 1);
		}
	}

	public function center(obj:DisplayObject):void
	{
		obj.x=(parent.stage.stageWidth - obj.width) * 0.5;
		obj.y=(parent.stage.stageHeight - obj.height) * 0.5;
	}
	private function onResize(e:Event):void
	{
		for each(var win:DisplayObject in modalWindowArray)
		{
			center(win);
		}
	}

	private const blurSize:int = 3;
	private var blur:BlurFilter = new BlurFilter(blurSize,blurSize,BitmapFilterQuality.HIGH);   
	private function startShowAction(obj:DisplayObject):void
	{
		obj.scaleX = 0.1;
		obj.scaleY = 0.1;
		blur.blurX = blur.blurY = blurSize;
		obj.filters = [blur];  

		var end:Object = new Object();
		end.scaleX = 1;
		end.scaleY = 1;
		end.onUpdate = center;
		end.onUpdateParams = [obj];
		end.onComplete = showActionComplete;
		end.onCompleteParams = [obj];
		end.ease = Back.easeOut;
		TweenLite.to(obj, 0.3, end);
	}
	
	private function showActionUpdate(obj:DisplayObject):void
	{
		center(obj);
		blur.blurX -= blurSize/2;
		blur.blurY -= blurSize/2;
		obj.filters = [blur];  
	}
	
	private function showActionComplete(obj:DisplayObject):void
	{
		obj.filters = [];  
	}
	
	private function startHideAction(obj:DisplayObject):void
	{
		obj.scaleX = 1;
		obj.scaleY = 1;
		
		blur.blurX = blur.blurY = 1;
		obj.filters = [blur];  
		
		var end:Object = new Object();
		end.scaleX = 0.1;
		end.scaleY = 0.1;
		end.onUpdate = hideActionUpdate;
		end.onUpdateParams = [obj];
		end.onComplete = hideActionComplete;
		end.onCompleteParams = [obj];
		end.ease = Back.easeIn;
		TweenLite.to(obj, 0.3, end);
	}
	
	private function hideActionUpdate(obj:DisplayObject):void
	{
		center(obj);
		blur.blurX += blurSize/5;
		blur.blurY += blurSize/5;
		obj.filters = [blur];  
	}
	
	private function hideActionComplete(obj:DisplayObject):void
	{
		obj.filters = [];  
		removePopUpComplete(obj);
	}
	
	
}