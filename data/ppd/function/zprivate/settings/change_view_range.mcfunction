# Default
execute unless score @s ppd.ViewRange matches 0.. run return run scoreboard players set @s ppd.ViewRange 0

# Error Checking
execute if score @s ppd.ViewRangeBuffer matches ..-1 run tellraw @s [{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"Error: Your ViewRangeBuffer cannot be negative.","color":"red"}]
execute if score @s ppd.ViewRangeBuffer matches ..-1 run return run scoreboard players operation @s ppd.ViewRangeBuffer = @s ppd.ViewRange
execute if score @s ppd.ViewRangeBuffer matches 501.. run tellraw @s [{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"Error: Your ViewRangeBuffer must not exceed 500.","color":"red"}]
execute if score @s ppd.ViewRangeBuffer matches 501.. run return run scoreboard players operation @s ppd.ViewRangeBuffer = @s ppd.ViewRange

# Set value
scoreboard players operation @s ppd.ViewRange = @s ppd.ViewRangeBuffer
execute store result storage ppd:zprivate data.ViewRange float 0.0001 run scoreboard players get @s ppd.ViewRange
data modify storage ppd:zprivate data.ViewRange set string storage ppd:zprivate data.ViewRange 0 -1
tellraw @s ["",{"text":"Per-Player Displays >> ","color":"#C1EA53"},"Successfully changed your ViewRangeBuffer to ",{"score":{"name":"@s","objective":"ppd.ViewRangeBuffer"},"color":"yellow"}," (",{"nbt":"data.ViewRange","storage":"ppd:zprivate","color":"yellow"},")."]
