scoreboard players operation #ppd.Current ppd.ID = @s ppd.ID

# Get the SPos (Starting Pos)
data modify storage ppd:zprivate data.SPos set from entity 80-0-0-0-80 Pos
execute store result score #ppd.Current ppd.Pos.x run data get storage ppd:zprivate data.SPos[0] -10000
execute store result score #ppd.Current ppd.Pos.y run data get storage ppd:zprivate data.SPos[1] -10000
execute store result score #ppd.Current ppd.Pos.z run data get storage ppd:zprivate data.SPos[2] -10000

# Update the view_range
scoreboard players set #ppd ppd.ViewRange 20000

execute if predicate ppd:movement/1 run scoreboard players set #ppd ppd.ViewRange 30000
execute if predicate ppd:movement/2 run scoreboard players set #ppd ppd.ViewRange 41000
execute if predicate ppd:movement/3 run scoreboard players set #ppd ppd.ViewRange 68000
execute if predicate ppd:movement/4 run scoreboard players set #ppd ppd.ViewRange 99000
execute if predicate ppd:movement/5 run scoreboard players set #ppd ppd.ViewRange 135000
execute if predicate ppd:movement/6 run scoreboard players set #ppd ppd.ViewRange 225000

execute store result score #ppd.Scale ppd run attribute @s minecraft:scale get 11000
execute if score #ppd.Scale ppd matches 11001.. run function ppd:zprivate/display/scale

execute store result storage ppd:zprivate data.ViewRange float 0.000000001 run scoreboard players operation #ppd ppd.ViewRange *= @s ppd.ViewRange
