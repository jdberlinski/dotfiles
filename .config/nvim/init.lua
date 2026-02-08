vim.g.latex_to_unicode_auto = 0
vim.g.latex_to_unicode_eager = 0
vim.g.python3_host_prog = '/opt/anaconda3/bin/python3.12'

-- Leaders
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Snippet engine
  {
    'SirVer/ultisnips',
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
      vim.g.UltiSnipsSnippetDirectories = {vim.fn.expand('$HOME') .. '/.vim/UltiSnips', "UltiSnips"}
    end,
  },

    -- Treesitter (required for R.nvim)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
  },

  -- R support - using NEW R.nvim plugin
  {
    'R-nvim/R.nvim',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      local opts = {
        R_args = { "--no-save", "--quiet" },
        R_app = "radian",
        bracketed_paste = true,
        disable_cmds = {"RInsertPipe"},
        hook = {
          on_filetype = function()
            vim.keymap.set('n', ',', '<Plug>RDSendLine', {buffer = true})
            vim.keymap.set('v', ',', '<Plug>RDSendSelection', {buffer = true})
          end
        },
      }
      require('r').setup(opts)
    end,
  },

  -- LaTeX support
  {
    'lervag/vimtex',
    ft = 'tex',
   init = function()
      vim.g.Tex_Leader = '"'
      vim.g.tex_flavor = "xelatex"
      vim.g.vimtex_quickfix_mode = 2
      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
   end,
   config = function()
      -- Enable spellcheck for tex
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'tex',
        callback = function()
          vim.opt_local.spell = true
        end,
      })
    end,
  },

  -- Comment plugin (replacing vim-commentary)
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()

      -- C/C++ comment string override
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {'c', 'cpp'},
        callback = function()
          vim.opt_local.commentstring = '// %s'
        end,
      })
    end,
  },

  -- Editing utilities
  'tpope/vim-surround',

  {
    'jiangmiao/auto-pairs',
    config = function()
      -- Disable auto-pairs for tex
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'tex',
        callback = function()
          vim.b.AutoPairs = {}
        end,
      })
    end,
  },

  -- Julia support
--  {
--    'JuliaEditorSupport/julia-vim',
--    ft = 'julia',
--    lazy = true,
--    init = function()
--      vim.g.julia_indent_align_funcargs = 0
--      vim.g.latex_to_unicode_auto = 0
--      vim.g.latex_to_unicode_eager = 0
--    end,
--  },

  -- Stan support
  'eigenfoo/stan-vim',

  -- REPL integration
  {
    'jpalardy/vim-slime',
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_python_ipython = 1
      vim.g.slime_default_config = {
        socket_name = vim.split(vim.env.TMUX or '', ',')[1],
        target_pane = '{bottom-left}'
      }
      vim.g.slime_dont_ask_default = 1

      -- Julia keymaps
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'julia',
        callback = function()
          vim.keymap.set('n', ',', '<Plug>SlimeLineSendj', {buffer = true, remap = true})
          vim.keymap.set('x', ',', '<Plug>SlimeRegionSend', {buffer = true, remap = true})
        end,
      })
    end,
  },

  -- Telescope (fuzzy finder)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    keys = {
      { '<leader>ff', function() require 'telescope.builtin'.find_files() end, mode = 'n' }
    }
  },

  -- Theme
  {
    'vague-theme/vague.nvim',
    lazy = false,    -- during startup
    priority = 1000, -- before everything else
    config = function()
      vim.cmd("colorscheme vague")
    end
  }
})

-- Automatically close terminal process without exit code
vim.api.nvim_create_autocmd('TermClose', {
  pattern = '*',
  callback = function()
    vim.cmd('bdelete! ' .. vim.fn.expand('<abuf>'))
  end,
})
-- Backup, swap, and undo directories
vim.opt.backupdir = {'.backup/', '~/.backup/', '/tmp//'}
vim.opt.directory = {'.swp/', '~/.swp/', '/tmp//'}
vim.opt.undodir = {'.undo/', '~/.undo/', '/tmp//'}

-- Text formatting
vim.opt.textwidth = 80
vim.opt.spelllang = 'en_us'

-- Spell check correction mapping (Ctrl-l in insert mode)
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- stupid exit terminal mode fix
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Strip trailing whitespace on save
local function strip_trailing_whitespaces()
  local save_cursor = vim.fn.getpos('.')
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos('.', save_cursor)
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = strip_trailing_whitespaces,
})

-- Basic settings
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamed'
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.sidescrolloff = 5
vim.opt.cursorline = true
vim.opt.scrolloff = 5


-- Path and title
vim.opt.path:append('**')
vim.opt.title = true
