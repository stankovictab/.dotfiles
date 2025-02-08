# .dotfiles

Linux config dotfiles for easier setup.

Clone this repo into `~/.dotfiles`, and make symlinks to the configs with `./sync.sh`.

# The Shortcuts

`Make sure these are up to date!`

The point of this is to make sure all of the shortcuts that I use (both default and custom) are consistent across the environments, to avoid confusion.

## Universal Shell Shortcuts

`Ctrl + d` - Kill shell (but not when a process is running)\
`Ctrl + u` - Clear line\
`Ctrl + r` - Search history of commands by query in prompt\
`Ctrl + c` - Stop program or prompt line\
`Ctrl + z` - Suspend program (to go back, use `fg` command)\
`Ctrl + Shift + c` - Copy selected text\
`Ctrl + Shift + v`, `Ctrl + v`, `Shift + Insert` - Paste text

## fish

`Ctrl + l`, `RightArrow` - Autocomplete line

### fzf-fish

`Ctrl + f` - Search files and folders\
`Ctrl + Alt + l` - Seach git log for the repo you’re currently in\
`Ctrl + Alt + s` - Search git status for the repo you’re currently in\
`Ctrl + r` - Search shell command history\
`Ctrl + Alt + v` - Search shell variables\
`Ctrl + Alt + p` - Search processes

`Ctrl + v` - Paste text (as fish-fzf allows for this if Search Shell Variables is unbound)

## 1Password

`Ctrl + Shift + Space` - Quick Access

## Zellij

> Note that all of these should be in the zellij_forgot plugin config for the `Ctrl + h` shortcut

`zj`, `zjls`, `zja`, `zjk`, `zjka`, `zjda` - Fish shell aliases

`Ctrl + x` - Help / Keybinds\
`Ctrl + g` - Lock mode\
`Ctrl + p` - Pane mode\
-> `h/j/k/l` - Move between panes\
-> `n` - New pane in the most suitable slot, in the tab or floating, depending\
-> `d`, `r` - New pane downwards or to the right\
-> `x` - Close pane\
-> `c` - Rename pane\
-> `f` - Fullscreen pane\
-> `z` - Toggle pane frames (to show borders and names)\
-> `w` - Toggle floating mode, and make a new pane there if there isn't any\
-> `e` - Embed floating pane into the tab, or eject a pane to floating state\
-> `p` - Cycle through panes\
`Ctrl + t` - Tab mode\
-> `n` - New tab\
-> `x` - Close tab\
-> `r` - Rename tab\
-> `b` - Break current pane into new tab\
-> `s` - Toggle synced tab (all input will be the same on all panes of the tab)\
-> `Tab` - Cycle through tabs (kinda?)\
`Ctrl + n` - Resize mode\
-> `+/-` - Increase / decrease the size of the pane\
-> `h/j/k/l` - Resize the pane in a direction\
`Ctrl + e` - Panel move mode\
`Ctrl + a` - Scroll, Search & Copy to editor mode\
-> `k/j`, `PgUp/PgDn`, `u,d` - Scroll up / down\
-> `e` - Open scrollback in the default editor\
-> `s` - Search, with `n` and `p` moving between them, `c` toggling case sensitivity and `w` toggling wrapping when going through results\
`Ctrl + y` - Session mode\
-> `d` - Detach session\
-> `w` - Session manager

`Alt + h/j/k/l` - Move between panes (and tabs)\
`Alt + +(=)/-` -  Increase / decrease the size of the pane

Note that the Tmux mode is unbound, as I don't need it.\
Also don't need the `Ctrl + q` to quit, since I have `Ctrl + d`.

## TMUX

> Note that I use the word tab, and not window.

`t`, `ta`, `td`, `tls`, `tks` - Fish shell aliases

`Ctrl + a + Shift + i` - Install plugins with tpm (make sure you git cloned tpm)
`Ctrl + a + r` - Refresh config

`Ctrl + t`, `Ctrl + a + t` - New tab\
`Ctrl + a + v` - Split vertically\
`Ctrl + a + h` - Split horizontally\
`Alt + h/j/k/l`, `Alt + ArrowKeys`, `Ctrl + a + ArrowKeys` (TTY) - Switch between panes\
`Ctrl + Shift + PgUp/PgDn` - Switch between tabs\
`Ctrl + a + (/)` - Switch between sessions\
`Ctrl + a + {Number}` - Switch to tab {Number}\
`Ctrl + a + f` - Show pane numbers. You can switch to a specific pane with `Ctrl + a + f + {Number}`\
`Ctrl + Alt + Left/Right`, `Ctrl + a + {/}` - Swap pane with previous/next position\
`Ctrl + a + Ctrl + ArrowKeys` - Resize pane

`Ctrl + a + d` - Detach session and return to native terminal shell\
`Ctrl + a + e`, `Ctrl + d` (kill shell only) - Kill pane\
`Ctrl + a + w` - Kill tab\
`Ctrl + a + q` - Kill session

`Ctrl + a + :` - Enter command mode\
`Ctrl + a + a` - Tab overview\
(there is no pane overview, so you'll have to expand the panes in the tree)\
`Ctrl + a + . + Number` - Move tab to position {Number}\
`Ctrl + a + s` - Rename session\
`Ctrl + a + x` - Rename tab\

`Ctrl + a + z` - Fullscreen pane (zoom)\
`Ctrl + a + c` - Big ass clock\
`Ctrl + a + ?` - Show all commands, including your config changes\

## NeoVim

`Ctrl + c` - A faster `Esc`\
`Ctrl + s` - Save (and exit Insert, Visual or Command Mode)\
`Tab + ,` - Open config files location\
`Tab + f` - Open Telescope file search\
`Tab + gr` - Open Telescope live grep\
`Tab + b` - Open Telescope buffer search\
`Tab + g + g` - Open LazyGit\
`Tab + g + s` - Open Telescope git status\
`Ctrl + n` - Open integrated terminal

`Ctrl + q` - Save and close window (and/or quit NeoVim), same as :wq\
`Ctrl + w` - Close buffer\
`Ctrl + h/j/k/l` - Cycle between windows visible on the screen\
`Tab + s + h` - Split horizontally\
`Tab + s + v` - Split vertically\
`Space` - Reset window sizes\
`Ctrl + ArrowKeys` - Resize current window\
    `Shift + j/k`, `Ctrl + PgUp/PgDn` - (Normal Mode) Cycle between buffers for the current window\
`Ctrl + Shift + PgUp/PgDn` - Move buffers in cokeline\
`Ctrl + Shift + PgUp/PgDn`, `Ctrl + Shift + j/k` - Move buffers in bufferline

`Shift + h/l` - Go to beginning / end of line\
`Ctrl + /` - Toggle comment\
`Ctrl + f` - Format document\
`/` - Search (with Flash)\
`Ctrl + r` - Search and replace\
`Space` - Clear search highlighting\
`,` - Flash jump\
`u`, `Shift + u` - Undo and redo\
`Tab + a` - Select all\
`Tab + p + s` - Sync packages and TreeSitter parsers\
`Tab + t` - Toggle TreeSitter highlighting\
`Tab + m` - Markdown Preview\
`Tab + z` - Zen Mode\
`Tab + c` - Choose colorscheme\
`Tab + d` - See LSP diagnostics\
`J/K` - (Visual Mode) Move all selected lines up or down\
`Alt + d` - Duplicate line\
`w`, `W` - Move forward / backward by word\
`+`, `-` - Increment / decrement number under cursor\
`Shift + p` - Paste without changing the register\
`; + t/e/g/j/k/l/m/n` - Telescope main menu (`t`), and search for emoji, gitmoji, julia, kaomoji, latex, math and Nerd Font symbols\
`gf` - Go to file under cursor\
`gx` - Open file or URL under cursor with system application

`Tab` - Codeium - Accept suggestion\
`Shift + Tab` - Codeium - Insert Tab character regardless of suggestion\
`Alt + p` - Codeium - Previous suggestion\
`Alt + n` - Codeium - Next suggestion\
`Ctrl + ]` - Codeium - Clear suggestion

`Ctrl + j/k` - Move up and down in Telescope and nvim-cmp (just like in fzf)

`:cd` - Change working directory for NeoVim and NvimTree\
`:e` - Edit another file

### NvimTree (DEPRICATED FROM CONFIG)

`Ctrl + b` - Toggle file browser\
`a` - New file or folder. If you want to make a folder, add a / at the end\
`r` - Rename selected item (you can also rename it to ../{name} to move it up)\
`R` - Refresh files\
`d` - Delete selected item\
`x` - Cut item\
`c` - Copy item\
`p` - Paste item (you can move items around with `x` and `p`)\
`y` - Copy selected item name\
`W` - Collapse all\
`s` - Open selected file, like an image, in system app\
`f` - Find, or filter, files (Telescope is better than this though)\
`F` - Close the find window\
`-` - Go up\
`Ctrl + ]` - `cd` into selected folder, but only in NvimTree (doesn't affect Vim's :cd)\
`Ctrl + k` - Show info about selected file\
`Ctrl + x` - Open selected file in a horizontal split\
`Ctrl + v` - Open selected file in a vertical split\
`g?` - Show shortcuts\
`I` - Show gitignored files (off by default)\
`H` - Show hidden files

## VSCode

`Ctrl + p` - Search files\
`Ctrl + Shift + p` - Command palette\
`Ctrl + ,` - Settings\
`Ctrl + Shift + ,` - Settings JSON

`Ctrl + t`, `Ctrl + n` - New tab (new file)\
`Ctrl + Shift + n` - New window\
`Ctrl + w` - Close tab\
`Ctrl + q` - Quit

`Ctrl + b` - Toggle sidebar\
`Ctrl + j` - Toggle panel (with terminal)\
`Ctrl + Alt + b` - Toggle Activity Bar (far left)\
`Ctrl + Alt + s` - Toggle Status Bar (far bottom)\
`Ctrl + Shift + e` - Focus on Explorer (or you can just `Ctrl + p`)\
`Ctrl + Shift + f` - Focus on Search

`Ctrl + k + Ctrl + t` - Change theme\
`Ctrl + k + z` - Zen mode\
`Ctrl + k + v` - Markdown preview\
`Ctrl + k + s` - Save without formatting\
`Ctrl + Up/Down` - Scroll

`Ctrl + PgUp/PgDn` - Switch between tabs, through windows\
`Ctrl + Shift + PgUp/PgDn` - Move tab position in window\
`Ctrl + Alt + ArrowKeys` - Move between windows\
`Ctrl + Shift + Alt + ArrowKeys` - Move tab beween windows\
`Ctrl + Number` - Go to window {Number}\
`Ctrl + Tab` - Alt-Tab between tabs (sucks ass)

`Ctrl + =/-/0` - Zoom in/out/reset text\
`Ctrl + Shift + =/-/0` - Zoom in/out/reset UI

### Editing

`F2` - Rename anything\
`Ctrl + /` - Toggle comment\
`Alt + Up/Down` - Move line\
`Ctrl + Shift + Up/Down`, `Alt + Shift + Up/Down`, `Alt + Click` - Add more cursors\
`Ctrl + Space` - Intellisense completion\
`Ctrl + x` - Cut line

### Running & Debugging

`Ctrl + F5` - Run\
`F5` - Debug\
`F5` - Continue to the next breakpoint\
`Shift + F5` - Stop\
`Ctrl + Shift + F5` - Restart\
`F10` - Step over\
`F11` - Step into\
`Shift + F11` - Step out

### Codeium

`Ctrl + i` - Codeium command in editor\
`Ctrl + Alt + a` - Codeium chat\
`Ctrl + Enter` - Query with codebase (kinda borked)\
`Tab` - Accept suggestion\
`Alt + [/]` - Cycle suggestions

### Phind

`Ctrl + i` - Phind chat\
`Ctrl + Shift + l` - Phind search terminal output

## Vivaldi

`Ctrl + ,` - Open settings\
`Ctrl + Alt + s` - Status bar\
Mouse Upwards, `Ctrl + Alt + d` - Address bar\
Mouse Downwards, `Ctrl + Space`, `Ctrl + F11` - Show UI\
Mouse to the Right, `Ctrl + Shift + b` - Bookmark bar\
Mouse to the Left, `Alt + LeftArrow` - Go back\
`Alt + RightArrow` - Go forward\
`Ctrl + e`, `F2` - Command bar (make sure to be in a page that doesn’t override it)\
`Ctrl + b` - Panel\
`Ctrl + j` - Downloads

`Ctrl + PgUp/PgDn` - Switch between tabs\
`Ctrl + Shift + PgUp/PgDn` - Move tabs around

`Ctrl + q` - Cycle recently used tabs (`Ctrl` + `Tab` by default)\
`Ctrl + Shift + q` - Cycle recently used tabs in reverse order (`Ctrl` + `Shift` + `Tab` by default)

`Ctrl + t` - New tab\
`Ctrl + w` - Close tab\
`Ctrl + Shift + t` - Reopen closed tab\
`Ctrl + n` - New window\
`Ctrl + Shift + n` - New incognito window

### Vimium Extension

`?` - List of shortcuts

`i` - Insert Mode, or "Ignore Mode", as it ignores Vimium shortcuts and allows native site navigation\
`v` - Visual Mode\
`c` - Caret Mode when in Visual Mode, to move the cursor\
`Esc` - Leave Mode

`h/j/k/l`, `d`, `u`, `gg`, `G` - Work how you’d expect

`r` - Reload the page\
`/`, `n`, `N` - Search, working as expected

`yy` - Copy the URL

`f`, `F` - Opens anchor in the current/new tab (click and middle click)\
`o`, `O` - Browser search (web search, tabs, bookmarks, history) and open in current/new tab

`J`, `K` - Go to tab left/right (`Ctrl` + `PageUp`/`PageDown`)\
`H`, `L` - Go back/forward\
`^` - Jump to last used tab (like doing `Ctrl` + `q` in Vivaldi)

`x` - Close tab (`Ctrl` + `w`)\
`t` - New tab (`Ctrl` + `t`)\
`T` - Search tabs (`T` is like if `o` was filtered only for tabs)

## KDE

`Alt + Space`, `Alt + F2` - KRunner\
`Alt + F3` - Show KDE window menu (for when you're in Fullscreen or No Border)\
`Meta + Enter`, `Ctrl + Alt + t` - Open Konsole\
`Meta + c` - Resize window\
`Meta + v` - Move window\
`Meta + b` - Toggle window border\
`Ctrl + M`, `Ctrl + Shift + M` - Toggle menubar in KDE apps\
`Meta + Number` - Open an app from the task manager\
`Meta + w` - Overview effect (on newer versions of Plasma)\
`Meta + d` - Show desktop\
`Meta + ArrowKeys` - Pin window to a side of the screen\
`Meta + PgUp` - Maximize window\
`Meta + PgDn` - Minimize window\
`Meta + Space` - Switch keyboard layout

`Ctrl + Alt + F2-F6` - TTY (F1 is always the standard GUI)\
`Ctrl + Meta + ArrowKeys` - Move between virtual desktops\
`Meta + Tab` - Alt-tab through virtual desktops\
`Ctrl + F8` - Virtual desktop grid\
`Ctrl + F{Number}` - Go to virtual desktop {Number}\
`Ctrl + Alt + Esc` - Run `xkill` to kill a process with a window

### Spectacle

`PauseBreak`, `Shift + PrtScr` - Capture Current Monitor\
`Ctrl + Shift + PrtScr` - Capture Window Under Cursor\
`Ctrl + PrtScr` - Open Spectacle\
`PrtScr` - Capture Rectangluar Region\
To pin, export the rectangular region to qimgv and pin that window.

### Dolphin

`F2` - Rename\
`F4` - Open terminal inside of Dolphin\
`t`, `Shift + F4` - Open folder in terminal emulator\
`F9` - Toggle sidebar\
`F10` - New folder\
`Backspace` - Go back\
`Ctrl + Backspace`, `Alt + Up` - Go up\
`Ctrl + t` - New tab\
`Ctrl + w` - Close tab\
`Ctrl + h` - Show hidden files (the ones starting with .)

### Konsole

`Shift + ArrowUp/ArrowDown` - Move up or down\
`Shift + PgUp/PgDown` - Move up or down, but faster!\
`Shift + Home` - Go to start\
`Shift + End` - Go to end\
`Ctrl + Shift + f` - Search\
`Ctrl + Shift + t` - New tab\
`Ctrl + Shift + w` - Close tab

## Alacritty

`Shift + ArrowUp/ArrowDown` - Move up or down\
`Shift + PgUp/PgDown` - Move up or down, but faster!\
`Shift + Home` - Go to start\
`Shift + End` - Go to end\
`Ctrl + Shift + f` - Search\
`Ctrl + Shift + Space` - Vi mode

## Discord

Hold Shift when over a message to have more options.

`Ctrl + /` - Shortcut List\
`Alt + Up/Down` - Go through channels\
`Ctrl + Alt + Up/Down` - Go through servers\
`Ctrl + T (or Ctrl + K)` - Channel, Server or DM search (!!!)\
`Ctrl + F` - Search\
`Ctrl + S` - Stickers\
`Ctrl + G` - Gifs\
`Ctrl + E` - Emojis\
`Ctrl + Shift + M` - Mute\
`Ctrl + Shift + D` - Deafen

## Qtile

`Meta + h/j/k/l` - Move between windows\
`Meta + Space` - Go through windows\
`Meta + Shift + h/j/k/l` - Move windows around\
`Meta + Ctrl + h/j/k/l` - Change size of window\
`Meta + n` - Reset window sizes\
`Meta + Enter` - Spawn terminal\
`Meta + f` - Toggle floating for window\
`Meta + c`, `Meta + w`, `Alt + F4` - Kill window\
`Meta + Ctrl + r` - Reload Qtile config\
`Meta + Shift + r` - Restart Qtile\
`Meta + Ctrl + q` - Shutdown Qtile\
`Meta + r` - Open spawn prompt\
`Meta + Number` - Go to group {Number}\
`Meta + Shift + Number` - Move window to group {Number}\
`Meta + Shift + Enter` - Toggle stack splitting for column layout

<!-- `Meta + Tab` - Go through layouts\ -->
`Meta + Tab` - Go through groups\
`Alt + Tab` - Go through windows

## LazyGit

Just use `?` and `/` to search for the thing you need.\
Know that shortcuts are panel-based.\
For more info, see the LazyGit Notion page.

Notable shortcuts :\
`+` - Zoom into the current pane, useful for diffs\
`@` - Command log options

## `qimgv` Custom Shortcuts

`s` - Copy to special folder\
`u` - Upscale using my upscaler\
`a` - Convert to AVIF CRF 25\
`d` - Convert to AVIF CRF 19\
`w` - Convert to WEBP Q88 CL6\
`j` - Convert to JXL EFF7 DIST1\
`b` - Convert to JPEG\
`g` - Convert to PNG

## MusikCube

Alias set to `music`.

`1-6` - Sorting criteria\
`a` - Library, which includes browse, filter, tracks and play queue\
`Tab/Shift + Tab`, `u/o` - Change window\
`-/=` - Change volume\
`h/l` - Previous/next track\
`t` - All track search\
`/` - Global search\
`R` - Rate track (MusikCube only, not file system)\
`r` - Toggle repeat\
`w` - Toggle shuffle\
`Alt + Enter` - Context menu\
`Ctrl + r` - Rescan library\
`?` - Shortcuts\
`Ctrl + d` - Quit

## MangoHUD

`F11` - Toggle MangoHUD in a MangoHUD-attached game\
`F10` - Toggle FPS limit in a MangoHUD-attached game

## Notion

`Ctrl + p` - Global search\
`Ctrl + \` - Sidebar\
`Ctrl + Shift + Up/Down` - Move block up/down\
`Ctrl + e` - Inline code\
`Ctrl + Shift + e` - Inline equation\
`Ctrl + Shift + h` - Color text\
`Ctrl + o` - Voice dictation (very nice! it totally doesn't spy on you!)\
`Ctrl + j` - Ask AI, inline

## Obsidian

You can always open the keybinds menu and filter by assigned to see all of them.

`Ctrl + ,` - Settings\
`Ctrl + Shift + i` - Developer tools\
`Ctrl + r` - Reload Obsidian

`Ctrl` + `+/-/0` - Zoom UI in/out/reset\
`Ctrl` + `Scroll` - Zoom font

`Ctrl + p` - Quick switcher (file browser)\
`Ctrl + Shift + p` - Command palette\
`Ctrl + e` - Reading mode\
`Ctrl + Hover` - Link preview\
`Ctrl + ;` - Add property to file

`Alt + Enter` - Open link under cursor in the current tab (if unpinned)\
`Ctrl + Enter` - Open link under cursor in a new tab\
`Ctrl + PgUp/PgDn` - Previous/next tab\
`Ctrl + g` - Global graph view\
`Ctrl + Shift + g` - Local graph view\
`Ctrl + k` - Insert markdown link

`Ctrl + f` - Search file\
`Ctrl + Shift + r` - Search and replace in file\
`Ctrl + Shift + f` - Search whole vault

`Ctrl + Shift + Up/Down` - Move line up/down\
`Ctrl + Up/Down` - Add multi-cursor up/down\
`Ctrl + /` - Comment\
`Ctrl + l` - Toggle checkbox status

`Alt + Left` - Toggle left sidebar\
`Alt + Right` - Toggle right sidebar

`f` - Jump to link's flash jump\
`Ctrl + '` - Jump to link's link open\
`Ctrl + x` - Jump to link's regex search\
`Ctrl + h` - Homepage

`Ctrl + Num` - Wrapper - Foreground coloring\
`Ctrl + Shift + Num` - Wrapper - Background coloring\
`Alt + Num` - Wrapper - Special highlighting
