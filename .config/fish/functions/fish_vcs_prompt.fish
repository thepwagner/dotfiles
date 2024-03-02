function fish_vcs_prompt --description 'Print the prompts for all available vcsen'
    set IGNORED_REPOS {$HOME}/mycloud
    if not contains $PWD $IGNORED_REPOS
        fish_git_prompt $argv
    end
end
