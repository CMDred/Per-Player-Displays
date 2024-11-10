# Check if the player is offline or in a different dimension
execute on origin run tag @s add ppd.Origin
execute unless entity @a[tag=ppd.Origin,x=0,limit=1] run return run execute unless entity @s[tag=ppd.NoPlayer] run function ppd:zprivate/display/player_offline
execute if entity @s[tag=ppd.NoPlayer] run function ppd:zprivate/display/player_online
execute on origin run tag @s remove ppd.Origin

# Update the display entity's translation & view_range
execute on origin at @s anchored eyes rotated ~ 0 run tp 80-0-0-0-80 ^ ^0.1 ^
execute on origin unless score @s ppd.ID = #ppd.Current ppd.ID run function ppd:zprivate/display/get_player_data
execute on vehicle run function ppd:zprivate/display/update
