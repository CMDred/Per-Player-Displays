# Check if the player is offline or in a different dimension
scoreboard players operation #ppd.Search ppd.ID = @s ppd.ID
execute store success score #ppd.Success ppd run tag @a[predicate=ppd:same_id,x=0,limit=1] add ppd.Origin
execute if score #ppd.Success ppd matches 0 run return run execute unless entity @s[tag=ppd.NoPlayer] run function ppd:zprivate/display/player_offline
execute if entity @s[tag=ppd.NoPlayer] run function ppd:zprivate/display/player_online

# Update the display entity's view_range
execute as @a[tag=ppd.Origin,limit=1] at @s anchored eyes rotated ~ 0 run tp 80-0-0-0-80 ^ ^0.1 ^
execute unless score #ppd.Search ppd.ID = #ppd.Current ppd.ID as @a[tag=ppd.Origin,limit=1] run function ppd:zprivate/display/get_player_data
tag @a[tag=ppd.Origin,limit=1] remove ppd.Origin

# Update the translation
    # Tp the Display Root to the player
    execute positioned as 80-0-0-0-80 run tp @s ~ ~ ~

    # Calculate the display entity translation
    scoreboard players operation #ppd ppd.Pos.x = #ppd.Current ppd.Pos.x
    scoreboard players operation #ppd ppd.Pos.y = #ppd.Current ppd.Pos.y
    scoreboard players operation #ppd ppd.Pos.z = #ppd.Current ppd.Pos.z

    execute store result storage ppd:zprivate data.translation[0] double 0.0001 run scoreboard players operation #ppd ppd.Pos.x += @s ppd.Pos.x
    execute store result storage ppd:zprivate data.translation[1] double 0.0001 run scoreboard players operation #ppd ppd.Pos.y += @s ppd.Pos.y
    execute store result storage ppd:zprivate data.translation[2] double 0.0001 run scoreboard players operation #ppd ppd.Pos.z += @s ppd.Pos.z

    # Failsafe if the translation value gets too big
    scoreboard players set #ppd.Success ppd 0
    execute if score #ppd ppd.Pos.x matches -1600000..1600000 if score #ppd ppd.Pos.y matches -1600000..1600000 if score #ppd ppd.Pos.z matches -1600000..1600000 run scoreboard players set #ppd.Success ppd 1
    execute if score #ppd.Success ppd matches 0 run return run execute unless entity @s[tag=ppd.TooFar] run function ppd:zprivate/display/distance_fail
    execute if entity @s[tag=ppd.TooFar] run function ppd:zprivate/display/distance_success

    # Apply the calculated translation
    data modify entity @s transformation.translation set from storage ppd:zprivate data.translation

    # Adjust the view_range depending on the player's speed
    execute unless score @s ppd.ViewRange = #ppd ppd.ViewRange run function ppd:zprivate/display/view_range with storage ppd:zprivate data
