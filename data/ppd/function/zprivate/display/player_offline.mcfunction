# No player found in same dimension: Reduce view_range and tag the entity so it doesn't do this in the next tick as well
tag @s add ppd.NoPlayer
tag @a[tag=ppd.Origin,limit=1] remove ppd.Origin
data modify entity @s[tag=!ppd.TooFar] view_range set value 0f
