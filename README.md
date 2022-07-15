# .dotfiles
Linux config dotfiles for easier setup.

It's recommended to clone this repo into `~/.dotfiles`, \
and to make symbolic links to the files in the cloned repository.\
To do that, just run `./sync.sh`.

`TODO:` The script needs to be able to sync with already existing configs, test this out!!!!!!

# The Shortcuts
`Make sure these are up to date!`

The point of this is to make sure all of the shortcuts that I use (both default and custom) are consistent across the environments, to avoid confusion.

## TMUX
`Ctrl + a + d` - Detach session\
`Ctrl + a + v` - Split vertically\
`Ctrl + a + h` - Split horizontally\
`Ctrl + a + c` - Create window\
`Alt + ArrowKeys`, `Ctrl + a + ArrowKeys` (TTY) - Switch between panes\
`Ctrl + PgUp/PgDn` - Switch between windows\
`Ctrl + a + (/)` - Switch between sessions\
`Ctrl + a + {Number}` - Switch to window {Number}\
`Ctrl + a + q` - Show pane numbers. You can switch to a specific pane with `Ctrl + a + q + {Number}`\
`Ctrl + a + {/}` - Move pane\
`Ctrl + a + Ctrl + ArrowKeys` - Resize pane\
`Ctrl + a + x` - Soft kill pane - needs confirmation\
`Ctrl + a + &` - Soft kill window - needs confirmation\
(You can also hard kill a pane or window with the kill shell shortcut `Ctrl + d`)

`Ctrl + a + s` - Session overview (useless)\
`Ctrl + a + w` - Window and session overview (useless)\
`Ctrl + a + $` - Rename session\
`Ctrl + a + ,` - Rename window

`Ctrl + a + z` - Fullscreen pane (zoom)\
`Ctrl + a + t` - Big ass clock\
`Ctrl + a + ?` - Show all commands, including your config changes\
`Ctrl + a + I` - Install plugins with tpm

TODO: Ctrl + a + a to be the current Ctrl + a + w, don't use Ctrl + a + s ever, and have Ctrl + a + w close the window, and Ctrl + a + q close the whole session - that way it's consistent everywhere, just find a different shortcut for the number layout.\
TODO: Also find a better way to move panes around, maybe something like Ctrl + a + ArrowKeys, since that isn't used anymore. See how it's done in VSCode first though.\
TODO: Maybe Ctrl + a + e can kill the pane? So that it's like Ctrl + a + {q for session, w for window, e for pane}?\
TODO: Have a different system for switching between sessions
TODO: Ctrl + t can open a new window?

## NeoVim - Window Navigation in Normal Mode
`Ctrl + w + v` - Split vertically\
`Ctrl + w + s` - Split horizontally\ -- TODO: Change over to `Ctrl + w + h`
`Ctrl + w + w` - Go through windows\
`Ctrl + w + q` - Close window (not a buffer)\
`Ctrl + w + ArrowKeys` - Move through windows\
`Ctrl + w + r` - Shuffle windows\
`Ctrl + w + =` - Reset window dimensions\

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

### TODO - See `keybindings.json`

`Ctrl + Alt + b` - Toggle Activity Bar (far left)\
`Ctrl + Alt + s` - Toggle Status Bar (far bottom)

## Vivaldi

## KDE
`Meta + Enter`, `Ctrl + Alt + t` - Open Konsole\
`Meta + b` - Toggle window border\
...