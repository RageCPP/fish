if status is-interactive
  alias cat "bat"
  alias ll "ls -alF"
  alias ls "ls -a"

  function cpp
    if [ "$argv[1]" = "init" ]; and [ -n "$argv[2]" ]
      mkdir "$(pwd)/$argv[2]"
      cd "$(pwd)/$argv[2]"
      mkdir "build"
      mkdir "source"
      cd "source"
      touch "CMakeLists.txt"
    end
  end
end

status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source

# You must call it on initialization or listening to directory switching won't work
load_nvm > /dev/stderr
