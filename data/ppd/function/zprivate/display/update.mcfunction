# Tp the Display Root to the player
execute positioned as 80-0-0-0-80 run tp @s ~ ~ ~

# Calculate the display entity translation
data modify storage ppd:zprivate data.SPos set from entity 80-0-0-0-80 Pos
execute store result score #ppd ppd.Pos.0 run data get storage ppd:zprivate data.SPos[0] -10000
execute store result score #ppd ppd.Pos.1 run data get storage ppd:zprivate data.SPos[1] -10000
execute store result score #ppd ppd.Pos.2 run data get storage ppd:zprivate data.SPos[2] -10000

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

# Take player movement into account
scoreboard players set #ppd ppd.ViewRange 0
execute on passengers on origin if predicate ppd:movement/1 run scoreboard players set #ppd ppd.ViewRange 1
execute on passengers on origin if predicate ppd:movement/2 run scoreboard players set #ppd ppd.ViewRange 2
execute on passengers on origin if predicate ppd:movement/3 run scoreboard players set #ppd ppd.ViewRange 3
execute on passengers on origin if predicate ppd:movement/4 run scoreboard players set #ppd ppd.ViewRange 4
execute on passengers on origin if predicate ppd:movement/5 run scoreboard players set #ppd ppd.ViewRange 5
execute on passengers on origin if predicate ppd:movement/6 run scoreboard players set #ppd ppd.ViewRange 6
execute unless score @s ppd.ViewRange = #ppd ppd.ViewRange run function ppd:zprivate/display/view_range
