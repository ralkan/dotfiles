require("mason").setup({
  ensure_installed = { "debugpy" }
})
require("mason-null-ls").setup({
  ensure_installed = { "debugpy", "black", "isort" }
})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pylsp", "volar" }
})

local vim = vim
local null_ls = require("null-ls")
local lspconfig = require("lspconfig")

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.dartls.setup({
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  capabilities = capabilities,
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  -- root_dir = root_pattern("pubspec.yaml"),
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
  on_attach = on_attach,
})

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false, executable = "pylint" },
        flake8 = { enabled = false, config = "~/.flake8" },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
}

-- lspconfig.tsserver.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     completions = {
--       completeFunctionCalls = true
--     }
--   }
-- })

lspconfig.volar.setup {
  settings = {},
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript = {
      -- tsdk = '/path/to/.npm/lib/node_modules/typescript/lib'
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    }
  },
  on_attach = on_attach,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    formatting.black,
    formatting.isort,
    -- null_ls.builtins.diagnostics.flake8,
  },

  -- you can reuse a shared lspconfig on_attach callback here
  -- on_attach = function(client, bufnr)
  --     if client.supports_method("textDocument/formatting") then
  --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --         vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --                 -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
  --                 -- vim.lsp.buf.formatting_sync()
  --                 vim.lsp.buf.format({
  --                   async = false,
  --                   bufnr = bufnr,
  --                   -- Make sure only null-ls is doing the formatting!
  --                   filter = function(cl)
  --                     return cl.name == "null-ls"
  --                   end
  --                 })
  --             end,
  --         })
  --     end
  -- end,
})
