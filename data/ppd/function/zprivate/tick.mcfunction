# ViewRangeBuffer Setting
scoreboard players enable @a ppd.ViewRangeBuffer
execute as @a unless score @s ppd.ViewRange = @s ppd.ViewRangeBuffer run function ppd:zprivate/settings/change_view_range

# Assign IDs (Not using an advancement because of the uninstalling process)
execute as @a unless score @s ppd.ID matches 1.. store result score @s ppd.ID run scoreboard players add #ppd ppd.ID 1

# Logic
execute as @e[type=minecraft:area_effect_cloud,tag=ppd,sort=nearest] at @s run function ppd:zprivate/display/main
tp 80-0-0-0-80 0.0 0.0 0.0
scoreboard players set #ppd.Current ppd.ID -1

# Schedule
schedule function ppd:zprivate/tick 1t
