function fish_prompt
  set -l RETVAL $status
  set -l uid (id -u $USER)

  set_color blue
  echo -ns (prompt_pwd)

  if [ $RETVAL != 0 ]
    set_color red
    echo -ns "!"
  else
    echo -ns " "
  end

  if [ $uid = 0 ]
    set_color red
  else
    set_color white
  end

  echo -ns "\$ "

  set_color normal
end
