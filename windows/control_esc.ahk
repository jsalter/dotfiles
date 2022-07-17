; This converts Left Control into a Control/Escape key.
; For AutoHotkey 1.1 (AutoHotkey_L): http://ahkscript.org
; Based on http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_Windows

#NoEnv

LControl::
Send {LControl Down}
KeyWait, LControl
Send {LControl Up}
if (A_PriorKey = "LControl")
  Send {Esc}
return
