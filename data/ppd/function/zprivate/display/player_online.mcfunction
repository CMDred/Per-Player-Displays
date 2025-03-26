# Player found in same dimension: Increase view_range and remove the tag
tag @s remove ppd.NoPlayer
data modify entity @s[tag=!ppd.TooFar] view_range set value 0.003f
