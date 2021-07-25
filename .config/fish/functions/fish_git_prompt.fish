function fish_git_prompt --description 'Prompt function for Git'
    # If git isn't installed, there's nothing we can do
    # Return 1 so the calling prompt can deal with it
    if not command -sq git
        return 1
    end
    set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
    test -n "$repo_info"
    or return

    set -l git_dir $repo_info[1]
    set -l inside_gitdir $repo_info[2]
    set -l bare_repo $repo_info[3]
    set -l inside_worktree $repo_info[4]
    set -q repo_info[5]
    and set -l sha $repo_info[5]

    set -l rbc (__fish_git_prompt_operation_branch_bare $repo_info)
    set -l r $rbc[1] # current operation
    set -l b $rbc[2] # current branch
    set -l detached $rbc[3]
    set -l dirtystate #dirty working directory
    set -l stagedstate #staged changes
    set -l invalidstate #staged changes
    set -l stashstate #stashes
    set -l untrackedfiles #untracked
    set -l c $rbc[4] # bare repository
    set -l p #upstream
    set -l informative_status

    set -q __fish_git_prompt_status_order
    or set -g __fish_git_prompt_status_order stagedstate invalidstate dirtystate untrackedfiles stashstate

    if not set -q ___fish_git_prompt_init
        # This takes a while, so it only needs to be done once,
        # and then whenever the configuration changes.
        __fish_git_prompt_validate_chars
        __fish_git_prompt_validate_colors
        set -g ___fish_git_prompt_init
    end

    set -l space "$___fish_git_prompt_color$___fish_git_prompt_char_stateseparator$___fish_git_prompt_color_done"

    # Use our variables as defaults, but allow overrides via the local git config.
    # That means if neither is set, this stays empty.
    #
    # So "!= true" or "!= false" are useful tests if you want to do something by default.
    set -l informative (command git config --bool bash.showInformativeStatus)

    set -l dirty (command git config --bool bash.showDirtyState)
    if not set -q dirty[1]
        set -q __fish_git_prompt_showdirtystate
        and set dirty true
    end
    # If we don't print these, there is no need to compute them.
    # Note: For now, staged and dirty are coupled.
    contains dirtystate $__fish_git_prompt_status_order
    or contains stagedstate $__fish_git_prompt_status_order
    or set dirty false

    set -l untracked (command git config --bool bash.showUntrackedFiles)
    if not set -q untracked[1]
        set -q __fish_git_prompt_showuntrackedfiles
        and set untracked true
    end
    contains untrackedfiles $__fish_git_prompt_status_order
    or set untracked false

    if test true = $inside_worktree
        # Use informative status if it has been enabled locally, or it has been
        # enabled globally (via the fish variable) and dirty or untracked are not false.
        #
        # This is to allow overrides for the repository.
        if test "$informative" = true
            or begin
                set -q __fish_git_prompt_show_informative_status
                and test "$dirty" != false
                and test "$untracked" != false
            end
            set informative_status (__fish_git_prompt_informative_status $git_dir)
            if test -n "$informative_status"
                set informative_status "$space$informative_status"
            end
        else
            # This has to be set explicitly.
            if test "$dirty" = true
                set dirtystate (__fish_git_prompt_dirty)
                if test -n "$sha"
                    set stagedstate (__fish_git_prompt_staged)
                else
                    set invalidstate 1
                end
            end

            if set -q __fish_git_prompt_showstashstate
                and test -r $git_dir/logs/refs/stash
                set stashstate 1
            end

            if test "$untracked" = true
                set untrackedfiles (__fish_git_prompt_untracked)
            end
        end

        if set -q __fish_git_prompt_showupstream
            or set -q __fish_git_prompt_show_informative_status
            set p (__fish_git_prompt_show_upstream)
        end
    end

    set -l branch_color $___fish_git_prompt_color_branch
    set -l branch_done $___fish_git_prompt_color_branch_done
    if set -q __fish_git_prompt_showcolorhints
        if test $detached = yes
            set branch_color $___fish_git_prompt_color_branch_detached
            set branch_done $___fish_git_prompt_color_branch_detached_done
        end
    end

    set -l f ""
    for i in $__fish_git_prompt_status_order
        if test -n "$$i"
            set -l color_var ___fish_git_prompt_color_$i
            set -l color_done_var ___fish_git_prompt_color_{$i}_done
            set -l symbol_var ___fish_git_prompt_char_$i

            set -l color $$color_var
            set -l color_done $$color_done_var
            set -l symbol $$symbol_var

            set f "$f$color$symbol$color_done"
        end
    end

    set b (string replace refs/heads/ '' -- $b)
    set -q __fish_git_prompt_shorten_branch_char_suffix
    or set -l __fish_git_prompt_shorten_branch_char_suffix "…"
    if string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"; and test (string length "$b") -gt $__fish_git_prompt_shorten_branch_len
        set b (string sub -l "$__fish_git_prompt_shorten_branch_len" "$b")"$__fish_git_prompt_shorten_branch_char_suffix"
    end
    if test -n "$b"
        set b "$branch_color$b$branch_done"
    end

    if test -n "$c"
        set c "$___fish_git_prompt_color_bare$c$___fish_git_prompt_color_bare_done"
    end
    if test -n "$r"
        set r "$___fish_git_prompt_color_merging$r$___fish_git_prompt_color_merging_done"
    end
    if test -n "$p"
        set p "$___fish_git_prompt_color_upstream$p$___fish_git_prompt_color_upstream_done"
    end

    # Formatting
    if test -n "$f"
        set f "$space$f"
    end
    set -l format $argv[1]
    if test -z "$format"
        set format " (%s)"
    end

    printf "%s$format%s" "$___fish_git_prompt_color_prefix" "$___fish_git_prompt_color_prefix_done$c$b$f$r$p$informative_status$___fish_git_prompt_color_suffix" "$___fish_git_prompt_color_suffix_done"
end
