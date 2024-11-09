# Init
scoreboard objectives add ppd dummy
execute unless score #ppd.Init ppd matches 1 run function ppd:zprivate/init

# Tellraw
execute if score #ppd.ShowLoadMessage ppd matches 1 run tellraw @a ["",{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"Made by SilicatYT","clickEvent":{"action":"open_url","value":"https://www.youtube.com/BluesProductionTeam"},"hoverEvent":{"action":"show_text","contents":[{"text":"YouTube: ","color":"dark_aqua"},{"text":"CMDred","color":"white"}]}},"\n",{"text":"Per-Player Displays >> ","color":"#C1EA53"},"Get the latest updates: ",{"text":"Modrinth","color":"#5491F7","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/per-player-displays"},"hoverEvent":{"action":"show_text","contents":["Open page"]}},", ",{"text":"GitHub","color":"#5491F7","clickEvent":{"action":"open_url","value":"https://github.com/CMDred/per-player-displays"},"hoverEvent":{"action":"show_text","contents":["Open page"]}}]

# Marker entity
execute as 80-0-0-0-80 unless entity @s[tag=ppd.Root] run tellraw @a [{"text":"Per-Player Displays >> ","color":"#C1EA53"},{"text":"⚠ UUID Conflict: An entity with the UUID [I;128,0,0,128] already exists. Please get rid of it or change the UUID in this pack, then reload.","color":"red"}]
execute unless entity 80-0-0-0-80 run summon minecraft:marker 0.0 0.0 0.0 {UUID:[I;128,0,0,128],Tags:["ppd.Root"]}