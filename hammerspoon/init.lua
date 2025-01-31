local log = hs.logger.new('init.lua', 'debug')

-- Use Control+Option+` to reload Hammerspoon config
hs.hotkey.bind({"control", "option"}, "`", nil, function()
  hs.reload()
end)

keyUpDown = function(modifiers, key)
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

hs.hotkey.bind({"cmd", "shift"}, "c", nil, function()
  local linkUrl = hs.pasteboard.getContents()

  -- Copy the currently selected text to use as the link text
  keyUpDown({'cmd'}, 'c')

  hs.timer.doAfter(0.2, function()
    local linkText = hs.pasteboard.getContents()
    local markdown = '[' .. linkText .. '](' .. linkUrl .. ')'
    hs.pasteboard.setContents(markdown)
  end)
end)

hs.loadSpoon("SpoonInstall")

-- Reconfigure the Dock by running HiDock
reconfigDock = function(_)
  -- log.d('Running HiDock')
  hs.urlevent.openURLWithBundle("hidock://run")
end

spoon.SpoonInstall:andUse(
  "USBDeviceActions",
  {
    config = {
      devices = {
        ["Kinesis Classic/Advantage/Contoured"] = { fn = reconfigDock }
      }
    },
    start = true
  }
)
