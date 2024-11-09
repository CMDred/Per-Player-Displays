# Sub-Function, so the entity doesn't get stuck in an unloaded chunk
execute as 80-0-0-0-80 if entity @s[tag=ppd.Root] run function ppd:zprivate/display/tick
