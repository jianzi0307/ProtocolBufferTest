package com.jfw.engine.utils
{
	public class  PageArray
	{
		private var ItemNum:int;//一页有多少个元素
		private var TotalPage:int;//总页数
		private var Page:int;//当前页数
		private var NowPageArray:Array;//当前页的数据
		private var DataArray:Array;
		
		public function PageArray(itemnum:int) 
		{
			ItemNum = itemnum;
			NowPageArray = new Array();
			DataArray = new Array();
		}
		
		public function AddArray(_array:Array):void 
		{
			for (var i:int = 0 , num:int = _array.length; i < num; i++ )
			{
				DataArray.push(_array[i]);
			}
			TotalPage = Math.ceil(DataArray.length / ItemNum);
		}
		
		public function fGetTotalPage():int 
		{
			return TotalPage;
		}
		
		public function fGetPageData(_page:int):Array 
		{
			NowPageArray = [];
			var startpoint:int = (_page-1) * ItemNum;
			var num:int;
			if (startpoint + ItemNum <= DataArray.length)
			{
				num = ItemNum;
			}else {
				num = DataArray.length - startpoint;
			}
			if (DataArray.length > 0)
			{
				for (var i:int = 0; i < num; i++) 
				{
					NowPageArray.push(DataArray[startpoint + i]);
				}
			}
			return NowPageArray;
		}
		
		public function fGetItemData(_page:int, _index:int):* 
		{
			if ((_page-1) * ItemNum + _index < DataArray.length)
			{
				return DataArray[(_page-1) * ItemNum + _index];
			}else {
				return null;
			}
		}
		
		public function fReNewArray(data:Array):void 
		{
			DataArray = data;
			TotalPage = Math.ceil(DataArray.length / ItemNum);
		}
		
		public function dispose():void
		{
			NowPageArray = [];
			DataArray = [];
		}
	}
	
}