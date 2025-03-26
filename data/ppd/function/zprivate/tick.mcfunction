# Assign IDs (Not using an advancement because of the uninstalling process)
execute as @a unless score @s ppd.ID matches 1.. run function ppd:zprivate/events/new_player

# ViewRangeBuffer Setting
execute as @a unless score @s ppd.ViewRangeMultiplier matches 0 run function ppd:zprivate/settings/change_view_range
scoreboard players enable @a ppd.ViewRangeMultiplier

# Logic
execute as @e[type=minecraft:item_display,scores={ppd.ID=1..},sort=nearest] at @s run function ppd:zprivate/display/main
execute as @e[type=minecraft:block_display,scores={ppd.ID=1..},sort=nearest] at @s run function ppd:zprivate/display/main
execute as @e[type=minecraft:text_display,scores={ppd.ID=1..},sort=nearest] at @s run function ppd:zprivate/display/main
tp 80-0-0-0-80 0.0 0.0 0.0
scoreboard players set #ppd.Current ppd.ID -1

# Schedule
schedule function ppd:zprivate/tick 1t
