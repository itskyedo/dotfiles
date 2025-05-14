-- ╔════════════════════════════════════════════════════════════════════════════════════╗
-- ║                                    USER OPTIONS                                    ║
-- ╚════════════════════════════════════════════════════════════════════════════════════╝

vim.g.mapleader = ' '

vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.clipboard = "unnamedplus"
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,globals,tabpages,winsize,terminal"
vim.opt.mouse = 'a'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.showtabline = 2
vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.matchpairs = "(:),{:},[:],<:>"

-- ╔════════════════════════════════════════════════════════════════════════════════════╗
-- ║                                    USER KEYMAPS                                    ║
-- ╚════════════════════════════════════════════════════════════════════════════════════╝

vim.keymap.set("n", vim.g.mapleader, "<Nop>", { silent = true, remap = false, desc = 'Mapleader' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = "Switch to previous buffer" })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = "Switch to next buffer" })
vim.keymap.set('n', '[B', '<cmd>bfirst<cr>', { desc = "Switch to first buffer" })
vim.keymap.set('n', ']B', '<cmd>blast<cr>', { desc = "Switch to last buffer" })
vim.keymap.set('n', '[t', '<cmd>tabprevious<cr>', { desc = "Switch to previous tab" })
vim.keymap.set('n', ']t', '<cmd>tabnext<cr>', { desc = "Switch to next tab" })
vim.keymap.set('n', '[T', '<cmd>tabfirst<cr>', { desc = "Switch to first tab" })
vim.keymap.set('n', ']T', '<cmd>tablast<cr>', { desc = "Switch to last tab" })
vim.keymap.set('n', '<space>xb', '<cmd>%bd|e#|bd#<cr>', { remap = false, desc = "Close all other buffers" })

vim.keymap.set('n', '<leader>n', '<cmd>set rnu! rnu?<cr>', { desc = "Toggle relative/absolute line numbering" });

vim.keymap.set('n', '<S-Up>', 'v<Up>', { desc = "Select up" });
vim.keymap.set('n', '<S-Right>', 'v<Right>', { desc = "Select right" });
vim.keymap.set('n', '<S-Down>', 'v<Down>', { desc = "Select down" });
vim.keymap.set('n', '<S-Left>', 'v<Left>', { desc = "Select left" });
vim.keymap.set('v', '<S-Up>', '<Up>', { desc = "Move cursor up" });
vim.keymap.set('v', '<S-Right>', '<Right>', { desc = "Move cursor right" });
vim.keymap.set('v', '<S-Down>', '<Down>', { desc = "Move cursor down" });
vim.keymap.set('v', '<S-Left>', '<Left>', { desc = "Move cursor left" });

-- ╔════════════════════════════════════════════════════════════════════════════════════╗
-- ║                                   USER COMMANDS                                    ║
-- ╚════════════════════════════════════════════════════════════════════════════════════╝

-- ╔══════════════════════════════════════╗
-- ║               COMMANDS               ║
-- ╚══════════════════════════════════════╝

vim.api.nvim_create_user_command('Source', 'source $MYVIMRC', {})

-- Close buffer without closing window
-- https://github.com/neovim/neovim/issues/2434#issuecomment-565577489

vim.api.nvim_create_user_command(
  'Bclose',
  function(opts)
    if opts.bang then
      CloseBuffer(0, true)
    else
      CloseBuffer(0)
    end
  end,
  { bang = true }
)

local function nvim_loaded_buffers()
  local result = {}
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) then
      table.insert(result, buf)
    end
  end
  return result
end

function CloseBuffer(target_buf, should_force)
  if not should_force and vim.bo.modified then
    return vim.api.nvim_err_writeln('Buffer is modified. Force required.')
  end
  local command = 'bd'
  if should_force then command = command .. '!' end
  if target_buf == 0 or target_buf == nil then
    target_buf = vim.api.nvim_get_current_buf()
  end
  local buffers = nvim_loaded_buffers()
  if #buffers == 1 then
    vim.api.nvim_command(command)
    return
  end
  local nextbuf
  for i, buf in ipairs(buffers) do
    if buf == target_buf then
      nextbuf = buffers[(i - 1 + 1) % #buffers + 1]
      break
    end
  end
  vim.api.nvim_set_current_buf(nextbuf)
  vim.api.nvim_command(table.concat({ command, target_buf }, ' '))
end

-- ╔══════════════════════════════════════╗
-- ║             AUTOCOMMANDS             ║
-- ╚══════════════════════════════════════╝

local user_cmds = vim.api.nvim_create_augroup('user_cmds', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = user_cmds,
  desc = "Map q-key to close help/man buffers",
  pattern = { 'help', 'man' },
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- ╔════════════════════════════════════════════════════════════════════════════════════╗
-- ║                                      PLUGINS                                       ║
-- ╚════════════════════════════════════════════════════════════════════════════════════╝

local lazy = {}

function lazy.install(path)
  if not vim.uv.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {
  ui = {
    border = "single",
  },
}

lazy.setup({
  -- ╔══════════════════════════════════════╗
  -- ║                  UI                  ║
  -- ╚══════════════════════════════════════╝

  { 'kyazdani42/nvim-web-devicons' },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      vim.opt.showmode = false

      local function buffer()
        local bufnr = vim.api.nvim_get_current_buf();
        local bufname = vim.api.nvim_buf_get_name(bufnr);
        local relpath = vim.fn.fnamemodify(bufname, ':~:.');
        return "#" .. bufnr .. " " .. relpath;
      end

      require('lualine').setup({
        options = {
          theme = 'auto',
          icons_enabled = true,
          component_separators = '|',
          section_separators = '',
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { buffer, 'filesize' },
          lualine_x = { 'filetype' },
          lualine_y = { 'searchcount', 'selectioncount', 'progress' },
          lualine_z = { 'location' }
        },
      })
    end,
  },

  {
    'nanozuki/tabby.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('tabby').setup({
        line = function(line)
          return {
            {
              { '  ', hl = 'TabLine' },
              line.sep('', 'TabLine', 'TabLine'),
            },
            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and 'TabLineSel' or 'TabLineFill'
              return {
                line.sep('', hl, 'TabLine'),
                tab.is_current() and '' or '󰆣',
                tab.number(),
                tab.close_btn(''),
                line.sep('', hl, 'TabLine'),
                hl = hl,
                margin = ' ',
              }
            end),
            line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
              return {
                line.sep('', 'TabLine', 'TabLine'),
                win.is_current() and '' or '',
                win.buf_name(),
                line.sep('', 'TabLine', 'TabLine'),
                hl = 'TabLine',
                margin = ' ',
              }
            end),
            {
              line.sep('', 'TabLine', 'TabLine'),
            },
            hl = 'TabLineFill',
          }
        end
      })
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    version = '3.x',
    config = function()
      require('ibl').setup({
        enabled = true,
        scope = {
          enabled = false,
        },
        indent = {
          char = '▏',
        },
      })
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup({
        input = {
          relative = "editor",
        },
      })
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup({
        throttle_ms = 10,
        set_highlights = false, -- Set this to `true` if theme doesn't define them
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = false, -- Requires gitsigns
          handle = true,
          search = false,   -- Requires hlslens
          ale = false,      -- Requires ALE
        },
      })
    end,
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("marks").setup({
        default_mappings = true,
        builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = {
          lower = 10,
          upper = 15,
          builtin = 8,
          bookmark = 20,
        },
        excluded_filetypes = {},
        excluded_buftypes = {},
        mappings = {},
      })
    end,
  },

  -- ╔══════════════════════════════════════╗
  -- ║              UTILITIES               ║
  -- ╚══════════════════════════════════════╝

  { 'nvim-lua/plenary.nvim' },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { "andymass/vim-matchup", event = "BufReadPost" },
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        },
        matchup = {
          enable = true,
          disable = {},
          disable_virtual_text = true,
        },
        ensure_installed = {
          'javascript',
          'typescript',
          'tsx',
          'lua',
          'vim',
          'vimdoc',
          "html",
          'css',
          'json',
          'rust'
        },
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- plugins
      { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "smartpde/telescope-recent-files" },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = " ",
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          layout_config = {
            width = 0.7,
            height = 0.8,
            flex = {
              flip_columns = 150,
            },
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = {
              prompt_position = "top",
              mirror = true,
              preview_height = 0.3
            },
          },
          vimgrep_arguments = {
            -- required
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",

            -- custom
            "--smart-case",
            "--fixed-strings",
          },
        },
        extensions = {
          file_browser = {
            hidden = true,
            respect_gitignore = false,
          },
          undo = {},
          recent_files = {
            only_cwd = true,
          }
        },
        pickers = {
          oldfiles = {
            only_cwd = true,
          },
        },
      })

      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<leader>fo', '<cmd>lua require("telescope").extensions.recent_files.pick()<cr>',
        { desc = "Show recent files" })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Show buffers" })
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find files" })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = "Live grep" })
      vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = "Show diagnostics" })
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>', { desc = "Show references" })
      vim.keymap.set('n', '<leader>fw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
        { desc = "Show dynamic workspace symbols" })
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', { desc = "Show document symbols" })
      vim.keymap.set('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
        { desc = "Telescope Fuzzy find in buffer" })
      vim.keymap.set("n", "<leader>fe", '<cmd> Telescope file_browser path=%:p:h select_buffer=true <CR>',
        { desc = "Show file browser" })
      vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { desc = "Show undo tree" })
    end,
  },

  {
    "folke/flash.nvim",
    config = function()
      require("flash").setup({
        modes = {
          char = {
            enabled = false,
          },
        },
      })

      vim.keymap.set({ "n", "x", "o" }, "s", '<cmd>lua require("flash").jump()<cr>', { desc = "Open Flash" });
      vim.keymap.set({ "n", "x", "o" }, "S", '<cmd>lua require("flash").treesitter()<cr>',
        { desc = "Open Flash in Treesitter mode" });
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({})
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "shatur/neovim-session-manager",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local Path = require("plenary.path")
      local config = require("session_manager.config")
      require("session_manager").setup({
        sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
        autoload_mode = config.AutoloadMode.CurrentDir,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_dirs = {},
        autosave_ignore_filetypes = {
          "gitcommit",
          "gitrebase",
        },
        autosave_ignore_buftypes = {},
        autosave_only_in_session = false,
        max_path_length = 80,
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')

      gitsigns.setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 250,
          virt_text_pos = "right_align",
        },
        signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '➤' },
          topdelete = { text = '➤' },
          changedelete = { text = '▎' },
        },
        on_attach = function(bufnr)
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          map('n', '<leader>hp', gitsigns.preview_hunk)
          map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
          map('n', '<leader>hd', gitsigns.diffthis)
          map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
          map('n', '<leader>td', gitsigns.toggle_deleted)
        end,
      })
    end,
  },

  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    opts = {},
    config = function()
      require("quicker").setup()
    end,
  },

  -- ╔══════════════════════════════════════╗
  -- ║            AUTOCOMPLETION            ║
  -- ╚══════════════════════════════════════╝

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- completion sources
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      -- snippets engine
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          -- snippets
          "rafamadriz/friendly-snippets"
        },
      },
    },

    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer',  keyword_length = 3 },
          { name = 'luasnip', keyword_length = 2 },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              luasnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        preselect = cmp.PreselectMode.None,
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),

          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = false,
                })
                fallback()
              end
            else
              fallback()
            end
          end),
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "man", "!" },
            },
          },
        }),
      })
    end,
  },

  -- ╔══════════════════════════════════════╗
  -- ║                 LSP                  ║
  -- ╚══════════════════════════════════════╝

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    }
  },

  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        default_format_opts = {
          lsp_format = "fallback",
        },

        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
})

-- ╔════════════════════════════════════════════════════════════════════════════════════╗
-- ║                                  LSP / DIAGNOSTICS                                 ║
-- ╚════════════════════════════════════════════════════════════════════════════════════╝

local lspconfig = require('lspconfig')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    border = 'single',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'single' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'single' }
)

vim.api.nvim_create_autocmd('LspAttach', {
  group = user_cmds,
  desc = 'LSP keymaps',
  callback = function()
    local set_keymap = function(mode, lhs, rhs, opts)
      local default_opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', default_opts, opts));
    end

    set_keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover({ border = 'single' })<cr>", { desc = 'Show symbol information' })
    set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Go to symbol definition' })
    set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Go to symbol declaration' })
    set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'Go to symbol implementation' })
    set_keymap('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Go to symbol type definition' })
    set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'List symbol references' })
    set_keymap('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
      { desc = 'Show symbol signature information' })
    set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename symbol' })
    set_keymap('n', '<leader>fm', function()
      require("conform").format({
        lsp_fallback = true,
        async = true,
      })
    end, { desc = 'Format buffer' })
    set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Show code actions' })
    set_keymap('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'Show diagnostics' })
    set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = 'Go to previous diagnostic' })
    set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = 'Go to next diagnostic' })
  end
})

require('mason').setup({
  ui = {
    border = 'single',
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'eslint',
    'biome',
    'html',
    'cssls',
    'rust_analyzer',
    'sqlls',
    'pyright',
  },
});

lspconfig.lua_ls.setup({
  capabilities = default_capabilities,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          "${3rd}/busted/library",
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

lspconfig.ts_ls.setup({
  capabilities = default_capabilities,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  init_options = {
    preferences = {
      disableSuggestions = true,
      autoImportFileExcludePatterns = {
        '**/dist/**/*',
      },
    },
  },
  settings = {
    completions = {
      completeFunctionCalls = true
    },
  },
  root_dir = require("lspconfig.util").root_pattern('.git'),
})

lspconfig.eslint.setup({
  capabilities = default_capabilities,
})

lspconfig.html.setup({
  capabilities = default_capabilities,
})

lspconfig.cssls.setup({
  capabilities = default_capabilities,
  on_attach = function()
    local conform = require("conform")

    conform.formatters.biome = {
      prepend_args = {
        'check',
        '--unsafe',
        '--write',
      },
    }

    local filetypes_to_set = {
      "css",
      "scss",
      "sass",
    }

    for _, ft in ipairs(filetypes_to_set) do
      conform.formatters_by_ft[ft] = { "prettier" }
    end
  end,
})

lspconfig.biome.setup({
  capabilities = default_capabilities,
  on_attach = function()
    local conform = require("conform")

    conform.formatters.biome = {
      prepend_args = {
        'check',
        '--unsafe',
        '--write',
      },
    }

    local filetypes_to_set = {
      "typescript",
      "typescriptreact",
      "typescript.jsx",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "astro",
      "svelte",
      "vue",
      "json",
      "jsonc",
      "css",
      "scss",
      "sass",
      "html",
      "graphql",
    }

    for _, ft in ipairs(filetypes_to_set) do
      conform.formatters_by_ft[ft] = { "biome" }
    end
  end,
})

lspconfig.rust_analyzer.setup({
  capabilities = default_capabilities,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      check = {
        command = 'clippy',
      },
      procMacro = {
        enable = true,
      },
    }
  }
})

lspconfig.sqlls.setup({
  capabilities = default_capabilities,
  root_dir = function(_)
    return vim.loop.cwd()
  end,
})


lspconfig.pyright.setup({
  capabilities = default_capabilities,
})

-- ╔════════════════════════════════════════════════════════════════════════════════════╗
-- ║                                    COLORSCHEME                                     ║
-- ╚════════════════════════════════════════════════════════════════════════════════════╝

vim.cmd.colorscheme('eminence')
