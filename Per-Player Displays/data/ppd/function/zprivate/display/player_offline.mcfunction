# No player found: Reduce view_range and tag the entity so it doesn't do this in the next tick as well
tag @s add ppd.NoPlayer
execute on vehicle run data modify entity @s view_range set value 0
execute on origin run tag @s remove ppd.Origin
