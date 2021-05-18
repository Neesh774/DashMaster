import flixel.FlxG;
import flixel.FlxSprite;

class Platform extends FlxSprite
{
	private static inline var MOVEMENT_SPEED = 300;
	private static var hasCoin:Bool;

	public function new(x:Int, y:Int)
	{
		super(x, y);
		velocity.y = 25;
		loadGraphic("assets/images/platform.png");
		hasCoin = FlxG.random.bool(50);
		immovable = true;
	}

	public static function randomSpawn()
	{
		var x = FlxG.random.int(28, 950);
		var y = -80;
		return new Platform(x, y);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
