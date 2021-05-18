import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Player extends FlxSprite
{
	static var MOVEMENT_SPEED:Float = 350;

	public static var fuel:Float = 100;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		loadGraphic("assets/images/entity.png");
		drag.x = drag.y = 2000;
		acceleration.y = 900;
	}

	override function update(elapsed:Float)
	{
		movement();
		// booster();
		dashBar().draw();
		super.update(elapsed);
	}

	private function movement()
	{
		var left:Bool = false;
		var right:Bool = false;
		var boost:Bool = false;
		var up:Bool = false;

		left = FlxG.keys.anyPressed([A]);
		right = FlxG.keys.anyPressed([D]);
		up = FlxG.keys.anyPressed([W]);
		boost = FlxG.keys.anyPressed([SPACE]);

		if (left && right)
		{
			left = right = false;
		}
		if (boost)
		{
			MOVEMENT_SPEED = 1000;
			fuel--;
			dashBar().updateBar();
		}
		else
		{
			MOVEMENT_SPEED = 350;
		}
		if (up || left || right)
		{
			var newAngle:Float = 0;

			if (up)
			{
				newAngle = -90;

				if (left)
				{
					newAngle -= 45;
					flipX = true;
				}
				else if (right)
				{
					newAngle += 45;
					flipX = false;
				}
			}
			else if (left)
			{
				newAngle = 180;
				flipX = true;
			}
			else if (right)
			{
				newAngle = 0;
				flipX = false;
			}

			velocity.set(MOVEMENT_SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), newAngle);
		}
	}

	private function dashBar()
	{
		var Bar:FlxBar = new FlxBar(900, 670, LEFT_TO_RIGHT, 100, 10, fuel, "Fuel", 0, 100, true);
		var fill = FlxColor.fromRGB(250, 119, 62, 255);
		var empty = FlxColor.fromRGB(99, 61, 44, 255);
		var border = FlxColor.fromRGB(117, 36, 0, 255);
		return Bar.createFilledBar(empty, fill, true, border);
	}
}
