
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
      }
    },
 }
