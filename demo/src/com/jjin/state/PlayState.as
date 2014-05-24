package com.jjin.state
{
    import org.flixel.*;

    import com.jjin.R.*;

    import com.jjin.*;

    public class PlayState extends FlxState
    {
        private var leader:Leader
        = new Leader(200, 200, Assets.IMG_BOOKER);
        private var follower:Follower
        = new Follower(100, 0, leader, Assets.IMG_LIZZY);

        private var chest1:POI
        = new POI(50, 50);
        
        override public function create():void {
            super.create();

            add(leader);
            add(leader.bubblePersonal);
            add(follower);
            add(follower.destMarker);
            add(follower.bubbleSight);

            add(chest1);
        }

        override public function update():void {
            super.update();
        }
    }
}