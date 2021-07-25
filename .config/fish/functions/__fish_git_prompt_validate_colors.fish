function __fish_git_prompt_validate_colors --description 'fish_git_prompt helper, checks color variables'

    # Base color defaults to nothing (must be done first)
    __fish_git_prompt_set_color __fish_git_prompt_color '' ''

    # Normal colors
    __fish_git_prompt_set_color __fish_git_prompt_color_prefix
    __fish_git_prompt_set_color __fish_git_prompt_color_suffix
    __fish_git_prompt_set_color __fish_git_prompt_color_bare
    __fish_git_prompt_set_color __fish_git_prompt_color_merging
    __fish_git_prompt_set_color __fish_git_prompt_color_cleanstate
    __fish_git_prompt_set_color __fish_git_prompt_color_invalidstate
    __fish_git_prompt_set_color __fish_git_prompt_color_upstream

    # Colors with defaults with showcolorhints
    if set -q __fish_git_prompt_showcolorhints
        __fish_git_prompt_set_color __fish_git_prompt_color_flags (set_color --bold blue)
        __fish_git_prompt_set_color __fish_git_prompt_color_branch (set_color green)
        __fish_git_prompt_set_color __fish_git_prompt_color_dirtystate (set_color red)
        __fish_git_prompt_set_color __fish_git_prompt_color_stagedstate (set_color green)
    else
        __fish_git_prompt_set_color __fish_git_prompt_color_flags
        __fish_git_prompt_set_color __fish_git_prompt_color_branch
        __fish_git_prompt_set_color __fish_git_prompt_color_dirtystate $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
        __fish_git_prompt_set_color __fish_git_prompt_color_stagedstate $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
    end

    # Branch_detached has a default, but is only used with showcolorhints
    __fish_git_prompt_set_color __fish_git_prompt_color_branch_detached (set_color red)

    # Colors that depend on flags color
    __fish_git_prompt_set_color __fish_git_prompt_color_stashstate $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
    __fish_git_prompt_set_color __fish_git_prompt_color_untrackedfiles $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done

end
