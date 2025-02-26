if status is-interactive
  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_hide_untrackedfiles 1

  set -g __fish_git_prompt_color_branch magenta
  set -g __fish_git_prompt_color_branch_done magenta
  set -g __fish_git_prompt_color_branch_detached magenta
  set -g __fish_git_prompt_showupstream "informative"
  set -g __fish_git_prompt_char_upstream_ahead "↑"
  set -g __fish_git_prompt_char_upstream_behind "↓"
  set -g __fish_git_prompt_char_upstream_prefix ""

  set -g __fish_git_prompt_char_stagedstate "●"
  set -g __fish_git_prompt_char_dirtystate "✚"
  set -g __fish_git_prompt_char_untrackedfiles "…"
  set -g __fish_git_prompt_char_conflictedstate "✖"
  set -g __fish_git_prompt_char_cleanstate "✔"

  set -g __fish_git_prompt_color_dirtystate blue
  set -g __fish_git_prompt_color_stagedstate yellow
  set -g __fish_git_prompt_color_invalidstate red
  set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
  set -g __fish_git_prompt_color_cleanstate green

  set -g fish_greeting ""
  set -g fish_prompt_pwd_dir_length 0
  set -g fish_color_cwd blue
  set -g fish_color_host green
  set -g fish_color_user green
  fish_add_path /usr/local/bin

  if type -q direnv
    direnv hook fish | source
  end
  if [ -S ~/.gnupg/S.gpg-agent.ssh ]
    set -e SSH_AUTH_SOCK
    set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
  end

  if test -f ~/.config/fish/config_local.fish
    source ~/.config/fish/config_local.fish
  end
end

