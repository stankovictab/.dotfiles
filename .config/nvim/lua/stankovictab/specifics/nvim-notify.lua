-- Configuration for nvim-notify, which Noice can also use

require("notify").setup({
    require("notify")._config(), -- TODO: ? what
    -- background_colour = "#ff0f80",
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "wrapped-compact", -- default, minimal, simple, compact, wrapped-compact
    stages = "slide", -- Animation style - "fade", "slide", "fade_in_slide_out", "static"
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 5000,
    top_down = true
})

vim.notify = require("notify")
