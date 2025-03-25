# Init
scoreboard players set #ppd.Init ppd 1
execute unless score #ppd.ShowLoadMessage ppd matches 0 run scoreboard players set #ppd.ShowLoadMessage ppd 1

scoreboard objectives add ppd.ViewRange dummy
scoreboard objectives add ppd.ID dummy
scoreboard objectives add ppd.Pos.0 dummy
scoreboard objectives add ppd.Pos.1 dummy
scoreboard objectives add ppd.Pos.2 dummy
scoreboard objectives add ppd.ViewRangeMultiplier trigger

data modify storage ppd:zprivate data.translation set value [0.0d,0.0d,0.0d]

# Tellraw
tellraw @a ["",{text:"Per-Player Displays >> ",color:"#C1EA53"},"Installed PPD (v1.2.0)"]
tellraw @a ["",{text:"Per-Player Displays >> ",color:"#C1EA53"},{text:"Click here",bold:true,color:"yellow",click_event:{action:"run_command",command:"/function ppd:debug/toggle_load_message"},hover_event:{action:"show_text",value:["/function ppd:debug/toggle_load_message"]}}," to toggle the load message"]
execute if score #ppd.ShowLoadMessage ppd matches 1 run tellraw @a ""
