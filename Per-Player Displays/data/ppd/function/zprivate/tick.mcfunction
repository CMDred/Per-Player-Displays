# Failsafe if UUID is already occupied
execute as 80-0-0-0-80 unless entity @s[tag=ppd.Root] run return 0

# Logic
execute as @e[type=minecraft:area_effect_cloud,tag=ppd] run function ppd:zprivate/display/main
tp 80-0-0-0-80 0.0 0.0 0.0
