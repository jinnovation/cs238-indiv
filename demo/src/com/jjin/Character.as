package com.jjin
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxMath;

    import com.jjin.POI;

    public class Character extends FlxSprite
    {
        protected var _moveSpeed:int;
        public function set moveSpeed(s:int):void { _moveSpeed = s; }
        public function get moveSpeed():int { return _moveSpeed; }

        protected var _accessories:FlxGroup;
        public function get accessories():FlxGroup { return _accessories; }

        protected var _dialogBox:FlxText;
        public function get dialogBox():FlxText { return _dialogBox; }
        private var _dBoxOffset:int;
        
        public function Character(X:int, Y:int,
            graphic:Class = null, spd:int = 5):void
        {
            super(X, Y, graphic);
            
            _accessories = new FlxGroup;
            _moveSpeed = spd;

            _dBoxOffset = this.height / -2;
            
            _dialogBox = new FlxText(X, Y + _dBoxOffset, 150, null, false);
        }

        override public function update():void
        {
            _dialogBox.y = this.y + _dBoxOffset;
            
            super.update();
        }


        
    }
}