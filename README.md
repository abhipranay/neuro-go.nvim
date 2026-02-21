# neuro-go.nvim

A dark colorscheme for Neovim inspired by the aurora borealis. Deep teal backgrounds with vibrant, carefully selected syntax colors designed for long coding sessions.

## Features

- **Full LSP Support**: Semantic tokens, modifiers, and type+modifier combinations
- **Tree-sitter Integration**: 60+ highlight groups for accurate syntax highlighting
- **Complete Diagnostics**: Underlines, virtual text, signs, and floating windows
- **LazyVim Compatible**: Works seamlessly with LazyVim's default plugins
- **Go-Optimized**: Special highlighting for Go error patterns and built-ins
- **Terminal Colors**: Matching 16-color palette for integrated terminals

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled (automatically set by the theme)
- A terminal with true color support

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "abhipranay/neuro-go.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("neurogo")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "abhipranay/neuro-go.nvim",
  config = function()
    vim.cmd.colorscheme("neurogo")
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'abhipranay/neuro-go.nvim'

" In your init.vim after plug#end()
colorscheme neurogo
```

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#0D161D` | Editor background |
| UI Background | `#111C26` | Tool windows, floating windows |
| Foreground | `#CFD8DC` | Default text |
| Keyword | `#BB719B` | Keywords, control flow |
| String | `#549EFF` | Strings, numbers |
| Variable | `#05C0A6` | Variables, identifiers |
| Property | `#7ACEF5` | Properties, functions |
| Type | `#BAA5FF` | Types, interfaces |
| Static | `#D193BB` | Constants, static values |
| Global | `#73D379` | Global variables, success |
| Comment | `#5E8299` | Comments |
| Error | `#FF6B68` | Errors, deletions |
| Warning | `#FFC66D` | Warnings, modifications |

## Supported Plugins

### UI & Navigation
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [which-key.nvim](https://github.com/folke/which-key.nvim)

### Fuzzy Finders
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim) (picker & explorer)

### Git
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

### Completion & LSP
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- LSP semantic tokens
- LSP inlay hints

### Editing
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [mini.nvim](https://github.com/echasnovski/mini.nvim)

### Notifications & UI
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)

### Package Management
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)

### Debugging
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

### AI
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)

### Markdown
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

## LSP Semantic Tokens

The theme provides comprehensive LSP semantic token support:

```lua
-- Types
@lsp.type.namespace, @lsp.type.type, @lsp.type.class, @lsp.type.enum
@lsp.type.interface, @lsp.type.struct, @lsp.type.typeParameter
@lsp.type.parameter, @lsp.type.variable, @lsp.type.property
@lsp.type.enumMember, @lsp.type.function, @lsp.type.method
@lsp.type.macro, @lsp.type.decorator

-- Modifiers
@lsp.mod.declaration, @lsp.mod.definition, @lsp.mod.readonly
@lsp.mod.static, @lsp.mod.deprecated, @lsp.mod.abstract
@lsp.mod.async, @lsp.mod.defaultLibrary

-- Type + Modifier combinations
@lsp.typemod.variable.readonly, @lsp.typemod.variable.static
@lsp.typemod.function.defaultLibrary, etc.
```

## Go-Specific Features

- `err` variables are highlighted in error color with italic style
- Built-in functions (`make`, `len`, `cap`, `append`) have distinct styling
- `defer`, `panic`, `recover` keywords are emphasized with bold+italic

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) for details.
