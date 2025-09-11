local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local conf = require('telescope.config').values

local M = {}

local live_miltigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end

      local splits = vim.split(prompt, '  ')
      local args = { 'rg' }

      if splits[1] then
        table.insert(args, '-e')
        table.insert(args, splits[1])
      end

      if splits[2] then
        table.insert(args, '-g')
        table.insert(args, splits[2])
      end

      return vim.list_extend(args, { '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' })
    end,

    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = 'Multi Grep',
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(),
    })
    :find()
end

M.setup = function()
  vim.keymap.set('n', '<leader>sm', live_miltigrep, {desc = '[S]earch by [M]ulti Grep'})
end

return M
