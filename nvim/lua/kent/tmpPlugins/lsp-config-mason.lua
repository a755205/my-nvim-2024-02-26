return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    --[[ https://github.com/williamboman/mason-lspconfig.nvim ]]
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
        }
      })
    end
  },
  {
    --[[ https://github.com/neovim/nvim-lspconfig ]]
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- ensure_installed 有的 lspconfig.[lang].setup({}) 要加上去
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})


      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      --  <leader>ca 可以告訴lsp 是不是要關掉提示
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

    end
  }
}
