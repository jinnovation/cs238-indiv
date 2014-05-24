package com.jjin.state
{
    import org.flixel.*;

    import com.jjin.R.*;

    import com.jjin.Leader;
    import com.jjin.Follower;

    public class PlayState extends FlxState
    {
        private var leader:Leader
        = new Leader(0, 0, Assets.IMG_BOOKER);
        private var follower:Follower
        = new Follower(100, 0, leader, Assets.IMG_LIZZY);
        
        override public function create():void {
            super.create();

            add(leader);
            add(leader.personalBubble);
            add(follower);
            add(follower.destMarker);
        }

        override public function update():void {
            super.update();
        }
    }
}