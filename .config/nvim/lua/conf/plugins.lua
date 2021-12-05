--- install packer if unable to load
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system(
        {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

--- begin plugin config
return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    -- colours
    use('ishan9299/nvim-solarized-lua')
    -- speed up launch
    use('nathom/filetype.nvim')
    -- display buffers
    use('ap/vim-buftabline')
    -- use('nvim-lualine/lualine.nvim')
    -- fuzzy find
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }
    -- util
    use('easymotion/vim-easymotion')
    -- lsp
    use('neovim/nvim-lspconfig')
    -- completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-path',
            'hrsh7th/cmp-nvim-buffer',
        },
    }
    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
