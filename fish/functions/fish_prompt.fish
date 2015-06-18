function git_prompt
  if git root >/dev/null 2>&1
    set_color normal
    printf ' ('
    set_color magenta
    printf '%s' (git currentbranch ^/dev/null)
    set_color green
    git_prompt_status
    set_color normal
    stgit_prompt
    printf ')'
  end
end

function stgit_prompt
  if set stg_top (stg top ^/dev/null)
    set num_patches (stg series -A 2>/dev/null | wc -l)
    set_color normal
    printf ' '
    set_color magenta
    if test (math $num_patches - 1) -gt 0
      printf '%s+%s' $stg_top (math $num_patches - 1)
    else
      printf '%s' $stg_top
    end
    set_color normal
  end
end

function fish_prompt --description 'Write out the prompt'
  set -l prompt_symbol ''
  switch $USER
    case root; set prompt_symbol '#'
    case '*';  set prompt_symbol '>'
  end
  printf "%s@%s %s%s%s%s%s " $USER (hostname -s) (set_color $fish_color_cwd) (prompt_long_pwd) (set_color normal) (git_prompt) $prompt_symbol
end
