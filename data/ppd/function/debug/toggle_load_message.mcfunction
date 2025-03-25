# Toggle the load message
scoreboard players add #ppd.ShowLoadMessage ppd 1
execute unless score #ppd.ShowLoadMessage ppd matches 1 run scoreboard players set #ppd.ShowLoadMessage ppd 0

# Tellraw
execute if score #ppd.ShowLoadMessage ppd matches 0 run tellraw @s ["",{text:"Per-Player Displays >> ",color:"#99EAD6"},"Disabled the load message"]
execute if score #ppd.ShowLoadMessage ppd matches 1 run tellraw @s ["",{text:"Per-Player Displays >> ",color:"#99EAD6"},"Enabled the load message"]
