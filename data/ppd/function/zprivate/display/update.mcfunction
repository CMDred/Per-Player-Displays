# Tp the Display Root to the player
execute positioned as 80-0-0-0-80 run tp @s ~ ~ ~

# Calculate the display entity translation
scoreboard players operation #ppd ppd.Pos.0 = #ppd.Current ppd.Pos.0
scoreboard players operation #ppd ppd.Pos.1 = #ppd.Current ppd.Pos.1
scoreboard players operation #ppd ppd.Pos.2 = #ppd.Current ppd.Pos.2

execute store result storage ppd:zprivate data.translation[0] double 0.0001 run scoreboard players operation #ppd ppd.Pos.0 += @s ppd.Pos.0
execute store result storage ppd:zprivate data.translation[1] double 0.0001 run scoreboard players operation #ppd ppd.Pos.1 += @s ppd.Pos.1
execute store result storage ppd:zprivate data.translation[2] double 0.0001 run scoreboard players operation #ppd ppd.Pos.2 += @s ppd.Pos.2

# Failsafe if the translation value gets too big
scoreboard players set #ppd.Success ppd 0
execute if score #ppd ppd.Pos.0 matches -1600000..1600000 if score #ppd ppd.Pos.1 matches -1600000..1600000 if score #ppd ppd.Pos.2 matches -1600000..1600000 run scoreboard players set #ppd.Success ppd 1
execute if score #ppd.Success ppd matches 0 run return run execute unless entity @s[tag=ppd.TooFar] run function ppd:zprivate/display/distance_fail
execute if entity @s[tag=ppd.TooFar] run function ppd:zprivate/display/distance_success

# Apply the calculated translation
data modify entity @s transformation.translation set from storage ppd:zprivate data.translation

# Adjust the view_range depending on the player's speed
execute unless score @s ppd.ViewRange = #ppd ppd.ViewRange run function ppd:zprivate/display/view_range
