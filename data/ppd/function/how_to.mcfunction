################################################################################################################
##                               HOW TO SUMMON A PLAYER-SPECIFIC DISPLAY ENTITY                               ##
################################################################################################################
## 1. Create the following entity stack:                                                                      ##
##       Display Entity -> Area Effect Cloud -> Marker                                                        ##
## 2. Required data:                                                                                          ##
##       Display Entity: {view_range:0.003f}                                                                  ##
##       Area Effect Cloud: {Radius:0f,RadiusOnUse:-1f,Duration:2147483647,Owner:[<Your UUID>],Tags:["ppd"]}  ##
##       Marker: {data:{Pos:[<Destination position of the display entity>]}}                                  ##
##                                                                                                            ##
## Note:                                                                                                      ##
##    - The display entities receive the light from your head position, so it may look off at times.          ##
##    - If another player stands close inside you, they may be able to see your display entities.             ##
##    - PPD uses the translation field to achieve the per-player visibility. This means that all translations ##
##      need to be combined with the marker's destination Pos. Interpolated translations are not possible.    ##
##    - The display entity will only be displayed in the dimension it's summoned in.                          ##
##    - The display entity will stay while the player is offline, but it won't be visible.                    ##
################################################################################################################

# Example
# summon minecraft:block_display ~ ~ ~ {block_state:{Name:"minecraft:iron_block"},view_range:0.003f,Passengers:[{id:"minecraft:area_effect_cloud",Radius:0f,RadiusOnUse:-1f,Duration:2147483647,Owner:[I;1101629270,-853851629,-1258987245,63230154],Tags:["ppd"]},{id:"minecraft:marker",data:{Pos:[0.0d,0.0d,0.0d]}}]}

# Tellraw (Explanation)
tellraw @s ["",{"text":"Per-Player Displays >> ","color":"#C1EA53"},"How to use"]
tellraw @s " 1. Create the following entity stack:"
tellraw @s "       Display Entity -> Area Effect Cloud -> Marker"
tellraw @s " 2. Required data:"
tellraw @s ["       Display Entity: ",{"text":"{","color":"#F1D700"},{"text":"view_range:0.003f","color":"#DCDCAA"},{"text":"}","color":"#F1D700"}]
tellraw @s ["       Area Effect Cloud: ",{"text":"{","color":"#F1D700"},{"text":"Radius","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"0f","color":"#B5CEA8"},{"text":",","color":"#D4D4D4"},{"text":"RadiusOnUse","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"-1f","color":"#B5CEA8"},{"text":",\n                                ","color":"#D4D4D4"},{"text":"Duration","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"2147483647","color":"#B5CEA8"},{"text":",\n                                ","color":"#D4D4D4"},{"text":"Owner","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"[","color":"#DA70D6"},{"text":"<Your UUID>","color":"red"},{"text":"]","color":"#DA70D6"},{"text":",","color":"#D4D4D4"},{"text":"Tags","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"[","color":"#DA70D6"},{"text":"\"ppd\"","color":"#CE9178"},{"text":"]","color":"#DA70D6"},{"text":"}","color":"#F1D700"}]
tellraw @s ["       Marker: ",{"text":"{","color":"#F1D700"},{"text":"data","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"{","color":"#DA70D6"},{"text":"Pos","color":"#9CDCFE"},{"text":":","color":"#D4D4D4"},{"text":"[","color":"#1A9FFF"},{"text":"<Destination>","color":"red"},{"text":"]","color":"#1A9FFF"},{"text":"}","color":"#DA70D6"},{"text":"}","color":"#F1D700"}]
tellraw @s ["\n Useful information & Caveats:\n    See the description on ",{"text":"Modrinth","color":"#5491F7","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/per-player-displays"},"hoverEvent":{"action":"show_text","contents":["Open page"]}},", ",{"text":"GitHub","color":"#5491F7","clickEvent":{"action":"open_url","value":"https://github.com/CMDred/per-player-displays"},"hoverEvent":{"action":"show_text","contents":["Open page"]}}]
tellraw @s ["\n An example command can be found in the '",{"text":"ppd:how_to","color":"yellow"},"' function."]
