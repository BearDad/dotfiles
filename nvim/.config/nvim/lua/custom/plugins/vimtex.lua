return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      -- ==============================
      -- Basic VimTeX settings
      -- ==============================
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_method = 'zathura' -- PDF viewer
      vim.g.tex_conceal = 'abdmg'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_syntax_conceal = {
        accents = true,
        ligatures = true,
        cites = true,
        fancy = true,
        spacing = true,
        greek = true,
        math_bounds = true,
        math_delimiters = true,
        math_fracs = true,
        math_super_sub = true,
        math_symbols = true,
        sections = true,
        styles = true,
      }

      -- ==============================
      -- Compiler setup with build folder
      -- ==============================
      -- out_dir (not a raw -outdir= option) so VimTeX knows where the PDF lands
      -- and can hand the right path to the viewer.
      vim.g.vimtex_compiler_latexmk = {
        executable = 'latexmk',
        out_dir = 'build', -- per-note build folder
        options = {
          '-pdf',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
        },
      }
    end,
  },
}
