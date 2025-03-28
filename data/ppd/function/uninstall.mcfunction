# Check if the 80-0-0-0-80 UUID is occupied by something else
execute as 80-0-0-0-80 if entity @s[tag=ppd.Root] run kill @s

# Check if it's installed
scoreboard objectives add ppd.Uninstall dummy
execute if score #ppd.Init ppd matches 1 run scoreboard players set #ppd.Init ppd.Uninstall 1
execute unless score #ppd.Init ppd.Uninstall matches 1 run tellraw @a [{text:"Per-Player Displays >> ",color:"#C1EA53"},{text:"⚠ Could not uninstall PPD. Is it installed?",color:"red"}]
execute unless score #ppd.Init ppd.Uninstall matches 1 run return run scoreboard objectives remove ppd.Uninstall
scoreboard objectives remove ppd.Uninstall

# Tellraw
tellraw @s ["",{text:"Per-Player Displays >> ",color:"#C1EA53"},"Uninstalled PPD (v1.3.0)"]

# Remove scoreboards & data storages
scoreboard objectives remove ppd
scoreboard objectives remove ppd.ViewRange
scoreboard objectives remove ppd.ViewRangeMultiplier
scoreboard objectives remove ppd.ID
scoreboard objectives remove ppd.Pos.x
scoreboard objectives remove ppd.Pos.y
scoreboard objectives remove ppd.Pos.z

scoreboard players reset #ppd
scoreboard players reset #ppd.Init
scoreboard players reset #ppd.Current
scoreboard players reset #ppd.ShowLoadMessage
scoreboard players reset #ppd.Online
scoreboard players reset #ppd.Success
scoreboard players reset #ppd.Scale
scoreboard players reset * ppd.ID
scoreboard players reset * ppd.ViewRange
scoreboard players reset * ppd.ViewRangeMultiplier

data remove storage ppd:zprivate data

# Stop the tick function
schedule clear ppd:zprivate/tick
