# Qtile config file
# Note - If the config file has errors, Qtile won't update

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4" # Meta key
terminal = guess_terminal() # Guesses alacritty by default, works fine

# Keybindings
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating for window"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(['mod1'], "F4", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "Tab", lazy.screen.next_group(), desc="Go through groups"), # TODO: How to avoid empty ones?
    Key([mod, "control"], "Left", lazy.screen.prev_group(), desc="Go through groups"),
    Key([mod, "control"], "Right", lazy.screen.next_group(), desc="Go through groups"),
    Key(["mod1"], "Tab", lazy.group.next_window(), desc="Go through windows"),
]

# TODO: Groups can be hidden when empty, see Groups in the docs
groups = [Group(i) for i in "1234"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="Move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        # If border_x elements are a list, there'll be more colors in the border
        border_focus="#076090", # Active window border
        border_focus_stack="#037331", # Active column stack border
        border_normal="#000000", # Inactive window border TODO: How to disable?
        border_normal_stack="#220000", # Inactive column stack border
        border_width=2,
        grow_amount=2, # Resize amount in pixels
        insert_position=1, # Insert new windows below the current one
        margin=5, # Margin around windows (gap),
        border_on_single=False, # Whether to render border when 1 window is opened
        margin_on_single=False, # Whether to render margin when 1 window is opened
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    # The Floating layout isn't defined here, see below
]

# Settings for bar widgets
widget_defaults = dict(
    font="Hack NF", # Default is sans
    fontsize=10,
    padding=2,
)

# Settings for extensions (copies widget settings)
extension_defaults = widget_defaults.copy()

# The Bar
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox( # Group list
                    disable_drag=True,
                    active="#ffffff", # Color of a populated group
                    block_highlight_text_color="#2ADEDE", # Color of current group
                    borderwidth=0,
                ),
                widget.CurrentLayout(
                    foreground="#1BABFF"
                ),
                widget.Prompt( # Spawn command input, hidden until provoked
                    foreground="#955AE7"
                ),
                widget.WindowName(
                    foreground="#ffffff"
                ),
                widget.Chord( # TODO: ?
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("todor picka najveca", foreground="#d75f5f", scroll=True, width=70, scroll_delay=1, scroll_step=1, scroll_interval=0.05),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(), # System tray for apps
                widget.Memory(),
                # widget.MemoryGraph(
                #     type='line',
                #     line_width=1,
                # ),
                widget.Volume(
                    # TODO: Borked, needs setup
                    emoji=True,
                ),
                widget.Clock(format="%a %d-%m-%Y %H:%M"),
            ],
            20, # Height of bar
            # border_width=[5, 0, 5, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]
        ),
        wallpaper="~/Pictures/venti-views-bS5OwMjMc1I-unsplash.jpg", # No need for nitrogen
        wallpaper_mode="fill",
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True # Whether focus follows mouse hovering over windows
bring_front_click = True # Whether clicking on a window brings it up
cursor_warp = False

# The Floating layout is defined here
floating_layout = layout.Floating(
    border_focus="#333333",
    border_normal="#000000",
    border_width=1,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# TODO: Some weird default setting for Java apps
# It was "LG3D" by default, but I didn't like how that looks in neofetch
wmname = "qtile"
