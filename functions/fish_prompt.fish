set -g CMD_DURATION 0

function ok_color; set_color -o fff143; end
function seg_color; set_color -o 00e079; end
function flash_trd; set_color -o 666; end
function err_color; set_color -o ff3300; end
function normal_color; set_color normal; end
function bc; command bc -l $argv; end

function flash_git_is_stashed
  command git rev-parse --verify --quiet refs/stash >/dev/null
end

function flash_git_branch_name
  command git symbolic-ref --short HEAD
end

function flash_git_is_touched
  test -n (echo (command git status --porcelain))
end

function fish_prompt
  # https://fishshell.com/docs/current/tutorial.html#exit-status
  set -l code $status
  set -l folder_icon "󱞊"
  set -l where (prompt_pwd)
  set -l base (basename "$where")
  
  set -l git_status ""

  if test -d .git
    set folder_icon "󰊢" 
    if flash_git_is_stashed
      set git_status (echo (seg_color)(flash_git_branch_name)" 󱅫 "(err_color)"stashed, check! "(normal_color))
    else
      flash_git_is_touched
        and set git_status (echo (seg_color)(flash_git_branch_name)" 󱅫 ")
        or  set git_status (echo (seg_color)(flash_git_branch_name)" ")
    end
  end

  set -l format_where (
    echo "$where" | sed "s|~|"(err_color)" |" | sed "s|/|"(normal_color)" |g" | sed "s|"$base"|"(ok_color)""$folder_icon" "$base"|g"
  )

  [ "$PWD" = "/" ]; and echo (ok_color)" / "(normal_color); or echo "$format_where $git_status"(normal_color);
end
