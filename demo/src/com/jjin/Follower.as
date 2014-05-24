package com.jjin
{
    import org.flixel.*;

    import com.jjin.R.Str;
    import com.jjin.Leader;
    import org.flixel.plugin.photonstorm.FlxVelocity;
    import org.flixel.plugin.photonstorm.FlxMath;

    public class Follower extends Character
    {
        private var leader:Leader;

        private var _dest:FlxPoint;
        private var _destMarker:FlxSprite;

        private static const _destR:int = 20;
        private const followR:int = 20;

        public function Follower(X:int, Y:int,
            leader:Leader, graphic:Class=null):void
        {
            super(X,Y, graphic);

            this.setLeader(leader);
            this.setRandomDest();
        }

        public function setLeader(ldr:Leader):void { this.leader = ldr; }

        private function setDest(x:int, y:int):void
        {
            if (_dest == null) {
                _dest = new FlxPoint(x,y);
            } else {
                _dest.x = x;
                _dest.y = y;
            }

            if (_destMarker == null) {
                _destMarker = new FlxSprite(x, y);
            } else {
                _destMarker.x = x;
                _destMarker.y = y;
            }

        }
        public function get destMarker():FlxSprite { return this._destMarker; }

        private function setRandomDest():void
        {
            // TODO: set world as bounds as well

            var seed:FlxPoint = leader.randomRadiusVector();
            
            var xNew:int = leader.center.x + seed.x + (seed.x<0 ? -1 : 1)*this.width;

            var yNew:int = leader.center.y + seed.y + (seed.y<0 ? -1 : 1*this.height);

            setDest(xNew,yNew);
        }


        override public function update():void
        {
            FlxVelocity.moveTowardsPoint(this, this._dest, moveSpeed, 1000);

            if (FlxVelocity.distanceToPoint(this, this._dest) < _destR) {
                this.setRandomDest();
            }
        }
    }

}