# Update the display entity's view_range based on the player's movement speed
scoreboard players operation @s ppd.ViewRange = #ppd ppd.ViewRange
execute if score #ppd ppd.ViewRange matches 0 run return run data modify entity @s view_range set value 0.003f

execute if score #ppd ppd.ViewRange matches 1 run return run data modify entity @s view_range set value 0.005f
execute if score #ppd ppd.ViewRange matches 2 run return run data modify entity @s view_range set value 0.007f
execute if score #ppd ppd.ViewRange matches 3 run return run data modify entity @s view_range set value 0.012f

execute if score #ppd ppd.ViewRange matches 4 run return run data modify entity @s view_range set value 0.017f
execute if score #ppd ppd.ViewRange matches 5 run return run data modify entity @s view_range set value 0.0215f
data modify entity @s view_range set value 0.032f
