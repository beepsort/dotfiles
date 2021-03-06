---- telscope config
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = '>',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    file_ignore_patterns = {},
    winblend = 0,
    layout_config = {
      prompt_position = 'top',
      preview_cutoff = 120,
      width = 0.75,
    },
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = {
      ['COLORTERM'] = 'truecolor',
    },
  },
  pickers = {
      buffers = {
          sort_lastused = true
      }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}
require('telescope').load_extension 'fzf'
