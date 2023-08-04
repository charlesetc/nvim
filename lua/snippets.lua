local luasnip = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local snippet = luasnip.snippet
local insert = luasnip.insert_node
local text = luasnip.text_node


luasnip.add_snippets("all", {
  snippet("expect", fmt([=[
expect.test("{name}", [[
]], function()
  {body}
end)
]=], {
    name = insert(1, ""),
    body = insert(2, "")
  }))
})
