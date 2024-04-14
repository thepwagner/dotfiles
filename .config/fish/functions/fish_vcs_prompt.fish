function fish_vcs_prompt --description 'Print the prompts for all available vcsen'
    set IGNORED_REPOS mycloud
    if not contains (basename $PWD) $IGNORED_REPOS
        fish_git_prompt $argv
    end
end
