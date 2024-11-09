$execute positioned $(DPos0) $(DPos1) $(DPos2) run tp 80-0-0-0-80 ^$(SPos0) ^$(SPos2) ^$(SPos1)
execute store success score #ppd.Success ppd run data modify entity @s transformation.translation set from entity 80-0-0-0-80 Pos

# Failsafe if the distance is too big
execute if score #ppd.Success ppd matches 0 run return run execute unless entity @s[tag=ppd.TooFar] run function ppd:zprivate/display/distance_fail
execute if entity @s[tag=ppd.TooFar] run function ppd:zprivate/display/distance_success
