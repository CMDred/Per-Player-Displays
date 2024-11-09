# Take player movement into account
scoreboard players set #ppd ppd.ViewRange 0
execute on passengers on origin if predicate ppd:movement/1 run scoreboard players set #ppd ppd.ViewRange 1
execute on passengers on origin if predicate ppd:movement/2 run scoreboard players set #ppd ppd.ViewRange 2
execute on passengers on origin if predicate ppd:movement/3 run scoreboard players set #ppd ppd.ViewRange 3
execute on passengers on origin if predicate ppd:movement/4 run scoreboard players set #ppd ppd.ViewRange 4
execute on passengers on origin if predicate ppd:movement/5 run scoreboard players set #ppd ppd.ViewRange 5
execute on passengers on origin if predicate ppd:movement/6 run scoreboard players set #ppd ppd.ViewRange 6
execute unless score @s ppd.ViewRange = #ppd ppd.ViewRange run function ppd:zprivate/display/view_range

# Tp the Display Root to the player
execute positioned as 80-0-0-0-80 run tp @s ~ ~ ~

# Update the display entity translation (I use set string storage because I need to keep the .0, as without a comma digit it automatically defaults to .5)
data modify storage ppd:zprivate data.SPos set from entity 80-0-0-0-80 Pos
data modify storage ppd:zprivate data.SPos0 set from storage ppd:zprivate data.SPos[0]
data modify storage ppd:zprivate data.SPos1 set from storage ppd:zprivate data.SPos[1]
data modify storage ppd:zprivate data.SPos2 set from storage ppd:zprivate data.SPos[2]

execute on passengers if entity @s[type=minecraft:marker] run data modify storage ppd:zprivate data.DPos set from entity @s data.Pos
data modify storage ppd:zprivate data.DPos0 set string storage ppd:zprivate data.DPos[0] 0 -1
data modify storage ppd:zprivate data.DPos1 set string storage ppd:zprivate data.DPos[1] 0 -1
data modify storage ppd:zprivate data.DPos2 set string storage ppd:zprivate data.DPos[2] 0 -1

execute rotated 180 90 run function ppd:zprivate/display/translation with storage ppd:zprivate data
