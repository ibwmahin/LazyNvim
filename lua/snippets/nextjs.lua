-- ---------------------------------------------------------------------------
-- FILE: lua/snippets/nextjs.lua
-- Custom LuaSnip snippets for Next.js / React development.
-- Save this file as: <config>/lua/snippets/nextjs.lua
-- LuaSnip will lazy_load it from the path configured above.
-- Triggers:
--   cc   -> Create React component (TSX/JSX aware via filetype)
--   np   -> Next.js page scaffold
--   rfn  -> React default function component (import + export)
-- ---------------------------------------------------------------------------

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function filename_to_component(args)
  -- derive a PascalCase component name from filename
  local fn = args[1][1] or "Component"
  local name = fn:gsub("%.%w+$", "")
  name = name:gsub("[-_.]([a-z])", function(a)
    return a:upper()
  end)
  name = name:gsub("^([a-z])", function(a)
    return a:upper()
  end)
  return name
end

return {
  -- JavaScript / JSX
  javascriptreact = {
    s(
      "cc",
      fmt(
        [[
const {} = ({}) => {{
  return (
    <div>
      {}
    </div>
  )
}}

export default {};
        ]],
        { i(2, "ComponentName"), i(1, "props"), i(0), f(filename_to_component, { 1 }) }
      )
    ),

    -- React default function (import + export)
    s(
      "rfn",
      fmt(
        [[
import React from 'react'

export default function {}() {{
  return (
    <div>{}</div>
  )
}}
        ]],
        { i(1, "NotFound"), i(0) }
      )
    ),

    s(
      "np",
      fmt(
        [[
import Head from 'next/head'

export default function {}() {{
  return (
    <>
      <Head>
        <title>{}</title>
      </Head>
      <main>
        {}
      </main>
    </>
  )
}}
        ]],
        { i(1, "PageName"), i(2, "Page Title"), i(0) }
      )
    ),
  },

  -- TypeScript / TSX
  typescriptreact = {
    s(
      "cc",
      fmt(
        [[
import React from 'react'

export interface {} {{}}

const {}: React.FC<{}> = ({}) => {{
  return (
    <div>
      {}
    </div>
  )
}}

export default {};
        ]],
        { i(1, "Props"), i(2, "ComponentName"), i(1), i(3, "props"), i(0), f(filename_to_component, { 2 }) }
      )
    ),

    -- React default function (import + export, with JSX.Element return type)
    s(
      "rfn",
      fmt(
        [[
import React from 'react'

export default function {}(): JSX.Element {{
  return (
    <div>{}</div>
  )
}}
        ]],
        { f(filename_to_component, { 1 }), i(0) }
      )
    ),

    s(
      "np",
      fmt(
        [[
import Head from 'next/head'
import { GetStaticProps } from 'next'

interface Props {{}}

export default function {}(props: Props) {{
  return (
    <>
      <Head>
        <title>{}</title>
      </Head>
      <main>
        {}
      </main>
    </>
  )
}}

export const getStaticProps: GetStaticProps = async () => {{
  return {{ props: {{}} }}
}}
        ]],
        { i(1, "PageName"), i(2, "Page Title"), i(0) }
      )
    ),
  },

  -- fallback for plain .js/.ts files
  javascript = {
    s(
      "cc",
      fmt(
        [[
function {}({}) {{
  return (
    <div>
      {}
    </div>
  )
}}

export default {};
        ]],
        { i(2, "ComponentName"), i(1, "props"), i(0), f(filename_to_component, { 2 }) }
      )
    ),
  },

  typescript = {},
}
