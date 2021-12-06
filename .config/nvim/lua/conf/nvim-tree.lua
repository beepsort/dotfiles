local tree_cb = require('nvim-tree.config').nvim_tree_callback
require('nvim-tree').setup {
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache", ".vscode", ".vs", "*.meta" }
    },
    view = {
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                { key = 's', cb = tree_cb('split') },
                { key = 'v', cb = tree_cb('vsplit') },
                { key = 'H', cb = tree_cb('toggle_dotfiles') }
            }
        }
    }
}
