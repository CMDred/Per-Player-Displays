scoreboard players operation #ppd.Current ppd.ID = @s ppd.ID

# Get the SPos
data modify storage ppd:zprivate data.SPos set from entity 80-0-0-0-80 Pos
execute store result score #ppd.Current ppd.Pos.0 run data get storage ppd:zprivate data.SPos[0] -10000
execute store result score #ppd.Current ppd.Pos.1 run data get storage ppd:zprivate data.SPos[1] -10000
execute store result score #ppd.Current ppd.Pos.2 run data get storage ppd:zprivate data.SPos[2] -10000

# Get the ViewRange
scoreboard players set #ppd ppd.ViewRange 30
execute if predicate ppd:movement/1 run scoreboard players set #ppd ppd.ViewRange 50
execute if predicate ppd:movement/2 run scoreboard players set #ppd ppd.ViewRange 70
execute if predicate ppd:movement/3 run scoreboard players set #ppd ppd.ViewRange 120
execute if predicate ppd:movement/4 run scoreboard players set #ppd ppd.ViewRange 170
execute if predicate ppd:movement/5 run scoreboard players set #ppd ppd.ViewRange 215
execute if predicate ppd:movement/6 run scoreboard players set #ppd ppd.ViewRange 320

execute store result storage ppd:zprivate data.ViewRange float 0.0001 run scoreboard players operation #ppd ppd.ViewRange += @s ppd.ViewRange
