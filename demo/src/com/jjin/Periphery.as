package com.jjin
{
    import org.flixel.*;
    
    public class Periphery extends FlxSprite
    {
        private var _radius:int;
        public function get radius():int { return _radius; }
        private var _lineColor:int;
        
        public function Periphery(center:FlxObject, radius:int, color:int=0xffffff):void
        {
            super(center.x - center.width / 2, center.y - center.height / 2);

            _radius = radius;
            this.makeGraphic(_radius*2, _radius*2, 0x00000000);

            _lineColor = color;
        }

        override public function update(): void
        {
            drawCircle(this, new FlxPoint(_radius, _radius), _radius, _lineColor, 1);
        }
    }
}