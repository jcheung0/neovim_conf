
local wezterm = require 'wezterm';



return {
   font = wezterm.font 'Fira Code' ,
   font_size = 13.0,
   color_scheme = 'Gruvbox Dark Hard',
   mouse_bindings = {
      {
          event = { Down = { streak = 3, button = 'Left' } },
         action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
         mods = 'NONE',
      }
   },
   keys = {
       {
          key = 'd',
          mods = 'CMD',
          action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain'},
      },
      {
          key = "d",
          mods = "CMD|SHIFT",
          action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain'},
      },
      {
         key = "c",
         mods = "CMD",
         action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
      },
      { key = 'v', mods = 'CMD', action = wezterm.action.PasteFrom 'Clipboard' },
      { key = '[', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(-1) },
      { key = ']', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },
      { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    },
 }
