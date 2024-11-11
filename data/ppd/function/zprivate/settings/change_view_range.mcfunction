# Error Checking
execute if score @s ppd.ViewRangeMultiplier matches ..19 run tellraw @s [{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"Error: Your ViewRangeMultiplier cannot be less than 20%.","color":"red"}]
execute if score @s ppd.ViewRangeMultiplier matches ..19 run return run scoreboard players set @s ppd.ViewRangeMultiplier 0
execute if score @s ppd.ViewRangeMultiplier matches 501.. run tellraw @s [{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"Error: Your ViewRangeMultiplier cannot exceed 500%.","color":"red"}]
execute if score @s ppd.ViewRangeMultiplier matches 501.. run return run scoreboard players set @s ppd.ViewRangeMultiplier 0

# Set value
execute store result storage ppd:zprivate data.ViewRange float 0.01 store result score @s ppd.ViewRange run scoreboard players get @s ppd.ViewRangeMultiplier
data modify storage ppd:zprivate data.ViewRange set string storage ppd:zprivate data.ViewRange 0 -1

tellraw @s ["",{"text":"Per-Player Displays >> ","color":"#C1EA53"},"Successfully changed your ViewRangeMultiplier to ",{"nbt":"data.ViewRange","storage":"ppd:zprivate","color":"yellow"},{"text":"x","color":"yellow"},"."]
scoreboard players set @s ppd.ViewRangeMultiplier 0
