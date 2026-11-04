# Knight Armor — Casualties: Unknown

[Русский](#русский) · [English](#english)

---

## Русский

Стальные и титановые рыцарские латы и длинные мечи. Мод встраивает их в родную систему одежды, брони, крафта и торговли игры. Работает в одиночной игре и в коопе (мод **Together**).

### ⚠ Кооп: у всех одна и та же версия
У **всех игроков** должна стоять **одна и та же версия Knight Armor** с **одинаковыми игровыми настройками** (cfg). При подключении хост сверяет версию и настройки. Если они не совпадают или мода нет, игрок получит отказ с понятным текстом, например: *«This server requires the Knight Armor mod 1.0.0 (settings 1a2b3c4d)»*. Проще всего, чтобы хост раздал свой `com.knightarmor.cu.cfg`.

### Требования
- Casualties: Unknown (Demo, проверено на версии игры 7.0.1).
- [BepInEx 5.4.x](https://github.com/BepInEx/BepInEx/releases) для Unity Mono, x64 (проверено на 5.4.23.5).
- Для коопа — Together (CasualtiesMP) 5.1.5. Без него мод работает в одиночной игре.

### Установка
1. Распакуйте архив и положите папку `KnightArmor` в `BepInEx/plugins/` в папке игры. Должно получиться `BepInEx/plugins/KnightArmor/KnightArmor.dll`.
2. Запустите игру. В `BepInEx/config/` появится файл настроек `com.knightarmor.cu.cfg`.
3. **Русский язык.** В самой игре его нет, но у мода есть перевод. Откройте `com.knightarmor.cu.cfg` и поставьте в разделе `[Interface]` `Language = RU`: названия и описания предметов мода станут русскими. В коопе язык у игроков может быть разный.

### Что добавлено
**Стальной комплект** — 9 деталей: армет, кираса, наплечники, наручи, латные перчатки, набедренники, поножи, сабатоны и гамбезон под латы. Плюс **длинный меч**.
**Титановый комплект** — 8 деталей (гамбезон общий) и **титановый длинный меч**.

- **Защита.**
  - Латы хорошо держат клинки, укусы и шипы, титан почти неуязвим для них.
  - От пуль, падений и взрывов — обычная броня игры.
  - Открытые части тела остаются уязвимыми.
  - Изношенные латы защищают хуже.
- **Цена защиты.** Латы тяжёлые:
  - персонаж медленнее и быстрее устаёт;
  - сильнее греется на бегу;
  - громче шагает, пауки замечают его раньше.
  - Титан легче, поэтому эти эффекты слабее.
- **Мечи** бьют сильнее и дальше мачете, но медленнее. В крафте их можно использовать как молоток.
- **Где взять сталь:**
  - иногда находится у трупов людей и в разбитых ящиках, уже поношенной;
  - бывает у торговцев, но дорого;
  - крафтится из лома с молотком.
- **Титан** — только крафт: стальная деталь, титановые материалы и biochem. Нужен высокий интеллект.
- **Ремонт** — родные рецепты «Repair»: чинится самый изношенный предмет.
- **Сохранения.** Латы сохраняются вместе с износом. Если удалить мод, сохранение загрузится: игра предупредит о пропавших предметах, остальное останется на месте.
- **Консоль.** Все предметы есть в подсказках `spawn` (`spawn knight_helmet` и т. д.).

ID предметов: `knight_helmet`, `knight_cuirass`, `knight_pauldrons`, `knight_vambraces`, `knight_gauntlets`, `knight_cuisses`, `knight_greaves`, `knight_sabatons`, `knight_gambeson`, `knight_longsword`, `knight_ti_helmet`, `knight_ti_cuirass`, `knight_ti_pauldrons`, `knight_ti_vambraces`, `knight_ti_gauntlets`, `knight_ti_cuisses`, `knight_ti_greaves`, `knight_ti_sabatons`, `knight_ti_longsword`.

### Настройки
Все числа лежат в `BepInEx/config/com.knightarmor.cu.cfg`, у каждого — описание на английском и русском. Там же находятся:
- защита, вес, износ и цена каждой детали и меча;
- побочные эффекты;
- рецепты крафта и ремонта;
- лут и торговцы;
- поведение при подключении в коопе.

### Свои спрайты и языки
- **Спрайты.** PNG в `BepInEx/plugins/KnightArmor/assets/` (8 пикселей = 1 единица, центр картинки = центр конечности). Если файла нет, мод рисует простую заглушку. Клавиша `F7` подхватывает изменения без перезапуска.
- **Тексты** лежат в `Lang/EN.json` и `Lang/RU.json`. Для другого языка игры положите рядом файл с его кодом, например `zh-CN.json`.

### Удаление
Удалите папку `BepInEx/plugins/KnightArmor` (и по желанию cfg). Сохранения загрузятся без лат.

### Об авторстве
Мод сделан с помощью ИИ (Claude от Anthropic).

---

## English

Steel and titanium knight plate armor and longswords, built into the game's own clothing, armor, crafting and trading systems. Works in single player and in co-op (**Together** mod).

### ⚠ Co-op: everyone needs the same version
**All players** must have **the same Knight Armor version** with **the same gameplay settings** (cfg). On connect the host checks the version and the settings. A player with no mod, another version or other settings is refused with a clear message, e.g. *"This server requires the Knight Armor mod 1.0.0 (settings 1a2b3c4d)"*. The easiest way: the host shares their `com.knightarmor.cu.cfg`.

### Requirements
- Casualties: Unknown (Demo, tested on game version 7.0.1).
- [BepInEx 5.4.x](https://github.com/BepInEx/BepInEx/releases) for Unity Mono, x64 (tested on 5.4.23.5).
- For co-op: Together (CasualtiesMP) 5.1.5. Without it the mod works in single player.

### Installation
1. Unpack the archive and put the `KnightArmor` folder into `BepInEx/plugins/` in the game folder. You should get `BepInEx/plugins/KnightArmor/KnightArmor.dll`.
2. Start the game. The settings file `com.knightarmor.cu.cfg` appears in `BepInEx/config/`.
3. **Russian.** The game itself has no Russian, but the mod does. Set `Language = RU` in the `[Interface]` section of `com.knightarmor.cu.cfg` to see mod item names and descriptions in Russian. Players in co-op may use different languages.

### What's added
**Steel set**, 9 pieces: armet, cuirass, pauldrons, vambraces, gauntlets, cuisses, greaves, sabatons and a gambeson worn under the plates. Plus a **longsword**.
**Titanium set**, 8 pieces (the gambeson is shared), and a **titanium longsword**.

- **Protection.**
  - The plates stop blades, bites and spikes well; titanium is nearly immune to them.
  - Bullets, falls and explosions get the game's normal armor.
  - Uncovered body parts stay vulnerable.
  - Worn armor protects less.
- **The cost.** Plate is heavy:
  - you are slower and tire faster;
  - you heat up more while running;
  - your steps are louder, so spiders notice you earlier.
  - Titanium is lighter, so these effects are weaker.
- **Swords** hit harder and reach further than a machete, but swing slower. They also work as a hammer in crafting.
- **Getting steel:**
  - sometimes found, already worn, on human corpses and in broken crates;
  - sold by traders, at a high price;
  - crafted from scrap with a hammer.
- **Titanium** is craft-only: the steel piece, titanium materials and biochem. Needs high INT.
- **Repair** uses the native "Repair" recipes; the most worn item is repaired first.
- **Saves.** Armor is saved with its wear. If you remove the mod, the save still loads: the game warns about the missing items and keeps everything else.
- **Console.** All items are in the `spawn` hints (`spawn knight_helmet` and so on).

Item IDs: see the Russian section above (same list).

### Configuration
Every number is in `BepInEx/config/com.knightarmor.cu.cfg`, each with a description in English and Russian. It covers:
- protection, weight, wear and price of every piece and sword;
- side effects;
- crafting and repair recipes;
- loot and traders;
- what happens when someone joins in co-op.

### Custom sprites and languages
- **Sprites:** PNG files in `BepInEx/plugins/KnightArmor/assets/` (8 pixels = 1 unit, image center = limb center). A missing file gets a simple generated placeholder. The `F7` key picks up changes without a restart.
- **Texts** are in `Lang/EN.json` and `Lang/RU.json` (Russian: set `[Interface] Language = RU`). For another game language, add a file named after it, e.g. `zh-CN.json`.

### Uninstall
Delete `BepInEx/plugins/KnightArmor` (and the cfg if you like). Saves load without the armor.

### Credits / AI disclosure
This mod was made with the help of AI (Claude by Anthropic).
