# CUCoreLib 非官方电池修复版
**版本：** 1.0.5.1（基于官方 CUCoreLib 1.0.5 源码的本地修改）  
**性质：** 非官方修复 · 非正式发布 · 请作者审核前仅作临时使用

## 这是什么？
在官方 CUCoreLib **约 1.0.4 起**，用库注册的**自定义带电池物品**在：

- 进入下一层，或  
- 读档还原物品  时，
**电池电量/状态会丢失**（例如用到 98% 后进下一层，电量被重置或像电池消失）。

约 **1.0.3** 时该行为正常。本包在 1.0.5 源码上做了一处小改动，用于在换层/读档时**保留已保存的电池状态**。

## 改了什么？
**只改了一个文件：**
`Patches/CustomItemSerializationPatches.cs`  
（方法：`InstantiateSavedItem`）

| 原来 | 现在 |
|------|------|
| 读档/换层实例化时调用 `PrepareInstantiatedObject` | **不再调用** |
| 会标记「待初始化电池」并按物品**定义默认值**重写电量 | **不**强制重新初始化电池 |
| 存档里的电量被覆盖 | 尽量保留存档中的电量与电池状态 |

**未改动的部分：**
- 新生成物品（首次刷出）仍按定义正常初始化电池  
- 其余功能、API、依赖关系与官方 1.0.5 一致（仅上述还原路径）

**版本号：** `1.0.5.1`（BepInEx 要求纯数字版本；不能使用带文字的版本字符串）

## 安装
1. 关闭游戏  
2. 备份原文件（若有）：  
   `BepInEx/plugins/CUCoreLib.dll` → 例如改名为 `CUCoreLib.dll.bak`  
3. 将本压缩包中的 `CUCoreLib.dll` 放入：  
   `...\Casualties Unknown Demo\BepInEx\plugins\`  
4. 确保 plugins 里**只有一份** CUCoreLib.dll  
5. 启动游戏，在 `BepInEx/LogOutput.log` 中应能看到 CUCoreLib 正常加载，且**没有**  
   `version is invalid` 或 `missing dependencies: net.cucorelib`

## 如何确认修复生效
1. 获得/生成一个通过 CUCoreLib 注册的自定义带电池物品  
2. 使用至电量约 98%（非满电）  
3. 进入下一层（或按你平时会丢电量的方式读档）  
4. 检查该物品电量是否仍约 98%

## 免责声明
- 修改者**不熟悉专业编程**，此修复来自对源码的对照排查与本地测试，**不能保证**在所有模组组合、多人、QoL 特殊读档路径下都完全正确。  
- **非正式官方版本**。若官方日后发布同类修复，请改回官方包。  
- 使用前请自行备份存档与原 DLL；因使用本包造成的问题需自行承担。  
- 欢迎把问题报告与改动思路反馈给 [CUCoreLib 原作者](https://github.com/jimmyking9999999/CUCoreLib)，由作者决定是否合入正式版。

## 技术说明（给开发者）
读档路径中 `InstantiateSavedItem` 若调用 `PrepareInstantiatedObject`，会执行 `MarkPendingBatteryInitialization`。随后 `ApplyCustomItemRuntime` 中：

```text
initializeBatteryState = createdBattery || ConsumePendingBatteryInitialization(...)
ApplyBatteryProperties(..., initializeState: true)
```
会在 `initializeState == true` 时用定义的 `StartCharge` / `SpawnWithBattery` 等覆盖运行时电池字段，导致存档电量丢失。
本修复仅在**存档还原**路径避免标记 pending battery；**新生成**路径仍走 `PrepareInstantiatedObject`。

=====================================================================================================================

## English 

# CUCoreLib Unofficial Battery Fix Build
**Version:** 1.0.5.1 (based on the official CUCoreLib 1.0.5 source code)  
**Status:** Unofficial fix · Unofficial release · For temporary use pending author review

## What is this?
Starting around official CUCoreLib **1.0.4**, **custom battery-powered items registered through the library** may:

- lose their battery charge/state when entering the next layer, or
- lose their battery state when restoring a save.

For example, if an item has been used down to 98% charge, entering the next layer may reset its charge or make it appear as if the battery has disappeared.

This behavior worked correctly around **1.0.3**.

This build makes one small change to the 1.0.5 source code to preserve the saved battery state when changing layers or restoring a save.

## What was changed?
**Only one file was modified:**

`Patches/CustomItemSerializationPatches.cs`  
(Method: `InstantiateSavedItem`)

| Before | After |
|------|------|
| `PrepareInstantiatedObject` was called when instantiating an item during save restoration/layer transition | **No longer called** |
| The item was marked for "pending battery initialization" and its charge was rewritten using the item's defined default values | Battery initialization is **not** forcibly performed again |
| The battery charge saved in the save file could be overwritten | The saved battery charge and state are preserved whenever possible |

### What was not changed
- Newly spawned items still initialize their batteries normally according to their definitions.
- All other functionality, APIs, and dependencies remain the same as official CUCoreLib 1.0.5.
- Only the save restoration path was modified.

**Version:** `1.0.5.1`  
(BepInEx requires a purely numeric version number; version strings containing text cannot be used.)

## Installation
1. Close the game.
2. Back up the original file, if present:
   `BepInEx/plugins/CUCoreLib.dll`  
   For example, rename it to:
   `CUCoreLib.dll.bak`
3. Place the `CUCoreLib.dll` from this package into:
   `...\Casualties Unknown Demo\BepInEx\plugins\`
4. Make sure there is **only one** `CUCoreLib.dll` in the `plugins` folder.
5. Start the game and check `BepInEx/LogOutput.log`.
   CUCoreLib should load normally, and there should be no errors such as:
   - `version is invalid`
   - `missing dependencies: net.cucorelib`

## How to verify that the fix works
1. Obtain or spawn a custom battery-powered item registered through CUCoreLib.
2. Use the item until its battery charge is around 98% (not fully charged).
3. Enter the next layer, or restore a save using whatever method normally causes the battery charge to be lost.
4. Check whether the item's battery charge is still around 98%.

## Disclaimer
- The person who made this modification is **not a professional programmer**. This fix was made through source-code comparison, investigation, and local testing. It **cannot be guaranteed** to work correctly with every combination of mods, multiplayer configurations, or special QoL save/restore paths.
- This is an **unofficial build**. If the official CUCoreLib releases a similar fix in the future, please switch back to the official version.
- Please back up your save files and the original DLL before using this build. Any problems caused by using this build are your own responsibility.
- Bug reports and the reasoning behind this modification are welcome to be shared with the [CUCoreLib original author](https://github.com/jimmyking9999999/CUCoreLib). The author can then decide whether the fix should be incorporated into an official release.

---

## Technical Details (For Developers)

During save restoration, if `InstantiateSavedItem` calls `PrepareInstantiatedObject`, it executes `MarkPendingBatteryInitialization`.

Then, inside `ApplyCustomItemRuntime`:
```text
initializeBatteryState = createdBattery || ConsumePendingBatteryInitialization(...)
ApplyBatteryProperties(..., initializeState: true)