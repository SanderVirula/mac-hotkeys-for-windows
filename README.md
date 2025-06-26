# mac_like.ahk

A handy AutoHotkey script that makes Windows modifier keys and shortcuts behave more like macOS, while preserving Explorer/file-paste functionality and ISO-layout AltGr support.

---

## Table of Contents

1. [Installation](#installation)  
2. [Quick Start](#quick-start)  
3. [Features & Hotkeys](#features--hotkeys)  
   - [Global Controls](#global-controls)  
   - [Alt-based “Command” Shortcuts](#alt-based-command-shortcuts)  
   - [Paste Behavior (Alt+V)](#paste-behavior-altv)  
   - [New Window vs Incognito (Alt+N)](#new-window-vs-incognito-altn)  
   - [Word Selection & Deletion](#word-selection--deletion)  
   - [Browser-style Navigation](#browser-style-navigation)  
   - [Win-based Angle Brackets](#win-based-angle-brackets)  
   - [AltGr Pass-Through](#altgr-pass-through)  
4. [Optional Tweaks](#optional-tweaks)  
5. [License](#license)

---

## Installation

1. Download and install [AutoHotkey](https://www.autohotkey.com/) (the installer or portable ZIP).  
2. Save `mac_like.ahk` to a folder of your choice.  
3. (Optional) Create a shortcut in your **Startup** folder (`shell:startup`) so it launches on login.  
4. Double-click `mac_like.ahk` to run.  

---

## Quick Start

- **Ctrl + Alt + Q** → Quit the script  
- **Alt + V** → Paste (files in Explorer) or plain-text (everywhere else)  
- **Alt + N** → New window (Ctrl+N)  
- **Alt + Shift + N** → Incognito (Ctrl+Shift+N)  
- **Win + , / . / -** → `<` / `>` / `|`  

---

## Features & Hotkeys

### Global Controls

- `^!q::ExitApp`  
  > **Ctrl + Alt + Q** immediately exits the script.

- Standalone **Left Alt** and **Right Alt** are swallowed so they don’t open menus:
  ```ahk
  $LAlt::Return
  $LAlt Up::Return
  $RAlt::Return
  $RAlt Up::Return
  ```

### Alt-based “Command” Shortcuts

Mimics macOS ⌘ shortcuts using Left Alt (`LAlt`):

| Hotkey       | Sends           | Action               |
|--------------|-----------------|----------------------|
| `LAlt & c`   | `Ctrl + C`      | Copy                 |
| `LAlt & x`   | `Ctrl + X`      | Cut                  |
| `LAlt & z`   | `Ctrl + Z`      | Undo                 |
| `LAlt & a`   | `Ctrl + A`      | Select All           |
| `LAlt & s`   | `Ctrl + S`      | Save                 |
| `LAlt & f`   | `Ctrl + F`      | Find                 |
| `LAlt & t`   | `Ctrl + T`      | New Tab              |
| `LAlt & w`   | `Ctrl + W`      | Close Tab / Window   |
| `LAlt & o`   | `Ctrl + O`      | Open                 |

### Paste Behavior (Alt+V)

```ahk
LAlt & v::
    if WinActive("Explorer") 
        SendInput ^v      ; Explorer: Ctrl+V (files)
    else
        SendInput ^+v     ; Everywhere else: Ctrl+Shift+V (plain text)
return
```

- **Alt + V** →  
  - _In Explorer_: `Ctrl + V` → Paste files/folders  
  - _Elsewhere_: `Ctrl + Shift + V` → Plain-text paste

### New Window vs Incognito (Alt+N)

```ahk
LAlt & n::
    if GetKeyState("Shift","P")
        SendInput ^+n     ; Alt+Shift+N → Ctrl+Shift+N (Incognito)
    else
        SendInput ^n      ; Alt+N → Ctrl+N (New Window)
return
```

- **Alt + N** → New window  
- **Alt + Shift + N** → Incognito window

### Word Selection & Deletion

```ahk
LAlt & Left::SendInput ^+{Left}         ; Select previous word
LAlt & Backspace::                     ; Delete previous word
    SendInput ^+{Left}{Del}
return
```

- **Alt + ←** → Select previous word  
- **Alt + Backspace** → Select & delete previous word

### Browser-style Navigation

```ahk
LAlt & Right::SendInput ^{Right}   ; Alt+→ → forward
LAlt & Up::   SendInput ^{Up}      ; Alt+↑ → scroll top
LAlt & Down:: SendInput ^{Down}    ; Alt+↓ → scroll bottom
```

### Win-based Angle Brackets

```ahk
LWin & ,::SendInput <     ; Win+, → <
LWin & .::SendInput >     ; Win+. → >
LWin & -::SendInput |     ; Win+- → |
```

### AltGr Pass-Through

```ahk
RAlt::Send {RAlt}
RAlt Up::Send {RAlt Up}
```

- Right Alt (AltGr) remains unchanged so you can type international characters.

---

## Optional Tweaks

- **Disable standalone Win** (prevent Start menu):  
  ```ahk
  $LWin::Return
  $LWin Up::Return
  ```
- **Context-sensitive mappings** (only in certain apps):  
  ```ahk
  #If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe Code.exe")
    ; … hotkeys …
  #If
  ```
- **Reload script**:  
  ```ahk
  ^!r::Reload   ; Ctrl+Alt+R
  ```

---

## License

This script is released into the public domain. Use and modify freely!
