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
    set fish_color_normal ffffff
    set fish_color_param d75fd7
    set fish_color_quote 5fdf5f

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
