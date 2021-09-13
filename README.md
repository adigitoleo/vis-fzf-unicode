# fzf-unicode

Search and insert unicode characters in [vis](https://github.com/martanne/vis).
Requires the [fzf](ihttps://github.com/junegunn/fzf) fuzzy search utility.

## Usage

Use `:fzf-unicode` and search for the symbol by its LaTeX name. Hit `<Enter>` to insert the symbol only.

## Configuration

In your `visrc.lua`:

```
local fzf_unicode = require('plugins/<path-to-fzf-unicode-plugin>')

-- Change path to fzf binary (default: "fzf")
fzf_unicode.fzf_bin = "/usr/bin/fzf"

-- Change path to latex symbol table (must match format of provided table)
-- (default: "latex_symbols.txt" in the same directory as the plugin script)

-- Add arguments to be passed to fzf (no arguments by default)
fzf_unicode.fzf_args = "--height=20%"

-- Set a key mapping for quick access
vis.events.subscribe(vis.events.INIT, function()
    vis:map(vis.modes.NORMAL, '<C-i>', ':fzf-unicode<Enter>')
end)

