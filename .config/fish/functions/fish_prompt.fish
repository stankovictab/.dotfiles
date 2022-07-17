# MGZ Theme
# Values are set in the fish_variables file, for explanations, see https://fishshell.com/docs/current/interactive.html
# If you don't want to mess with \x2d, etc, you can do something like
# set fish_pager_color_background --background=white

set fish_color_cancel red # Color of Ctrl + c in command, was \x2d\x2dreverse
set fish_color_command 2adede # Like git, was 39BAE6
set fish_color_comment 658595 # Comment, was 626A73
set fish_color_cwd 955ae7 # The pwd color, was 59C2FF
set fish_color_cwd_root red # The pwd color when root
set fish_color_end F29668 # The ; and &
set fish_color_error red # Syntax error, like unknown command, was FF3333
set fish_color_escape 4e79f0 # Escapes like \n, was 95E6CB
set fish_color_keyword 58f5ab # Keywords like if, defaults to command color if \x1d, was \x1d
set fish_color_match red # ???, was f07178
set fish_color_normal white # Text
set fish_color_operator 8bd4ff # ??? Parameter expansion operators, like * and ~ (colors the ~ in cd ~/..., so I set the same color as param), was E6B450
set fish_color_option 4e79f0 # Like -i in ffmpeg -i, was \x1d
set fish_color_param 8bd4ff # Like commit in git commit, was d75fd7
set fish_color_quote 58f5ab # Strings
set fish_color_redirection FFEE99 # IO redirects, like >/dev/null
set fish_color_search_match \x2d\x2dbackground\x3d0D1A3A # was \x2d\x2dbackground\x3dE6B450
set fish_color_selection yellow # Selected text in vi visual mode, was \x2d\x2dbackground\x3dE6B450
set fish_color_status red # Error status color in right prompt
# TODO: This doesn't change whatever I do
set fish_color_valid_path \x2d\x2dunderline # Valid path, defaults to param, was \x2d\x2dunderline
set fish_greeting \x1d # Welcoming message
# Pager is the menu when you tab to see all arguments of a command
set fish_pager_color_background \x1d # Background of the whole pager, was \x1d
set fish_pager_color_completion normal # Color of items in table, and the parenthesis, was normal
set fish_pager_color_description 4e79f0 # Color of the description inside parenthesis, was \x1d
set fish_pager_color_prefix 8bd4ff # Color of the first matching letters of tabbed parameter, was normal\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set fish_pager_color_progress 955ae7 --bold # Color of the progress in bottom left, was brwhite\x1e\x2d\x2dbackground\x3dcyan
set fish_pager_color_selected_background --background=000000 # Color of selection of tab element background, was \x2d\x2dbackground\x3dE6B450

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _does_git_have_staged
    echo (command git diff --cached)
end

function _git_ahead_count -a branch_name
    echo (command git log origin/$branch_name..HEAD 2> /dev/null | \
	  grep '^commit' | wc -l | tr -d ' ')
end

function fish_prompt
    set -l normal (set_color normal)
    set -l yellow (set_color -o yellow)
    set -l salmon (set_color -o $fish_color_end)
    set -l green (set_color -o $fish_color_quote)
    set -l blue (set_color -o brblue)

    if [ (_git_branch_name) ] # If in a git repo
        set -l git_branch_name (_git_branch_name)
        set -l git_ahead_count (_git_ahead_count $git_branch_name)
        set git_info "$salmon שׂ $git_branch_name"

        if [ (_is_git_dirty) ]
            set git_info "$git_info$yellow "
        end

        if [ (_does_git_have_staged) ]
            set git_info "$git_info$blue "
        end

        if [ $git_ahead_count != 0 ]
            set -l ahead_count "$green+$git_ahead_count$normal"
            set git_info "$git_info $ahead_count"
        end
    end

    set_color -o $fish_color_cwd
    printf '%s' (prompt_pwd -d 0)
    set_color normal
    printf $git_info
    set_color normal

    echo
    # tput colors check is to see if we're in a color terminal or tty
    # $VIM check is for the Vim terminal, which doesn't have good emoji support
    if [ $(tput colors) = 256 -a "$VIM" = '' ]
        if [ "$EUID" -ne 0 ] # Root user check
            printf '🦩 '
        else
            printf '💀 '
        end
    else
        printf '> '
    end
end

function fish_right_prompt
    set -l st $status

    if [ $st != 0 ]
        echo (set_color red)  $st(set_color normal)
    end
end
