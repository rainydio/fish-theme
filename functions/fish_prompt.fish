function fish_prompt
  set -l code $status

  set_color brcyan
  echo -ns (prompt_pwd)

  if test $code != 0
    set_color red
  else
    set_color white
  end

  echo -ns " \$ "
  set_color normal
end
