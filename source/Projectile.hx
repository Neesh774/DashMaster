import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

enum ProjectileType
{
	FIRE_BOLT;
	ICE_BOLT;
	POISON_BOLT;
	SHOCK_BOLT;
}

class Projectile extends FlxSprite
{
	private static inline var MOVEMENT_SPEED:Float = 600;

	private var _target:FlxPoint;

	private var _type:ProjectileType;

	public function new(x:Float, y:Float, target:FlxPoint, type:ProjectileType)
	{
		super(x, y);
		_target = target;
		_type = type;

		switch (type)
		{
			case FIRE_BOLT:
				makeGraphic(5, 5, FlxColor.RED);
			case ICE_BOLT:
				makeGraphic(5, 5, FlxColor.BLUE);
			case POISON_BOLT:
				makeGraphic(5, 5, FlxColor.GREEN);
			case SHOCK_BOLT:
				makeGraphic(5, 5, FlxColor.YELLOW);
		}
	}
}
