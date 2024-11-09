# Per-Player Displays
A Minecraft Data Pack library that lets you create display entities that are only visible to one player.\
For inquiries, please contact **@silicatYT** on Discord.\
\
Download: [Modrinth](https://modrinth.com/datapack/per-player-displays)\
Source code: [GitHub](https://github.com/CMDred/Per-Player-Displays)

## How to use
A detailed description can be found in the `ppd:how_to` function.
1. Create the following entity stack:
    - Display Entity
    - Area Effect Cloud
    - Marker
2. Required data:
    - Display Entity: `{view_range:0.003f}`
    - Area Effect Cloud: `{Radius:0f,RadiusOnUse:-1f,Duration:2147483647,Owner:[<Your UUID>],Tags:["ppd"]}`
    - Marker: `{data:{Pos:[<Destination position of the display entity>]}}`

**Example**:\
`summon minecraft:block_display ~ ~ ~ {block_state:{Name:"minecraft:iron_block"},view_range:0.003f,Passengers:[{id:"minecraft:area_effect_cloud",Radius:0f,RadiusOnUse:-1f,Duration:2147483647,Owner:[I;1101629270,-853851629,-1258987245,63230154],Tags:["ppd"]},{id:"minecraft:marker",data:{Pos:[0.0d,0.0d,0.0d]}}]}`

## How it works
PPD teleports your display entities into your head and sets their `translation` transformation accordingly so their models still appear at the desired location. It also sets their `view_range` NBT optimally to ensure that nobody else can see them, while also avoiding flickering if you move too fast.

## Good to know
- The display entity will only be displayed in the dimension it's summoned in.
- The display entity will stay while the player is offline, but it won't be visible.

## Caveats
- This data pack is affected by the `Entity Distance` graphics setting. The numbers (adjustable in `ppd:zprivate/display/view_range`) were made with an Entity Distance of 100% in mind. A lower setting may cause flickering, while a higher setting may allow you to see other players' displays from a greater distance.
- High ping or bad server performance may cause flickering, as the display entities can't get teleported fast enough, causing the player to exit its `view_range` more often.
- If another player stands very close to you, they may be able to see your display entities.
- Player scales above 1.0 are currently not supported and may cause flickering when crouching and uncrouching.
- The display entities receive the light from your head position, so it may look off at times.
- PPD uses the translation field to achieve the per-player visibility. This means that all translations need to be combined with the marker's destination Pos. **Interpolated transformations are not possible!**
- The display entity's `Rotation` must not be changed. Use the `left_rotation` and `right_rotation` transformations instead.

## Credit
From CMDred:
- **SilicatYT**

## License
As per the MIT License, you are allowed to redistribute, modify and use PPD as long as you provide credit for the original work.
