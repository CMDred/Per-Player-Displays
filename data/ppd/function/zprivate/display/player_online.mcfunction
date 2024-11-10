# Player found in same dimension: Increase view_range and remove the tag
tag @s remove ppd.NoPlayer
execute on vehicle run data modify entity @s[tag=!ppd.TooFar] view_range set value 0.003f
