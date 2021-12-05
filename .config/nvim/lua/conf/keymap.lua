-- Key Mapping
local key_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {
        noremap = true,
        silent = true,
    })
end

-- Suspend with ctrl+f
key_mapper('i', '<C-f>', ':sus<cr>')
key_mapper('v', '<C-f>', ':sus<cr>')
key_mapper('n', '<C-f>', ':sus<cr>')

-- disable help button
key_mapper('', '<F1>', '<Esc>')
key_mapper('i', '<F1>', '<Esc>')

-- create splits
key_mapper('n', '<leader>wv', ':wincmd v<return>')
key_mapper('n', '<leader>ws', ':wincmd s<return>')

-- close split
key_mapper('n', '<leader>wq', ':wincmd q<return>')

-- Switch between splits
key_mapper('n', '<leader>ww', ':wincmd w<return>')
key_mapper('n', '<leader>wW', ':wincmd W<return>')
key_mapper('n', '<leader>WW', ':wincmd W<return>')

-- Toggle file tree
key_mapper('n', '<leader>op', ':NvimTreeToggle<CR>')

-- Telescope
key_mapper('n', '<leader>ff', ':lua require"telescope.builtin".find_files { previewer = false }<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
key_mapper('n', '<leader>gf', ':lua require"telescope.builtin".git_files { previewer = false }<CR>')
key_mapper('n', '<leader>gg', ':lua require"telescope.builtin".git_status()<CR>')

-- Lsp
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', '<leader>gh', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', '<leader>gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>')
key_mapper('n', '<leader>gf', ':lua vim.lsp.buf.formatting()<CR>')
key_mapper('n', '[d', ':lua vim.diagnostic.open_float()<CR>')
key_mapper('n', ']d', ':lua vim.diagnostic.open_float()<CR>')
key_mapper('n', '<leader>rr', ':lua vim.lsp.buf.rename()<CR>')
