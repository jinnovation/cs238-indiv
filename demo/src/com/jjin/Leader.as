package com.jjin
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxMath;

    import com.jjin.R.Str;
    import com.jjin.R.Keybinding;

    import com.jjin.Periphery;

    public class Leader extends Character
    {
        private static const LEFT  :int	= 0;
        private static const RIGHT :int	= 1;
        private static const DOWN  :int	= 2;
        private static const UP    :int	= 3;

        // private const _personalBubbleR:int = 50;

        private var _personalBubble:Periphery;
        public function get personalBubble():Periphery { return _personalBubble; }

        public function Leader(X:int, Y:int, graphic:Class=null):void
        {
            super(X,Y, graphic);

            _personalBubble = new Periphery(this, 50, 0xff33ff33);
        }

        public function get center():FlxPoint
        {
            return new FlxPoint(this.x + this.width / 2, this.y + this.height / 2);
        }

        override public function update():void
        {
            this.handleKeypress();
        }

        public function randomRadiusVector():FlxPoint
        {
            var l2:int = _personalBubble.radius * _personalBubble.radius;

            var x2:int = FlxMath.rand(0, l2);
            var y2:int = l2 - x2;
            var x:int = Math.floor(Math.sqrt(x2)) * FlxMath.randomSign();
            var y:int = Math.floor(Math.sqrt(y2)) * FlxMath.randomSign();

            return new FlxPoint(x,y);
        }

        private function handleKeypress():void
        {

            if (FlxG.keys[Keybinding.KEY_MOVE_UP]) {
                move(UP);
            }

            if (FlxG.keys[Keybinding.KEY_MOVE_DOWN]) {
                move(DOWN);
            }

            if (FlxG.keys[Keybinding.KEY_MOVE_LEFT]) {
                move(LEFT);
            }

            if (FlxG.keys[Keybinding.KEY_MOVE_RIGHT]) {
                move(RIGHT);
            }
        }

        private function move(dir:int):void
        {
            switch (dir) {
                case LEFT:
                this.x -= moveSpeed;
                this._personalBubble.x -= moveSpeed;
                break;
                case RIGHT:
                this.x += moveSpeed;
                this._personalBubble.x += moveSpeed;
                break;
                case UP:
                this.y -= moveSpeed;
                this._personalBubble.y -= moveSpeed;
                break;
                case DOWN:
                this.y += moveSpeed;
                this._personalBubble.y += moveSpeed;
                break;
            }
        }
    }
}