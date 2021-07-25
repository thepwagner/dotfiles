function __fish_git_prompt_operation_branch_bare --description 'fish_git_prompt helper, returns the current Git operation and branch'
    # This function is passed the full repo_info array
    set -l git_dir $argv[1]
    set -l inside_gitdir $argv[2]
    set -l bare_repo $argv[3]
    set -q argv[5]
    and set -l sha $argv[5]

    set -l branch
    set -l operation
    set -l detached no
    set -l bare
    set -l step
    set -l total

    if test -d $git_dir/rebase-merge
        set branch (cat $git_dir/rebase-merge/head-name 2>/dev/null)
        set step (cat $git_dir/rebase-merge/msgnum 2>/dev/null)
        set total (cat $git_dir/rebase-merge/end 2>/dev/null)
        if test -f $git_dir/rebase-merge/interactive
            set operation "|REBASE-i"
        else
            set operation "|REBASE-m"
        end
    else
        if test -d $git_dir/rebase-apply
            set step (cat $git_dir/rebase-apply/next 2>/dev/null)
            set total (cat $git_dir/rebase-apply/last 2>/dev/null)
            if test -f $git_dir/rebase-apply/rebasing
                set branch (cat $git_dir/rebase-apply/head-name 2>/dev/null)
                set operation "|REBASE"
            else if test -f $git_dir/rebase-apply/applying
                set operation "|AM"
            else
                set operation "|AM/REBASE"
            end
        else if test -f $git_dir/MERGE_HEAD
            set operation "|MERGING"
        else if test -f $git_dir/CHERRY_PICK_HEAD
            set operation "|CHERRY-PICKING"
        else if test -f $git_dir/REVERT_HEAD
            set operation "|REVERTING"
        else if test -f $git_dir/BISECT_LOG
            set operation "|BISECTING"
        end
    end

    if test -n "$step" -a -n "$total"
        set operation "$operation $step/$total"
    end

    if test -z "$branch"
        if not set branch (command git symbolic-ref HEAD 2>/dev/null)
            set detached yes
            set branch (switch "$__fish_git_prompt_describe_style"
						case contains
							command git describe --contains HEAD
						case branch
							command git describe --contains --all HEAD
						case describe
							command git describe HEAD
						case default '*'
							command git describe --tags --exact-match HEAD
						end 2>/dev/null)
            if test $status -ne 0
                # Shorten the sha ourselves to 8 characters - this should be good for most repositories,
                # and even for large ones it should be good for most commits
                if set -q sha
                    set branch (string match -r '^.{8}' -- $sha)…
                else
                    set branch unknown
                end
            end
            set branch "($branch)"
        end
    end

    if test true = $inside_gitdir
        if test true = $bare_repo
            set bare "BARE:"
        else
            # Let user know they're inside the git dir of a non-bare repo
            set branch "GIT_DIR!"
        end
    end

    echo $operation
    echo $branch
    echo $detached
    echo $bare
end
