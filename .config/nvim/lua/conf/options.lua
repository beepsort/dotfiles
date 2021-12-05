vim.g.mapleader = " "
local o = vim.opt
o.ts=4
o.tabstop=4
o.shiftwidth=4
o.softtabstop=4
o.expandtab=true
o.fenc='utf-8'
o.textwidth=120
o.autoindent=true
o.smartindent=true
o.backspace={'indent','eol','start'}
o.smartcase=true
o.showmatch=true
o.formatoptions='lcqj'
o.lbr=true
-- o.ofu=syntaxcomplete#Complete
o.virtualedit={'block','onemore'}
o.splitbelow=true
o.splitright=true
o.mouse='a'
-- autocmd BufEnter,FocusGained * checktime " Refresh current buffer if file changed
-- let g:vim_json_syntax_conceal = 0 "Disabling concealing json syntax by default
o.showmode=true
o.showcmd=true
o.cursorline=true
o.number=true
o.relativenumber=true
o.linespace=1
o.laststatus=2 -- always show status line

-- Search options
o.incsearch=true -- search while typing
o.hlsearch=true -- highlight all results
o.smartcase=true
o.ignorecase=true

o.termguicolors=true
vim.cmd("colorscheme solarized")
