# fzf-unicode

Search and insert unicode characters in [vis](https://github.com/martanne/vis).
Requires the [fzf](https://github.com/junegunn/fzf) fuzzy search utility.

## Usage

Bind the `.action` member of the module to a key or key sequence in insert or replace mode:

```
local fzf_unicode = require('plugins/<path-to-fzf-unicode-plugin>')
-- replace <C-f> with your keybinding of choice
vis:map(vis.modes.INSERT, '<C-f>', fzf_unicode.action)
```

Search for the symbol by its LaTeX name. Hit `<Enter>` to insert the symbol only.

## Configuration

In your `visrc.lua`:

```
local fzf_unicode = require('plugins/<path-to-fzf-unicode-plugin>')

-- Change path to fzf binary (default: "fzf")
fzf_unicode.fzf_bin = "/usr/bin/fzf"

-- Change path to latex symbol table (must match format of provided table)
-- (default: "latex_symbols.txt" in the same directory as the plugin script)
fzf_unicode.latex_symbols = "path/to/latex_symbols.txt"

-- Add arguments to be passed to fzf (no arguments by default)
fzf_unicode.fzf_args = "--height=20%"
```

The mailing list for this repo is [~adigitoleo/vis-fzf-unicode-develop@lists.sr.ht](mailto:~adigitoleo/vis-fzf-unicode-develop@lists.sr.ht). See also <https://git-send-email.io/>.
