function __fish_git_prompt_set_color
    set -l user_variable_name "$argv[1]"

    set -l default default_done
    switch (count $argv)
        case 1 # No defaults given, use prompt color
            set default $___fish_git_prompt_color
            set default_done $___fish_git_prompt_color_done
        case 2 # One default given, use normal for done
            set default "$argv[2]"
            set default_done (set_color normal)
        case 3 # Both defaults given
            set default "$argv[2]"
            set default_done "$argv[3]"
    end

    set -l variable _$user_variable_name
    set -l variable_done "$variable"_done

    if not set -q $variable
        if test -n "$$user_variable_name"
            set -g $variable (set_color $$user_variable_name)
            set -g $variable_done (set_color normal)
        else
            set -g $variable $default
            set -g $variable_done $default_done
        end
    end
end
