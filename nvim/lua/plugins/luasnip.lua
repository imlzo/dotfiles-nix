--
-- luasnip.lua - Config for LuaSnip
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
--
local ls = require "luasnip"
local types = require "luasnip.util.types"

-- Configuration
ls.config.set_config({
  -- Jump into last snippet even after exiting
  history = false;

  updateevents = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved,InsertEnter,InsertLeave,CursorHold,CursorHoldI",
  delete_check_events = "TextChanged,InsertEnter",

  ext_opts = {
    [types.choiceNode] = {
      active = {
      -- Show virtual text for choice nodes
        virt_text = { { " < Choice", "NonTest" } },
      },
    },
  },

})

--[[
-- Keymaps
--]]

-- Expand / Jump with <c-k>
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Select choice
vim.keymap.set("i", "<c-y>", require "luasnip.extras.select_choice")

--[[
-- Test Snippets
--]]
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

-- TODO: Organize snippets by ft?

-- Code fence snippet
local code_fence = s("cf", fmt([[
  ```{ft}
  {body}
  ```
  {c}]], {
    ft = i(1, "ft"),
    body = i(2),
    c = i(0),
  }));

ls.add_snippets("markdown", {
  code_fence,
})
ls.add_snippets("vimwiki", {
  code_fence,
})

--[[
-- HTML Snippets
--]]
ls.add_snippets("html", {
  -- script tag
  s("script", fmt([[
    <script src="{source}" defer></script>{c}
    ]], {
      source = i(1),
      c = i(0),
    })),
  -- link atg
  s("link", fmt([[
    <link rel="stylesheet" type="text/css" href="{href}">{c}
    ]], {
      href = i(1),
      c = i(0),
    })),
  -- html5
  s("html5", fmt([[
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{title}</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="script.js" defer></script>
      </head>
      <body>
      {body}
      </body>
    </html>
    ]], {
      title = i(1),
      body = i(0),
    })),
})


--[[
-- JS Snippets
-]]
ls.add_snippets("javascript", {
  -- constructor
  s("constructor", fmt([[
    constructor({args}) {{
    {body}{c}
    }}
    ]], {
      args = i(1),
      body = f(function(nodes)
        local argText = nodes[1][1] or ""
        local vars = vim.split(argText, ",")
        local lines = {}
        for i = 1, #vars do
          local var = vim.trim(vars[i])
          if #var > 0 then
            table.insert(lines, '\tthis.' .. var .. ' = ' .. var .. ';')
          end
        end
        return lines
      end, 1),
      c = i(0),
    })),
})


--[[
-- Rust Snippets
-]]
ls.add_snippets("rust", {
  -- main
  s("main", fmt([[
    fn main() {{
      {c}
    }}
    ]], {
      c = i(0),
    })),
})
