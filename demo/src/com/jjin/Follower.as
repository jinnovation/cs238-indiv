package com.jjin
{
    import org.flixel.*;

    import com.jjin.R.*;    
    import com.jjin.Leader;
    import com.jjin.POI;
    import com.jjin.Periphery;
    import com.jjin.state.PlayState;
    import org.flixel.plugin.photonstorm.FlxVelocity;
    import org.flixel.plugin.photonstorm.FlxMath;
    import org.flixel.plugin.photonstorm.FlxDelay;

    import flash.utils.getQualifiedClassName;

    public class Follower extends Character implements Interaction
    {
        private var _leader:Leader;

        private var _dest:FlxPoint;
        private var _destMarker:FlxSprite;

        private var _bubbleSight:Periphery;
        public function get bubbleSight():Periphery { return _bubbleSight; }

        private static const _destR :int = 20;
        private static const _visionDist:int = 80;
        
        private var dialogTimer:FlxDelay = new FlxDelay(2000);

        public function Follower(X:int, Y:int,
            leader:Leader, graphic:Class=null):void
        {
            super(X,Y, graphic);
            _bubbleSight = new Periphery(this, _visionDist, 0xff0000);

            this.leader = leader;
            this.setRandomDest();
        }

        public function set leader(ldr:Leader):void { _leader = ldr; }

        private function setDestTarget(target:FlxObject):void {
            if (_dest == null) {
                _dest = new FlxPoint(target.x, target.y);
            } else {
                _dest.x = target.x;
                _dest.y = target.y;
            }

            if (_destMarker == null) {
                _destMarker = new FlxSprite(target.x, target.y, Assets.IMG_RETICLE);
            } else {
                _destMarker.x = target.x;
                _destMarker.y = target.y;
            }
        }
        
        private function setDest(x:int, y:int):void
        {
            if (_dest == null) {
                _dest = new FlxPoint(x,y);
            } else {
                _dest.x = x;
                _dest.y = y;
            }

            if (_destMarker == null) {
                _destMarker = new FlxSprite(x, y, Assets.IMG_RETICLE);
            } else {
                _destMarker.x = x;
                _destMarker.y = y;
            }

        }
        public function get destMarker():FlxSprite { return this._destMarker; }

        private function setRandomDest():void
        {
            // TODO: set world as bounds as well

            var seed:FlxPoint = _leader.randWithinBubbleFollower();

            var wOffset:int = (seed.x<0 ? -1 : 1)*this.width;
            var hOffset:int = (seed.y<0 ? -1 : 1)*this.height;
            
            var xNew:int = _leader.center.x + seed.x;
            var yNew:int = _leader.center.y + seed.y;

            var vecLeaderGoal:FlxPoint
            = FlxVelocity.vectorFromTo(_leader, PlayState.goal);

            xNew += Math.random()*vecLeaderGoal.x;
            yNew += Math.random()*vecLeaderGoal.y;

            setDest(xNew,yNew);
        }


        override public function update():void
        {
            move();

            if (FlxVelocity.distanceToPoint(this, this._dest) < _destR) {
                scanForPOIs();
                this.setRandomDest();
            }

            if (dialogTimer.hasExpired) {
                dialogBox.text = "";
            }

            super.update();
        }

        private function move():void
        {
            FlxVelocity.moveTowardsPoint(this, this._dest, moveSpeed, 1000);
            FlxVelocity.moveTowardsPoint(this._bubbleSight, this._dest, moveSpeed, 1000);
            FlxVelocity.moveTowardsPoint(this._dialogBox, this._dest, moveSpeed, 1000);
        }

        private function scanForPOIs():void
        {
            var stateInteractables:FlxGroup = PlayState(FlxG.state).interactables;

            for each (var i:POI in stateInteractables.members)
            {
                if (FlxVelocity.distanceBetween(this, i) < _bubbleSight.radius) {
                    interact(i);
                }
            }
        }

        public function interact(item: POI):void
        {
            say(item.quip);
        }

        private function say(line:String):void
        {
            this.dialogBox.text = line;
            dialogTimer.start();
        }
    }

}