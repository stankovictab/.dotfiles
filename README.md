# .dotfiles

Linux config dotfiles for easier setup.

Clone this repo into `~/.dotfiles`, and make symlinks to the configs with `./sync.sh`.

TODO: Sync up the bashrc, zshrc and fish config to the super user folder

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

## TMUX

TODO: Is there a way to not let go of the prefix while doing the key chord? The `bind -n C-a-C-g` doesn't seem to work.

`Ctrl + t`, `Ctrl + a + t` - New window\
`Ctrl + a + v` - Split vertically\
`Ctrl + a + h` - Split horizontally\
`Alt + ArrowKeys`, `Ctrl + a + ArrowKeys` (TTY) - Switch between panes\
`Ctrl + PgUp/PgDn` - Switch between windows\
`Ctrl + a + (/)` - Switch between sessions\
`Ctrl + a + {Number}` - Switch to window {Number}\
`Ctrl + a + f` - Show pane numbers. You can switch to a specific pane with `Ctrl + a + f + {Number}`\
`Ctrl + Alt + Left/Right`, `Ctrl + a + {/}` - Swap pane with previous/next position\
`Ctrl + a + Ctrl + ArrowKeys` - Resize pane

`Ctrl + a + d` - Detach session\
`Ctrl + a + e`, `Ctrl + d` (kill shell only) - Kill pane\
`Ctrl + a + w` - Kill window\
`Ctrl + a + q` - Kill session

`Ctrl + a + :` - Enter command mode\
`Ctrl + a + a` - Window overview\
(there is no pane overview, so you'll have to expand the panes in the tree)\
`Ctrl + a + . + Number` - Move window to position {Number}
`Ctrl + a + s` - Rename session\
`Ctrl + a + x` - Rename window\

`Ctrl + a + z` - Fullscreen pane (zoom)\
`Ctrl + a + c` - Big ass clock\
`Ctrl + a + ?` - Show all commands, including your config changes\
`Ctrl + a + I` - Install plugins with tpm

## NeoVim - Window Navigation in Normal Mode

`Ctrl + w + v` - Split vertically\
`Ctrl + w + s` - Split horizontally -- TODO: Change over to `Ctrl + w + h`\
`Ctrl + w + w` - Go through windows\
`Ctrl + w + q` - Close window (not a buffer)\
`Ctrl + w + ArrowKeys` - Move through windows\
`Ctrl + w + r` - Shuffle windows\
`Ctrl + w + =` - Reset window dimensions

`Ctrl + q` - Close buffer (and the window)\
`Ctrl + ArrowKeys`, `Tab + ArrowKeys` (TTY) - Move through buffers\
`Ctrl + Shift + ArrowKeys` - Move buffers in bufferline

`Tab + ,` - Open config file\
`Tab + p`, `Tab + ff`, `Ctrl + p` - Open Telescope file search\
`Tab + fg` - Open Telescope live grep\
`Tab + fb` - Open Telescope buffer search

`Ctrl + b` - Toggle file explorer (NvimTree)\
`Ctrl + /` - Toggle comment

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
`Ctrl + e`, `F2` - Command bar (make sure to be in a page that doesn???t override it)\
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
`Meta + PgDn` - Minimize window

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
`Ctrl + E` - Emojis