package com.jjin
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxMath;

    import com.jjin.POI;

    public class Character extends FlxSprite
    {
        protected var _moveSpeed:int;
        
        public function Character(X:int, Y:int,
            graphic:Class = null, spd:int = 5):void
        {
            super(X, Y, graphic);

            _moveSpeed = spd;
        }

        public function set moveSpeed(s:int):void { _moveSpeed = s; }
        public function get moveSpeed():int { return _moveSpeed; }
        
    }
}