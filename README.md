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
2. Required data:
    - Display Entity: `{view_range:0.003f}`
    - Area Effect Cloud: `{Radius:0f,RadiusOnUse:-1f,Duration:2147483647,Owner:[<Your UUID>],Tags:["ppd"]}`
3. Set the display entity's `ppd.Pos.<0,1,2>` scores, scaled up by 10,000x.

**Example**:\
`summon minecraft:block_display ~ ~ ~ {block_state:{Name:"minecraft:iron_block"},view_range:0.003f,Passengers:[{id:"minecraft:area_effect_cloud",Radius:0f,RadiusOnUse:-1f,Duration:2147483647,Owner:[I;1101629270,-853851629,-1258987245,63230154],Tags:["ppd"]}]}`

## How it works
PPD teleports your display entities into your head and sets their `translation` transformation accordingly so their models still appear at the desired location. It also sets their `view_range` NBT optimally to ensure that nobody else can see them, while also avoiding flickering if you move too fast.

## Good to know
- There is a `ppd.ViewRangeMultiplier` trigger score that players can use to account for flickering during server lag or high ping. The higher it is set, the bigger the radius in which other players can see your display.
- Display entities will only be displayed in the dimension it's summoned in.
- Display entities will stay while the player is offline, but it won't be visible.
- Display entities will not display farther than 160 blocks away from the destination position.

## Caveats
- This data pack is affected by the `Entity Distance` graphics setting. The numbers (adjustable in `ppd:zprivate/display/view_range`) were made with an Entity Distance of 100% in mind. A lower setting may cause flickering, while a higher setting may allow you to see other players' displays from a greater distance.
- High ping or bad server performance may cause flickering. This can be counteracted by the user by running `/trigger ppd.ViewRangeMultiplier set ...`.
- If another player stands very close to you, they may be able to see your display entities.
- The display entities receive the light from your head position, so it may look off at times.
- PPD uses the translation field to achieve the per-player visibility. This means that all translations need to be combined with the marker's destination Pos. **Interpolated transformations are not possible!**
- The display entity's `Rotation` must not be changed. Use the `left_rotation` and `right_rotation` transformations instead.
- The display entities are not visible in F5.
- PPD doesn't work more than 100,000 blocks out in each axis.
- If the player is teleported to a far away chunk and it unloads before the display entities can teleport to the player, the entity can get stuck there, so the displays no longer show up for that player.

## Credit
From CMDred:
- **SilicatYT**

## License
As per the MIT License, you are allowed to redistribute, modify and use PPD as long as you provide credit for the original work.
