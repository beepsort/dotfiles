local nvim_lsp = require('lspconfig')
local servers = {'pyright', 'tsserver', 'ccls', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach
    }
end

require('nvim-treesitter.configs').setup {
    ensure_installed = {'lua', 'python', 'bash', 'c', 'cpp', 'javascript', 'typescript', 'json', 'latex', 'java', 'rust'},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}

local cmp = require('cmp')
cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ behavior=cmp.ConfirmBehavior.Replace, select=true }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior=cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior=cmp.SelectBehavior.Select }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback() -- tab
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})
    }
}

local dap = require('dap')
require('dap-python').setup('./env/bin/python')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('NODEDEBUG2')},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
dap.configurations.typescript = dap.configurations.javascript;
