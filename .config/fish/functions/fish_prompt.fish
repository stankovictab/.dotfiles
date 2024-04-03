# TODO: Think about seperating this into a script, because all of this only needs to be run once, not every time fish starts up. But on the other hand, I can't really notice a slowdown, maybe because fish is smart and doesn't do all of these things on startup.

# MGZ Theme
# Values are set in the fish_variables file, for explanations, see https://fishshell.com/docs/current/interactive.html
# If you don't want to mess with \x2d, etc, you can do something like
# set fish_pager_color_background --background=white

set fish_color_cancel red # Color of Ctrl + c in command, was \x2d\x2dreverse
set fish_color_command 2adede # Like git, was 39BAE6
set fish_color_comment 658595 # Comment, was 626A73
set fish_color_cwd 2adede # 4e79f0 # The pwd color, was magenta and 59C2FF
set fish_color_cwd_root red # The pwd color when root
set fish_color_end F29668 # The ; and &
set fish_color_error red # Syntax error, like unknown command, was FF3333
set fish_color_escape 4e79f0 # 8edfff # Escapes like \n, should be the same color as param and path, was 95E6CB
set fish_color_keyword 58f5ab # Keywords like if, defaults to command color if \x1d, was \x1d
set fish_color_match red # ???, was f07178
set fish_color_normal white # Text
set fish_color_operator 8edfff # Parameter expansion operators, like * and ~ (colors the ~ in cd ~/..., so I set the same color as param), was E6B450
set fish_color_option 4e79f0 # Like -i in ffmpeg -i, was \x1d
set fish_color_param 8ed4ff # Like commit in git commit, was d75fd7
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
set fish_pager_color_prefix 8edfff # Color of the first matching letters of tabbed parameter, was normal\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set fish_pager_color_progress 955ae7 --bold # Color of the progress in bottom left, was brwhite\x1e\x2d\x2dbackground\x3dcyan
set fish_pager_color_selected_background --background=0D1A3A # Color of selection of tab element background, was \x2d\x2dbackground\x3dE6B450
# set fish_kube_color ffffff \x2d\x2dbackground\x3d135381
set fish_kube_color a25dfc \x2d\x2dbackground\x3d281641
set fish_kube_color_alt 281641 # #852aa7 #a25dfc #281641

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    # Display the blue dot only if there are unstaged changes (if there's anything in the ordinary diff)
    echo (command git diff 2> /dev/null)
end

function _does_git_have_staged
    # Display the green dot only if there are staged changes (if there's anything in diff --cached)
    echo (command git diff --cached)
end

function _does_git_have_stashed
    # Display stash info only if there is something in git stash
    echo (command git stash list)
end

function _git_ahead_count -a branch_name
    echo (command git log origin/$branch_name..HEAD 2> /dev/null | \
	  grep '^commit' | wc -l | tr -d ' ')
end

function fish_prompt
    if [ (_git_branch_name) ] # If in a git repo
        set -l git_branch_name (_git_branch_name)
        set -l git_ahead_count (_git_ahead_count $git_branch_name)
        set -l branch_color (set_color -o white)
        set git_info "$branch_color 󰘬 $git_branch_name"

        if [ (_is_git_dirty) ]
            set -l blue (set_color -o $fish_color_param)
            set git_info "$git_info$blue "
        end

        if [ (_does_git_have_staged) ]
            set -l green (set_color -o $fish_color_quote)
            set git_info "$git_info$green "
        end

        if [ (_does_git_have_stashed) ]
            set -l yellow (set_color -o $fish_color_selection)
            set git_info "$git_info$yellow (stash)"
        end

        if [ $git_ahead_count != 0 ]
            set -l green (set_color -o $fish_color_quote)
            set -l normal (set_color normal)
            set -l ahead_count "$green+$git_ahead_count$normal"
            set git_info "$git_info $ahead_count"
        end
    end

    ###

    if command -v kubectl >/dev/null
        set kube "󰠳"
        # TODO: Note that this will print out an ugly message if there is no context, and kubectl is installed
        set kube_context (kubectl config current-context | awk -F'/' '{print $NF}')
        if test -z "$kube_context"
            set kube_context "Not Connected"
        end
        set kube "$kube $kube_context"
        set_color $fish_kube_color_alt
        printf ''
        set_color -o $fish_kube_color
        printf "$kube"
        set_color normal # To reset the background
        set_color $fish_kube_color_alt
        printf ' '
        set_color normal
    end

    if fish_is_root_user # Root user check
        set_color -o $fish_color_cwd_root
    else
        set_color -o $fish_color_cwd
    end
    set -g fish_prompt_pwd_dir_length 0 # A new way of doing things
    printf '%s' (prompt_pwd)
    set_color normal
    printf $git_info
    set_color normal

    echo
    # tput colors check is to see if we're in a color terminal or tty
    # $VIM check is for the NeoVim builtin terminal, which doesn't have good emoji support it seems
    if [ (tput colors) = 256 -a "$VIM" = '' ]
        if fish_is_root_user # Root user check
            printf '💀 '
        else
            printf '🦩 '
        end
    else
        printf '> '
    end
end

function fish_right_prompt
    set -l st $status

    if [ $st != 0 ]
        echo (set_color red) 󱐋 $st(set_color normal)
    end
end
