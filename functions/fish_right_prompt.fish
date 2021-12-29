function fish_right_prompt
  set -l code $status

  if [ $code != 0 ]
    set_color red
    echo -ns " $code"
    set_color normal
  end

  if set -q VIRTUAL_ENV
    set -l venv (basename $VIRTUAL_ENV)
    echo -ns " ($venv)"
  end
end