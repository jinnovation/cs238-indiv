package com.jjin.state
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxMath;

    import com.jjin.R.*;

    import com.jjin.*;

    public class PlayState extends FlxState
    {
        private var leader:Leader
        = new Leader(200, 200, Assets.IMG_BOOKER);
        private var follower:Follower
        = new Follower(100, 0, leader, Assets.IMG_LIZZY);

        private static var _goal:FlxSprite
        = new FlxSprite(850, 200, Assets.IMG_GOAL);
        public static function get goal():FlxSprite { return _goal; }

        private static var nInteractables:int = 5;
        private var _interactables:FlxGroup = new FlxGroup(nInteractables);
        public function get interactables():FlxGroup { return _interactables; }
        
        override public function create():void
        {
            super.create();

            addLeader();
            addFollower();

            add(_goal);

            interactablesGenerate();
        }

        private function addLeader():void
        {
            add(leader);
            add(leader.accessories);
        }

        private function addFollower():void
        {
            add(follower);
            add(follower.destMarker);
            add(follower.bubbleSight);
            add(follower.dialogBox);
        }

        private function interactablesGenerate():void
        {
            var quips:Array = ["Come dance with me Mr. DeWitt!",
                "There is always a lighthouse.",                
                "A man chooses; a slave obeys.",
                "Would you kindly?",
                "My power...it's over 9000!"
            ];
            
            var interactableCurr:POI;
            for (var i:int=0 ; i<nInteractables ; i++) {
                var xPos:int = FlxMath.rand(0, FlxG.width);
                var yPos:int = FlxMath.rand(0, FlxG.height);

                interactableCurr = new POI(xPos, yPos);
                interactableCurr.quip = quips[i];

                _interactables.add(interactableCurr);
            }

            add(_interactables);
        }

        override public function update():void
        {
            super.update();
        }
    }
}