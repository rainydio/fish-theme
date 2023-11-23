function fish_right_prompt
  set -l code $status
  
  if test $code != 0
    set_color red
    echo -ns " $code"
    set_color normal
  end

  if set -q VIRTUAL_ENV
    set_color brblack
    echo -ns " venv://"
    set_color normal
    echo -ns $VIRTUAL_ENV
  end

  if set -q AWS_PROFILE
    set -l session_count (aws-vault list --sessions | wc -l)
    
    if test $session_count = 0
      set_color brblack
      echo -ns " aws://"
      echo -ns $AWS_PROFILE
      set_color normal
    else
      set_color brblack
      echo -ns " aws://"
      set_color normal
      echo -ns $AWS_PROFILE
    end
  end
end
