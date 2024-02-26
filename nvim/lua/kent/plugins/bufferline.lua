return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "*",
  opts = {
    options = {
      --[[ mode = "buffers", -- set to "tabs" to only show tabpages instead ]]
      --[[ diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc" ]]
      diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
      --[[ separator_style = "slant",  --  "slant" | "thick" | "thin" | { 'any', 'any' }, ]]
      --[[ indicator = { ]]
      --[[   icon = '▎', -- this should be omitted if indicator style is not 'icon' ]]
      --[[   style =  'none' , ]]
      --[[ }, ]]
      git = {
        enable = true,
      },
      offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          --[[ separator = true -- use a "true" to enable the default, or set your own character ]]
          text_align = "center"
      }
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      }
    }
  }
}
