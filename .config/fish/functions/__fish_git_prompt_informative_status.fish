function __fish_git_prompt_informative_status
    set -l stashstate 0
    set -l stashfile "$argv[1]/logs/refs/stash"
    if set -q __fish_git_prompt_showstashstate; and test -e "$stashfile"
        set stashstate (count < $stashfile)
    end

    # Use git status --porcelain.
    # This uses the "normal" untracked mode so untracked directories are considered as 1 entry.
    # It's quite a bit faster and unlikely anyone cares about the number of files if it's *all* of the files
    # in that directory.
    # The v2 format is better, but we don't actually care in this case.
    set -l stats (string sub -l 2 (git status --porcelain -z -unormal | string split0))
    set -l invalidstate (string match -r '^UU' $stats | count)
    set -l stagedstate (string match -r '^[ACDMR].' $stats | count)
    set -l dirtystate (string match -r '^.[ACDMR]' $stats | count)
    set -l untrackedfiles (string match -r '^\?\?' $stats | count)

    set -l info

    # If `math` fails for some reason, assume the state is clean - it's the simpler path
    set -l state (math $dirtystate + $invalidstate + $stagedstate + $untrackedfiles + $stashstate 2>/dev/null)
    if test -z "$state"
        or test "$state" = 0
        if test -n "$___fish_git_prompt_char_cleanstate"
            set info $___fish_git_prompt_color_cleanstate$___fish_git_prompt_char_cleanstate$___fish_git_prompt_color_cleanstate_done
        end
    else
        for i in $__fish_git_prompt_status_order
            if [ $$i != 0 ]
                set -l color_var ___fish_git_prompt_color_$i
                set -l color_done_var ___fish_git_prompt_color_{$i}_done
                set -l symbol_var ___fish_git_prompt_char_$i

                set -l color $$color_var
                set -l color_done $$color_done_var
                set -l symbol $$symbol_var

                set -l count

                if not set -q __fish_git_prompt_hide_$i
                    set count $$i
                end

                set info "$info$color$symbol$count$color_done"
            end
        end
    end

    echo $info

end
