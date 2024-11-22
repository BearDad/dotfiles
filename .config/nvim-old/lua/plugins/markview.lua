return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  ft = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",

    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local presets = require("markview.presets").headings

    require("markview").setup({
      modes = { "n", "i", "no", "c" },
      hybrid_modes = { "i" },
      filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
      buf_ignore = {},
      max_length = 99999,
      restore_conceallevel = true,
      restore_concealcursor = false,
    })
    require("markview").setup({
      headings = presets.marker,
      code_blocks = {
        enable = true,

        style = "language",
        hl = "dark",

        position = "overlay",

        min_width = 60,
        pad_amount = 3,

        language_names = {
          { "py", "python" },
          { "cpp", "C++" },
        },
        language_direction = "right",

        sign = true,
        sign_hl = nil,
      },
      inline_code = {},

      block_quote = {
        enable = true,
        default = {},
        callouts = {},
      },

      horizontal_rule = {},

      hyperlink = {},
      image = {},

      table = {

        table_hls = { "rainbow1" },
        use_virt_lines = false,
      },
      list_item = {
        marker_plus = {
          add_padding = false,
          marker = "•",
          marker_hl = "rainbow2",
        },
        marker_minus = {
          add_padding = false,
          marker = "•",
          marker_hl = "rainbow2",
        },
        marker_star = {
          add_padding = false,

          marker = "•",
          marker_hl = "rainbow2",
        },
      },
      checkbox = {},
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "nc"
        end,
      },
      html = {
        enable = true,

        --- Tag renderer for tags that have an
        --- opening & closing tag.
        tags = {
          enable = true,

          --- Default configuration
          default = {
            --- When true, the tag is concealed.
            ---@type boolean
            conceal = false,

            --- Highlight group for the text inside
            --- of the tag
            ---@type string?
            hl = nil,
          },

          --- Configuration for specific tag(s).
          --- The key is the tag and the value is the
          --- used configuration.
          configs = {
            b = { conceal = true, hl = "Bold" },
            u = { conceal = true, hl = "Underlined" },
          },
        },

        --- HTML entity configuration
        entities = {
          enable = true,

          --- Highlight group for the rendered entity.
          ---@type string?
          hl = nil,
        },
      },
      latex = {
        enable = true,

        --- Bracket conceal configuration.
        --- Shows () in specific cases
        brackets = {
          enable = true,

          --- Highlight group for the ()
          ---@type string
          hl = "@punctuation.brackets",
        },

        --- LaTeX blocks renderer
        block = {
          enable = true,

          --- Highlight group for the block
          ---@type string
          hl = "Code",

          --- Virtual text to show on the bottom
          --- right.
          --- First value is the text and second value
          --- is the highlight group.
          ---@type string[]
          text = { " LaTeX ", "Special" },
        },

        --- Configuration for inline LaTeX maths
        inline = {
          enable = true,
        },

        --- Configuration for operators(e.g. "\frac{1}{2}")
        operators = {
          enable = true,
          configs = {
            sin = {
              --- Configuration for the extmark added
              --- to the name of the operator(e.g. "\sin").
              ---
              --- see `nvim_buf_set_extmark()` for all the
              --- options.
              ---@type table
              operator = {
                conceal = "",
                virt_text = { { "𝚜𝚒𝚗", "Special" } },
              },

              --- Configuration for the arguments of this
              --- operator.
              --- Item index is used to apply the configuration
              --- to a specific argument
              ---@type table[]
              args = {
                {
                  --- Extmarks are only added
                  --- if a config for it exists.

                  --- Configuration for the extmark
                  --- added before this argument.
                  ---
                  --- see `nvim_buf_set_extmark` for more.
                  before = {},

                  --- Configuration for the extmark
                  --- added after this argument.
                  ---
                  --- see `nvim_buf_set_extmark` for more.
                  after = {},

                  --- Configuration for the extmark
                  --- added to the range of text of
                  --- this argument.
                  ---
                  --- see `nvim_buf_set_extmark` for more.
                  scope = {},
                },
              },
            },
          },
        },

        --- Configuration for LaTeX symbols.
        symbols = {
          enable = true,

          --- Highlight group for the symbols.
          ---@type string?
          hl = "@operator.latex",

          --- Allows adding/modifying symbol definitions.
          overwrite = {
            --- Symbols can either be strings or functions.
            --- When the value is a function it receives the buffer
            --- id as the parameter.
            ---
            --- The resulting string is then used.
            ---@param buffer integer.
            today = function(buffer)
              return os.date("%d %B, %Y")
            end,
          },

          --- Create groups of symbols to only change their
          --- appearance.
          groups = {
            {
              --- Matcher for this group.
              ---
              --- Can be a list of symbols or a function
              --- that takes the symbol as the parameter
              --- and either returns true or false.
              ---
              ---@type string[] | fun(symbol: string): boolean
              match = { "lim", "today" },

              --- Highlight group for this group.
              ---@type string
              hl = "Special",
            },
          },
        },

        subscript = {
          enable = true,

          hl = "MarkviewLatexSubscript",
        },

        superscript = {
          enable = true,

          hl = "MarkviewLatexSuperscript",
        },
      },
    })
    vim.cmd("Markview enableAll")
  end,
}
