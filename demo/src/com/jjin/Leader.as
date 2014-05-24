package com.jjin
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxMath;

    import com.jjin.R.Str;
    import com.jjin.R.Keybinding;

    public class Leader extends Character
    {
        private static const LEFT  :int	= 0;
        private static const RIGHT :int	= 1;
        private static const DOWN  :int	= 2;
        private static const UP    :int	= 3;

        private const _personalBubbleR:int = 50;

        private var _personalBubble:FlxSprite;

        public function get personalBubble():FlxSprite { return _personalBubble; }

        public function get personalBubbleR():int { return _personalBubbleR; }

        public function Leader(X:int, Y:int, graphic:Class=null):void
        {
            super(X,Y, graphic);

            this.makePersonalBubble();
        }

        public function get center():FlxPoint
        { return new FlxPoint(this.x + this.width / 2, this.y + this.height / 2); }

        private function makePersonalBubble():void
        {
            this._personalBubble =
            new FlxSprite(this.x -this.width / 2, this.y - this.height / 2);
            this._personalBubble.makeGraphic(this._personalBubbleR*2,
                this._personalBubbleR*2, 0x00000000);
        }

        override public function update():void
        {
            this.handleKeypress();
            this.drawPersonalBubble();
        }

        private function drawPersonalBubble():void {
            drawCircle(this._personalBubble,
                new FlxPoint(this._personalBubbleR, this._personalBubbleR),
                this._personalBubbleR, 0xff33ff33, 1);
        }

        public function randomRadiusVector():FlxPoint
        {
            var l2:int = _personalBubbleR * _personalBubbleR;

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