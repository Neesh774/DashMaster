package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _platformGroup:FlxTypedSpriteGroup<Platform>;

	override public function create()
	{
		_player = new Player(50, 50);
		add(_player);

		_platformGroup = new FlxTypedSpriteGroup<Platform>(18, 82);
		add(_platformGroup);

		var startPlatform = new Platform(18, 82);
		_platformGroup.add(startPlatform);

		new FlxTimer().start(3.0, spawnPlatform, 0);
		super.bgColor = FlxColor.fromRGB(15, 0, 36, 255);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(_player, _platformGroup.group);
		FlxG.worldBounds.set(15, 15, 1050, 690);
		super.update(elapsed);
	}

	function spawnPlatform(timer:FlxTimer)
	{
		var _newPlatform = Platform.randomSpawn();
		_platformGroup.add(_newPlatform);
	}
}
