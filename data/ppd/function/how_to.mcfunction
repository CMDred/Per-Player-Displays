# Tellraw (Explanation)
tellraw @s ["",{text:"Per-Player Displays >> ",color:"#C1EA53"},"How to use"]
tellraw @s [" 1. Summon a display entity"]
tellraw @s [" 2. Set its scores:"]
tellraw @s ["    • ",{text:"ppd.Pos.",color:"yellow"},{text:"<x/y/z>",color:"red"},": Where it should appear (Scale: 10,000x)"]
tellraw @s ["    • ",{text:"ppd.ID",color:"yellow"},": The ID of the player it should be visible for"]
tellraw @s ["      (The ID is automatically given to the player)"]
tellraw @s ["\n Useful information & caveats:\n    See the description on ",{text:"Modrinth",color:"#5491F7",click_event:{action:"open_url","url":"https://modrinth.com/datapack/per-player-displays"},hover_event:{action:"show_text",value:["Open page"]}},", ",{text:"GitHub",color:"#5491F7",click_event:{action:"open_url",url:"https://github.com/CMDred/per-player-displays"},hover_event:{action:"show_text",value:["Open page"]}}]
