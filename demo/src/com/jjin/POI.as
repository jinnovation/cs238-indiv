package com.jjin
{
    import org.flixel.*;

    import com.jjin.R.*;

    public class POI extends FlxSprite
    {
        private var _quip:String;
        public function get quip():String { return _quip; }
        public function set quip(s:String):void { _quip = s; }
        
        public function POI(X:int, Y:int):void
        {
            super(X,Y,Assets.IMG_CHEST);
            _quip = "DEFAULT QUIP";
        }
    }
}