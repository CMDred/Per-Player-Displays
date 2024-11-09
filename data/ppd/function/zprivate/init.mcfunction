# Init
scoreboard players set #ppd.Init ppd 1
execute unless score #ppd.ShowLoadMessage ppd matches 0 run scoreboard players set #ppd.ShowLoadMessage ppd 1

scoreboard objectives add ppd.ViewRange dummy

# Tellraw
tellraw @a ["",{"text":"Per-Player Displays >> ","color":"#C1EA53"},"Installed PPD (v1.0.2)"]
tellraw @a ["",{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"Click here","bold":true,"color":"yellow","clickEvent":{"action":"run_command","value":"/function ppd:debug/toggle_load_message"},"hoverEvent":{"action":"show_text","contents":["/function ppd:debug/toggle_load_message"]}}," to toggle the load message"]
execute if score #ppd.ShowLoadMessage ppd matches 1 run tellraw @a ""
