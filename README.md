# .dotfiles

Linux config dotfiles for easier setup.

Clone this repo into `~/.dotfiles`, and make symlinks to the configs with `./sync.sh`.

# The Shortcuts

`Make sure these are up to date!`

The point of this is to make sure all of the shortcuts that I use (both default and custom) are consistent across the environments, to avoid confusion.

## Universal Shell Shortcuts

`Ctrl + d` - Kill shell (but not when a process is running)\
`Ctrl + l` - Clear whole terminal\
`Ctrl + u` - Clear line\
`Ctrl + r` - Search history of commands by query in prompt\
`Ctrl + c` - Stop program or prompt line\
`Ctrl + z` - Suspend program (to go back, use `fg` command)\
`Ctrl + Shift + c` - Copy selected text\
`Ctrl + Shift + v`, `Ctrl + v`, `Shift + Insert` - Paste text

## Zellij

> Current conflicts with NeoVim :\
> (Not a big problem) `Ctrl + t` is the tag stack\
> (Ctrl + a now) `Ctrl + s` is save\
> (It's fine? If I'm in zellij I'll use it, if not I have floating panes) `Ctrl + n` is the terminal plugin - either remove or bind to `Tab + t`\
> (Ctrl + e now) `Ctrl + h` is moving to the left NeoVim pane, and deleting the word to the left\
> (Ctrl + y now) `Ctrl + o` is the jump list\
> (Unbound) `Ctrl + b` is NvimTree, so probably make Tmux mode to be Ctrl + a?\
> (How it stands now is fine, if you need to move lines around, just go into Lock mode) `Alt + h/j/k/l` is moving lines up/down and characters left/right - this can be fixed if I use the same shortcut for moving through the NeoVim panes if the plugin exists, so I'd use Ctrl+hjkl for moving between all panes, and free up Alt+hjkl for NeoVim. *NOTE* - Lilja/zellij.nvim exists, it does escape from nvim to zellij, but you can't move between nvim panes themselves, as zellij overrides that still, for now, so zellij needs to do some sort of check to see whether it's in a nvim environment, but that's on the devs to figure out.\
> !!! Available :\
> ctrl+e, ctrl+y, ctrl+\[, ctrl+\], ctrl+\\, ctrl+a, ctrl+;, ctrl+'

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
-> `s` - Toggle synced tab (all input will be the same on all panes of the tab)\
-> `Tab` - Cycle through tabs (kinda?)\
`Ctrl + n` - Resize mode\
-> `+/-` - Increase / decrease the size of the pane\
-> `h/j/k/l` - Resize the pane in a direction\
`Ctrl + e` - Panel move mode\
`Ctrl + a` - Search & Copy mode\
-> `k/j`, `PgUp/PgDn`, `u,d` - Scroll up / down\
-> `e` - Open scrollback in the default editor\
-> `s` - Search, with `n` and `p` moving between them, `c` toggling case sensitivity and `w` toggling wrapping when going through results\
`Ctrl + y` - Session mode\
-> `d` - Detach session\

`Alt + h/j/k/l` - Move between panes\
`Alt + n` - New pane\
`Alt + +/-` -  Increase / decrease the size of the pane

Note that the Tmux mode is unbound, don't need it.\
Also don't need the `Ctrl + q` to quit, since I have Ctrl + d.

## TMUX

`t`, `ta`, `td`, `tls`, `tks` - Fish shell aliases

`Ctrl + a + Shift + i` - Install plugins with tpm (make sure you git cloned tpm)
`Ctrl + a + r` - Refresh config

`Ctrl + t`, `Ctrl + a + t` - New window\
`Ctrl + a + v` - Split vertically\
`Ctrl + a + h` - Split horizontally\
`Alt + ArrowKeys`, `Ctrl + a + ArrowKeys` (TTY) - Switch between panes\
`Ctrl + Shift + PgUp/PgDn` - Switch between windows\
`Ctrl + a + (/)` - Switch between sessions\
`Ctrl + a + {Number}` - Switch to window {Number}\
`Ctrl + a + f` - Show pane numbers. You can switch to a specific pane with `Ctrl + a + f + {Number}`\
`Ctrl + Alt + Left/Right`, `Ctrl + a + {/}` - Swap pane with previous/next position\
`Ctrl + a + Ctrl + ArrowKeys` - Resize pane

`Ctrl + a + d` - Detach session and return to native terminal shell\
`Ctrl + a + e`, `Ctrl + d` (kill shell only) - Kill pane\
`Ctrl + a + w` - Kill window\
`Ctrl + a + q` - Kill session

`Ctrl + a + :` - Enter command mode\
`Ctrl + a + a` - Window overview\
(there is no pane overview, so you'll have to expand the panes in the tree)\
`Ctrl + a + . + Number` - Move window to position {Number}\
`Ctrl + a + s` - Rename session\
`Ctrl + a + x` - Rename window\

`Ctrl + a + z` - Fullscreen pane (zoom)\
`Ctrl + a + c` - Big ass clock\
`Ctrl + a + ?` - Show all commands, including your config changes\

## NeoVim

`Ctrl + c` - A faster `Esc`\
`Tab + ,` - Open config files location\
`Tab + f` - Open Telescope file search\
`Tab + g` - Open Telescope live grep\
`Tab + b` - Open Telescope buffer search\
`Tab + l + g` - Open LazyGit\
`Ctrl + n` - Open integrated terminal

`Ctrl + q` - Save and close window (and/or quit NeoVim), same as :wq\
`Ctrl + w` - Close buffer\
`Ctrl + h/j/k/l` - Cycle between windows visible on the screen\
`Shift + j/k`, `Ctrl + PgUp/PgDn` - Cycle between buffers for the current window\
`Tab + s + h` - Split horizontally\
`Tab + s + v` - Split vertically\
`Space` - Reset window sizes\
`Ctrl + ArrowKeys` - Resize current window\
`Ctrl + Shift + PgUp/PgDn` - Move buffers in bufferline

`Shift + h/l` - Go to beginning / end of line\
`Ctrl + /` - Toggle comment\
`Ctrl + f` - Format document\
`Ctrl + s` - Save (and exit Insert, Visual or Command Mode)\
`/` - Search\
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
`Alt + j/k/Up/Down` - Move lines around (works with selected blocks in Visual mode too)\
`Alt + d` - Duplicate line\
`w`, `W` - Move forward / backward by word\
`+`, `-` - Increment / decrement number under cursor\
`Shift + p` - Paste without changing the register\
`; + t/e/g/j/k/l/m/n` - Telescope main menu (`t`), and search for emoji, gitmoji, julia, kaomoji, latex, math and Nerd Font symbols\
`gf` - Go to file under cursor\
`gx` - Open file or URL under cursor with system application

`Tab` - Copilot - Accept suggestion\
`Alt + [` - Copilot - Previous suggestion\
`Alt + ]` - Copilot - Next suggestion\
`Ctrl + ]` - Copilot - Clear suggestion

`:cd` - Change working directory for NeoVim and NvimTree\
`:e` - Edit another file

### NvimTree - File Browser in the Sidebar

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
`Ctrl + v` - Open selected file in a vertical split
`g?` - Show shortcuts\

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

`Ctrl + t` - New tab\
`Ctrl + w` - Close tab\
`Ctrl + Shift + t` - Reopen closed tab\
`Ctrl + n` - New window\
`Ctrl + Shift + n` - New incognito window

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

## Dolphin

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

## Konsole

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

## Notion

`Ctrl + p` - Global search\
`Ctrl + \` - Sidebar\
`Ctrl + Shift + Up/Down` - Move block up/down\
`Ctrl + e` - Code\
`Ctrl + Shift + e` - Inline equation

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

`h/l` - Go to previous/next panel\
`j/k` - Go to previous/next line\
`Ctrl + d/u`, `Shift + j/k` - Move line up/down\
`x` - Menu with all the shortcuts (useful!)\
`a` - Add (stage) all files\
`Space` - Add (stage) current file\
`c` - Commit staged files\
`C` - Commit staged files, write the message via the editor\
`R` - Refresh local repo for changes\
`f` - Fetch changes from remote repo\
`p` - Pull changes from remote repo\
`P` - Push changes to remote repo\
`S` - Stash menu\
`e`, `o` - Edit or open selected file
