package
{
    import org.flixel.*;
    import com.jjin.state.StartState;
    
    [SWF(width="900", height="500", backgroundColor="#000000")]
    [Frame(factoryClass="Preloader")]

    public class Elizabeth extends FlxGame
    {	
	public function Elizabeth()
	{
	    FlxG.visualDebug = true;

	    super(900, 500, StartState, 1);
	}
    }
}