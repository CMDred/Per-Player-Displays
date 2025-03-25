# Init
scoreboard objectives add ppd dummy
execute unless score #ppd.Init ppd matches 1 run function ppd:zprivate/init

# Tellraw
execute if score #ppd.ShowLoadMessage ppd matches 1 run tellraw @a ["",{text:"Per-Player Displays >> ",color:"#C1EA53"},{text:"Made by SilicatYT",click_event:{action:"open_url",url:"https://www.youtube.com/BluesProductionTeam"},hover_event:{action:"show_text",value:[{text:"YouTube: ",color:"dark_aqua"},{text:"CMDred",color:"white"}]}},"\n",{text:"Per-Player Displays >> ",color:"#C1EA53"},"Get the latest updates: ",{text:"Modrinth",color:"#5491F7",click_event:{action:"open_url",url:"https://modrinth.com/datapack/per-player-displays"},hover_event:{action:"show_text",value:["Open page"]}},", ",{text:"GitHub",color:"#5491F7",click_event:{action:"open_url",url:"https://github.com/CMDred/per-player-displays"},hover_event:{action:"show_text",value:["Open page"]}}]

# Tick
function ppd:zprivate/tick

# Marker entity
execute as 80-0-0-0-80 if entity @s[tag=ppd.Root] run return 0
execute store success score #ppd.Success ppd run summon minecraft:marker 0.0 0.0 0.0 {UUID:[I;128,0,0,128],Tags:["ppd.Root"]}
execute if score #ppd.Success ppd matches 0 run tellraw @a [{text:"Per-Player Displays >> ",color:"#C1EA53"},{text:"⚠ UUID Conflict: An entity with the UUID [I;128,0,0,128] already exists. Please remove it or change the UUID in this pack, then reload.",color:"red"}]
