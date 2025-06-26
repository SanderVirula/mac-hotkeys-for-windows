; ─── AutoHotkey Mac-Style Modifier Script ─────────────────────────────
#NoEnv
SendMode Input
SetBatchLines, -1
#SingleInstance, Force
#MaxHotkeysPerInterval, 1000

; ─── Quick Exit ───────────────────────────────────────────────────────
^!q::ExitApp  ; Ctrl+Alt+Q quits the script

; ─── Restart Script ───────────────────────────────────────────────────────
^!r::Reload   ; Ctrl+Alt+R

; ─── Swallow Standalone Modifiers ────────────────────────────────────
$LAlt::Return
$LAlt Up::Return

; ─── Alt+N → New Window / Alt+Shift+N → Incognito ────────────────────
LAlt & n::
    if GetKeyState("Shift", "P")
        SendInput, ^+n    ; Ctrl+Shift+N
    else
        SendInput, ^n     ; Ctrl+N
return

; ─── Alt+Space → Forward to PowerToys Run ───────────────────────────
LAlt & Space::
    SendInput, {Alt down}{Space}{Alt up}
return

; ─── Alt+V / Alt+Shift+V Paste Handling ───────────────────────────────
LAlt & v::
    if GetKeyState("Shift", "P")
        SendInput, ^+v    ; plain-text paste
    else
        SendInput, ^v     ; regular paste (Explorer files)
return

; ─── Other Alt-based “Command” Shortcuts ─────────────────────────────
LAlt & c::SendInput, ^c    ; Copy
LAlt & x::SendInput, ^x    ; Cut
LAlt & z::SendInput, ^z    ; Undo
LAlt & a::SendInput, ^a    ; Select All
LAlt & s::SendInput, ^s    ; Save
LAlt & f::SendInput, ^f    ; Find
LAlt & t::SendInput, ^t    ; New Tab
LAlt & w::SendInput, ^w    ; Close Tab/Window
LAlt & o::SendInput, ^o    ; Open

; ─── Word Selection & Deletion ───────────────────────────────────────
LAlt & Left::SendInput, ^+{Left}         ; select previous word
LAlt & Backspace::                      ; delete previous word
    SendInput, ^+{Left}{Del}
return

; ─── Win-based Angle Bracket Shortcuts ──────────────────────────────
LWin & ,::SendInput, <    ; Win+, → <
LWin & .::SendInput, >    ; Win+. → >
LWin & -::SendInput, |    ; Win+- → |

; ─── Browser-style / Window navigation ─────────────────────────────
LAlt & Right::SendInput, ^{Right}   ; Alt+→ → Ctrl+Right (forward)
LAlt & Up::   SendInput, ^{Up}      ; Alt+↑ → Ctrl+Up    (scroll top)
LAlt & Down:: SendInput, ^{Down}    ; Alt+↓ → Ctrl+Down  (scroll bottom)

; ─── Pass Through AltGr ─────────────────────────────────────────────
; (Preserve Right-Alt for international characters)
RAlt::Send {RAlt}
RAlt Up::Send {RAlt Up}

; ─── End of Script ───────────────────────────────────────────────────