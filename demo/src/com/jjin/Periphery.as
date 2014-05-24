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
            super(center.x - radius + center.width / 2, center.y - radius + center.height / 2);

            _radius = radius;
            _lineColor = color;
            this.makeGraphic(_radius*2, _radius*2, 0x00000000);
        }

        override public function update(): void
        {
            drawCircle(this, new FlxPoint(_radius, _radius), _radius, _lineColor, 1);
        }
    }
}