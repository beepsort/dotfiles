local nvim_lsp = require('lspconfig')
local servers = {'pyright'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach
    }
end

nvim_lsp.ccls.setup{
    filetypes = {"c", "cpp", "objc", "objcpp"}
}

nvim_lsp.rust_analyzer.setup{
   settings = {
     ['rust-analyzer'] = {
       diagnostics = {
         enable = false;
       }
     }
   }
 }

require('nvim-treesitter.configs').setup {
    ensure_installed = {'lua', 'python', 'bash', 'c', 'cpp', 'javascript', 'typescript', 'latex', 'java', 'rust'},
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

local lsp_sig_config = {}
require('lsp_signature').setup(lsp_sig_config)

local dap = require('dap')
require('dap-python').setup('./env/bin/python')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('NODEDEBUG2')},
}
-- requires lldb-vscode to be installed
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode-11',
    name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = {
  {
    -- ... the previous config goes here ...,
    initCommands = function()
      -- Find out where to look for the pretty printer Python module
      local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

      local commands = {}
      local file = io.open(commands_file, 'r')
      if file then
        for line in file:lines() do
          table.insert(commands, line)
        end
        file:close()
      end
      table.insert(commands, 1, script_import)

      return commands
    end,
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
