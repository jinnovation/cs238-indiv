package com.jjin.state
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.FlxDisplay;
    import com.jjin.R.Str;

    public class StartState extends FlxState
    {
	private static var elemBuffer:int = 25;
        
        private var txtTitle:FlxText
        = FlxText(FlxDisplay.screenCenter(
                new FlxText(0, 0, 200, Str.GAME_TITLE)));

        private var btnStart:FlxButton = FlxButton(FlxDisplay.screenCenter(
		new FlxButton(txtTitle.x,
		    txtTitle.y+txtTitle.height+elemBuffer,
		    Str.BTN_START, function():void {
			FlxG.switchState(new PlayState);
			return;
		    }), true, true));
        
        override public function create():void {
	    txtTitle.scale.x = txtTitle.scale.y = 2;
	    // txtSubtitle.scale.x = txtSubtitle.scale.y = 2;
	    btnStart.scale.x = btnStart.scale.y = 2;
	    // btnOption.scale.x = btnOption.scale.y = 2;

	    super.create();
            
	    FlxG.visualDebug = true;
	    FlxG.mouse.show();
            
	    add(txtTitle);
	    // add(txtSubtitle);
	    add(btnStart);
	    // add(btnOption);
        }
    }
}