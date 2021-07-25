function __fish_git_prompt_validate_chars --description 'fish_git_prompt helper, checks char variables'

    __fish_git_prompt_set_char __fish_git_prompt_char_cleanstate '✔'
    __fish_git_prompt_set_char __fish_git_prompt_char_dirtystate '*' '✚'
    __fish_git_prompt_set_char __fish_git_prompt_char_invalidstate '#' '✖'
    __fish_git_prompt_set_char __fish_git_prompt_char_stagedstate '+' '●'
    __fish_git_prompt_set_char __fish_git_prompt_char_stashstate '$' '⚑'
    __fish_git_prompt_set_char __fish_git_prompt_char_stateseparator ' ' '|'
    __fish_git_prompt_set_char __fish_git_prompt_char_untrackedfiles '%' '…'
    __fish_git_prompt_set_char __fish_git_prompt_char_upstream_ahead '>' '↑'
    __fish_git_prompt_set_char __fish_git_prompt_char_upstream_behind '<' '↓'
    __fish_git_prompt_set_char __fish_git_prompt_char_upstream_diverged '<>'
    __fish_git_prompt_set_char __fish_git_prompt_char_upstream_equal '='
    __fish_git_prompt_set_char __fish_git_prompt_char_upstream_prefix ''

end
