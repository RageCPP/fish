if status is-interactive
  alias cat "bat"
  # 需要安装trash-rm
  alias rm "trash-rm"
end

status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source

# You must call it on initialization or listening to directory switching won't work
load_nvm > /dev/stderr
