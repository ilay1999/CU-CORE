# Changelog

All players in co-op need the same version (see README).

## 1.0.0 — 2026-10-28
First release.

- 9 steel pieces (armet, cuirass, pauldrons, vambraces, gauntlets, cuisses, greaves, sabatons, gambeson), 8 titanium pieces, steel and titanium longswords.
- Extra protection against blades, bites and spikes: steel 85–92%, titanium 99%. Native armor against everything else. Worn pieces protect less.
- Side effects scale with worn armor weight: speed, stamina cost and regen, heat while moving (capped near 40 °C), louder steps, spiders notice you earlier.
- Steel: loot from human corpses and broken crates on any layer, traders, crafting from scrap panels + biochem. Titanium: crafting only, from the steel piece + titanium. Repair recipes for every item (+50%).
- Saves keep armor and wear. Removing the mod does not break saves.
- Co-op with Together 5.1.5: the host checks mod version and settings hash on connect.
- All numbers and recipes in the config; texts in `Lang/EN.json`; Russian translation (`Lang/RU.json`, `[Interface] Language = RU`); sprites in `assets/`; console `spawn` hints.
- Release defaults: debug spawn keys, the data dump and the damage/effects logs are off (see `[Debug]`).

## Development builds (0.x, tested in co-op, stage by stage)
- 0.10.x — saves (mod items moved to the end of the save list, mod recipes stored separately), `Lang/EN.json`, console hints.
- 0.9.x — crafting, repair, loot, traders; prices brought to the game's scale; recipes from scrap panels + biochem; swords got the hammering quality.
- 0.8.x — side effects (speed, stamina, heat, noise); hunger effect removed after testing; heat safety cap.
- 0.7.0 — generated placeholder sprites, PNG override, F7 reload.
- 0.6.0 — titanium set and titanium longsword.
- 0.5.0 — steel longsword.
- 0.4.0 — full steel set, durability doubled.
- 0.3.0 — protection against blades and bites, wear.
- 0.2.0 — first item (helmet).
- 0.1.0 — plugin skeleton, co-op version/settings check.
