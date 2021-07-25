function __fish_git_prompt_set_char
    set -l user_variable_name "$argv[1]"
    set -l char $argv[2]

    if set -q argv[3]
        and begin
            set -q __fish_git_prompt_show_informative_status
            or set -q __fish_git_prompt_use_informative_chars
        end
        set char $argv[3]
    end

    set -l variable _$user_variable_name
    set -l variable_done "$variable"_done

    if not set -q $variable
        set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
    end
end
