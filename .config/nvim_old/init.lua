-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--require("supermaven-nvim").setup({
--  keymaps = {
--    accept_suggestion = "<Tab>",
--    clear_suggestion = "<C-]>",
--    accept_word = "<C-j>",
--  },
--  ignore_filetypes = { cpp = true },
--  color = {
--    suggestion_color = "#2f7b8f",
--    cterm = 244,
--  },
--  log_level = "info", -- set to "off" to disable logging completely
--  disable_inline_completion = false, -- disables inline completion for use with cmp
--  disable_keymaps = false, -- disables built in keymaps for more manual control
--  condition = function()
--    return false
--  end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
--})
--

require("rose-pine").setup({
  variant = "main", -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true, -- Handle deprecated options automatically
  },

  styles = {
    bold = true,
    italic = true,
    transparency = true,
  },

  groups = {
    border = "muted",
    link = "iris",
    panel = "surface",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    git_untracked = "subtle",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  },

  palette = {
    -- Override the builtin palette per variant
    moon = {
      base = "#18191a",
      overlay = "#363738",
    },
  },

  highlight_groups = {
    Comment = { fg = "foam" },
    VertSplit = { fg = "muted", bg = "muted" },
  },

  before_highlight = function(group, highlight, palette)
    -- Disable all undercurls
    -- if highlight.undercurl then
    --     highlight.undercurl = false
    -- end
    --
    -- Change palette colour
    -- if highlight.fg == palette.pine then
    --     highlight.fg = palette.foam
    -- end
  end,
})

vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
