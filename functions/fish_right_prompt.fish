
function fish_right_prompt
  set -l code $status

  function status::color -S
    test $code -ne 0; and echo (seg_color); or echo (ok_color)
  end

  if test $CMD_DURATION -gt 1000
    printf (err_color)" ~"(printf "%.1fs " (math "$CMD_DURATION / 1000"))(normal_color)
  end


  if test $code -ne 0
    echo (ok_color)"≡ "(seg_color)"$code"(normal_color)
  end
end
