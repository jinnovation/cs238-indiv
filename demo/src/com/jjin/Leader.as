package com.jjin
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxMath;

    import com.jjin.R.Str;
    import com.jjin.R.Keybinding;

    import com.jjin.Periphery;

    public class Leader extends Character
    {
        private var _bubblePersonal:Periphery;
        public function get bubblePersonal():Periphery { return _bubblePersonal; }

        private var _bubbleFollower:Periphery;
        public function get bubbleFollower():Periphery { return _bubbleFollower; }

        public function Leader(X:int, Y:int, graphic:Class=null):void
        {
            super(X,Y, graphic);

            _bubblePersonal = new Periphery(this, 50, 0xff33ff33);
            _bubbleFollower = new Periphery(this, 200, 0xff0000ff);

            accessories.add(_bubblePersonal);
            accessories.add(_bubbleFollower);
        }

        public function get center():FlxPoint
        {
            return new FlxPoint(this.x + this.width / 2, this.y + this.height / 2);
        }

        override public function update():void
        {
            this.handleKeypress();
        }

        public function randWithinRadius(radius:int):FlxPoint
        {
            var l2:int = radius * radius;

            do {
                var x2:int = FlxMath.rand(0, l2)/2;
                var y2:int = FlxMath.rand(0, l2)/2;

                var x:int = Math.floor(Math.sqrt(x2)) * FlxMath.randomSign();
                var y:int = Math.floor(Math.sqrt(y2)) * FlxMath.randomSign();

                var distFrom:Number
                = FlxMath.vectorLength(x - this.center.x,
                    y - this.center.y);
                
            } while (distFrom < this.bubblePersonal.radius);

            return new FlxPoint(x,y);
        }

        public function randWithinBubbleFollower():FlxPoint
        {
            return randWithinRadius(_bubbleFollower.radius);
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
            var accessory:FlxObject;

            switch (dir) {
                case LEFT:
                this.x -= moveSpeed;
                for each (accessory in accessories.members) {
                    accessory.x -= moveSpeed;
                }
                break;

                case RIGHT:
                this.x += moveSpeed;
                for each (accessory in accessories.members) {
                    accessory.x += moveSpeed;
                }
                break;

                case UP:
                this.y -= moveSpeed;
                for each (accessory in accessories.members) {
                    accessory.y -= moveSpeed;
                }
                break;

                case DOWN:
                this.y += moveSpeed;
                for each (accessory in accessories.members) {
                    accessory.y += moveSpeed;
                }
                break;
            }
        }
    }
}