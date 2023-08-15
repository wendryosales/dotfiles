return {
  opt = {
    clipboard = "unnamedplus", -- connection to the system clipboard
  },
  g = {
    clipboard = {
      name = "WayClip", -- For wayland in case of problem with wl-clipoard
      copy = {
        ['+'] = { "waycopy" },
        ['*'] = { "waycopy" },
      },
      paste = {
        ['+'] = { "waypaste" },
        ['*'] = { "waypaste" },
      },
      cache_enabled = 1,
    },
  },
}
