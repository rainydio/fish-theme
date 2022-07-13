function fish_right_prompt
  set -l code $status
  
  set -l duration_ms $CMD_DURATION
  set -l duration_s  (math $duration_ms / 1000)
  set -l duration_m  (math $duration_s  /   60)
  set -l duration_h  (math $duration_m  /   60)
  set -l duration_d  (math $duration_h  /   24)

  if test $duration_d -ge 1
    echo -ns " "
    echo -ns (math -s0 $duration_d)
    echo -ns "d"
  end

  if test $duration_h -ge 1
    echo -ns " "
    echo -ns (math -s0 $duration_h % 24)
    echo -ns "h"
  end

  if test $duration_m -ge 1
    echo -ns " "
    echo -ns (math -s0 $duration_m % 60)
    echo -ns "m"
  end

  if test $duration_s -ge 1
    if test $duration_s -ge 10
      echo -ns " "
      echo -ns (math -s0 $duration_s % 60)
      echo -ns "s"
    else
      echo -ns " "
      echo -ns (math -s1 $duration_s)
      echo -ns "s"
    end
  end

  if test $duration_ms -lt 1000 -a $duration_ms -ge 1
    echo -ns " "
    echo -ns (math $duration_ms % 1000)
    echo -ns "ms"
  end

  if test $code != 0
    set_color brred
    echo -ns " $code"
    set_color normal
  end

  if set -q VIRTUAL_ENV
    set -l venv (basename $VIRTUAL_ENV)
    echo -ns " venv:$venv"
  end
end
