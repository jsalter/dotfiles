; This converts CapsLock into a Control/Escape key.
; For AutoHotkey 1.1 (AutoHotkey_L): http://ahkscript.org 
; Copied from http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_Windows

#NoEnv
SetCapsLockState, AlwaysOff

CapsLock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if (A_PriorKey = "CapsLock")
  Send {Esc}
return
