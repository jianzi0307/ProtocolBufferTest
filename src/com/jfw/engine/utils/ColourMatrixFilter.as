//Created by Action Script Viewer - http://www.buraks.com/asv
package com.jfw.engine.utils
{
    import flash.events.*;
    import flash.filters.ColorMatrixFilter;
    
    import mx.events.*;

    public class ColourMatrixFilter implements IEventDispatcher {

        public static var redLuminance:Number = 0.2225;
        public static var greenLuminance:Number = 0.7169;
        public static var blueLuminance:Number = 0.0606;
        private static var _72208174blackAndWhiteMatrix:Array = [redLuminance, greenLuminance, blueLuminance, 0, 0, redLuminance, greenLuminance, blueLuminance, 0, 0, redLuminance, greenLuminance, blueLuminance, 0, 0, 0, 0, 0, 1, 0];
        private static var _892455858redMatrix:Array = [5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
        private static var _1985566257darkAndRedMatrix:Array = [5, 0.1, 0.1, 0, 0, 0.1, 0.1, 0.1, 0, 0, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 1, 0];
        private static var _1106850486whiteMatrix:Array = [1.3, 0, 0, 0, 0, 0, 1.3, 0, 0, 0, 0, 0, 1.3, 0, 0, 0, 0, 0, 1, 0];
        private static var instance:ColourMatrixFilter;
        private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();

        private var _blackAndWhiteColorMatrixFilter:ColorMatrixFilter;
        private var _redColorMatrixFilter:ColorMatrixFilter;
        private var _whiteColorMatrixFilter:ColorMatrixFilter;
        private var _darkAndRedColorMatrixFilter:ColorMatrixFilter;
        private var _bindingEventDispatcher:EventDispatcher;

        public function ColourMatrixFilter(_arg1:SingletonEnforcer){
            this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }
        public static function getInstance():ColourMatrixFilter{
            if (!instance){
                instance = new ColourMatrixFilter(new SingletonEnforcer());
            };
            return (instance);
        }
        public static function blackAndWhite():flash.filters.ColorMatrixFilter{
            return (getInstance()._blackAndWhite());
        }
        public static function red():ColorMatrixFilter{
            return (getInstance()._red());
        }
        public static function white():ColorMatrixFilter{
            return (getInstance()._white());
        }
        public static function darkAndRed():ColorMatrixFilter{
            return (getInstance()._darkAndRed());
        }
		public static function get grayMatrixFilter():flash.filters.ColorMatrixFilter
		{
			var matrix:Array = new Array();
			matrix = matrix.concat([0.3086, 0.6094, 0.082, 0, 0]); // red
			matrix = matrix.concat([0.3086, 0.6094, 0.082, 0, 0]); // green
			matrix = matrix.concat([0.3086, 0.6094, 0.082, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha

			return new ColorMatrixFilter(matrix);
		}
        public static function get blackAndWhiteMatrix():Array{
            return (ColourMatrixFilter._72208174blackAndWhiteMatrix);
        }
        public static function set blackAndWhiteMatrix(_arg1:Array):void{
            var _local3:IEventDispatcher;
            var _local2:Object = ColourMatrixFilter._72208174blackAndWhiteMatrix;
            if (_local2 !== _arg1){
                ColourMatrixFilter._72208174blackAndWhiteMatrix = _arg1;
                _local3 = ColourMatrixFilter.staticEventDispatcher;
                if (_local3 !== null){
                    _local3.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ColourMatrixFilter, "blackAndWhiteMatrix", _local2, _arg1));
                };
            };
        }
        public static function get redMatrix():Array{
            return (ColourMatrixFilter._892455858redMatrix);
        }
        public static function set redMatrix(_arg1:Array):void{
            var _local3:IEventDispatcher;
            var _local2:Object = ColourMatrixFilter._892455858redMatrix;
            if (_local2 !== _arg1){
                ColourMatrixFilter._892455858redMatrix = _arg1;
                _local3 = ColourMatrixFilter.staticEventDispatcher;
                if (_local3 !== null){
                    _local3.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ColourMatrixFilter, "redMatrix", _local2, _arg1));
                };
            };
        }
        public static function get darkAndRedMatrix():Array{
            return (ColourMatrixFilter._1985566257darkAndRedMatrix);
        }
        public static function set darkAndRedMatrix(_arg1:Array):void{
            var _local3:IEventDispatcher;
            var _local2:Object = ColourMatrixFilter._1985566257darkAndRedMatrix;
            if (_local2 !== _arg1){
                ColourMatrixFilter._1985566257darkAndRedMatrix = _arg1;
                _local3 = ColourMatrixFilter.staticEventDispatcher;
                if (_local3 !== null){
                    _local3.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ColourMatrixFilter, "darkAndRedMatrix", _local2, _arg1));
                };
            };
        }
        public static function get whiteMatrix():Array{
            return (ColourMatrixFilter._1106850486whiteMatrix);
        }
        public static function set whiteMatrix(_arg1:Array):void{
            var _local3:IEventDispatcher;
            var _local2:Object = ColourMatrixFilter._1106850486whiteMatrix;
            if (_local2 !== _arg1){
                ColourMatrixFilter._1106850486whiteMatrix = _arg1;
                _local3 = ColourMatrixFilter.staticEventDispatcher;
                if (_local3 !== null){
                    _local3.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ColourMatrixFilter, "whiteMatrix", _local2, _arg1));
                };
            };
        }
        public static function get staticEventDispatcher():IEventDispatcher{
            return (_staticBindingEventDispatcher);
        }

        private function _blackAndWhite():ColorMatrixFilter{
            if (!this._blackAndWhiteColorMatrixFilter){
                this._blackAndWhiteColorMatrixFilter = this.createColorMatrixFilter(blackAndWhiteMatrix);
            };
            return (this._blackAndWhiteColorMatrixFilter);
        }
        private function _red():ColorMatrixFilter{
            if (!this._redColorMatrixFilter){
                this._redColorMatrixFilter = this.createColorMatrixFilter(redMatrix);
            };
            return (this._redColorMatrixFilter);
        }
        private function _white():ColorMatrixFilter{
            if (!this._whiteColorMatrixFilter){
                this._whiteColorMatrixFilter = this.createColorMatrixFilter(whiteMatrix);
            };
            return (this._whiteColorMatrixFilter);
        }
        private function _darkAndRed():ColorMatrixFilter{
            if (!this._darkAndRedColorMatrixFilter){
                this._darkAndRedColorMatrixFilter = this.createColorMatrixFilter(darkAndRedMatrix);
            };
            return (this._darkAndRedColorMatrixFilter);
        }
        private function createColorMatrixFilter(_arg1:Array):ColorMatrixFilter{
            var _local2:ColorMatrixFilter = new ColorMatrixFilter();
            _local2.matrix = _arg1;
            return (_local2);
        }
        public function addEventListener(_arg1:String, _arg2:Function, _arg3:Boolean=false, _arg4:int=0, _arg5:Boolean=false):void{
            this._bindingEventDispatcher.addEventListener(_arg1, _arg2, _arg3, _arg4, _arg5);
        }
        public function dispatchEvent(_arg1:Event):Boolean{
            return (this._bindingEventDispatcher.dispatchEvent(_arg1));
        }
        public function hasEventListener(_arg1:String):Boolean{
            return (this._bindingEventDispatcher.hasEventListener(_arg1));
        }
        public function removeEventListener(_arg1:String, _arg2:Function, _arg3:Boolean=false):void{
            this._bindingEventDispatcher.removeEventListener(_arg1, _arg2, _arg3);
        }
        public function willTrigger(_arg1:String):Boolean{
            return (this._bindingEventDispatcher.willTrigger(_arg1));
        }

    }
}//package com.bossa.monsters.utils 

class SingletonEnforcer {

    public function SingletonEnforcer(){
    }
}
