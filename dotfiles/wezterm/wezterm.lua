
local wezterm = require 'wezterm';
local act = wezterm.action

local os = require 'os'
local os_name = os.getenv("OS")

wezterm.log_info("hello wezterm")


local config = {
   font = wezterm.font 'FiraCode Nerd Font' ,
   font_size = 13.0,
   color_scheme = 'Vs Code Dark+ (Gogh)',
   mouse_bindings = {
      {
          event = { Down = { streak = 3, button = 'Left' } },
         action = act.SelectTextAtMouseCursor 'SemanticZone',
         mods = 'NONE',
      }
   },
   keys = {
       {
          key = 'd',
          mods = 'CMD',
          action = act.SplitHorizontal{ domain = 'CurrentPaneDomain'},
      },
      {
          key = "d",
          mods = "CMD|SHIFT",
          action = act.SplitVertical{ domain = 'CurrentPaneDomain'},
      },
      {
         key = "c",
         mods = "CTRL|SHIFT",
         action = act.CopyTo 'ClipboardAndPrimarySelection',
      },
      {
       key = 'LeftArrow',
       mods = 'CTRL|SHIFT',
       action = act.ActivatePaneDirection 'Left',
      },
      {
       key = 'RightArrow',
       mods = 'CTRL|SHIFT',
       action = act.ActivatePaneDirection 'Right',
      },
      {
       key = 'UpArrow',
       mods = 'CTRL|SHIFT',
       action = act.ActivatePaneDirection 'Up',
      },
      {
       key = 'DownArrow',
       mods = 'CTRL|SHIFT',
       action = act.ActivatePaneDirection 'Down',
      },
      { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
      { key = '[', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
      { key = ']', mods = 'CTRL', action = act.ActivateTabRelative(1) },
      { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },

    },
 }

 return config 
