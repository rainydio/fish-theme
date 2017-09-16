## Function to show a segment
function prompt_segment -d "Function to show a segment"
  # Get colors
  set -l bg $argv[1]
  set -l fg $argv[2]

  # Set 'em
  set_color -b $bg
  set_color $fg

  # Print text
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3]
  end
end

# Show directory
function show_pwd -d "Show the current directory"
  set -l pwd (prompt_pwd)
  prompt_segment normal blue $pwd
end

# Show prompt w/ privilege cue
function show_prompt -d "Shows prompt with cue for current priv"
  set -l uid (id -u $USER)
  set -l spad " "

  if [ $RETVAL != 0 ]
    prompt_segment normal red "!"
    set spad ""
  end

  if [ $uid = 0 ]
    prompt_segment normal white $spad
    prompt_segment red white "!"
    prompt_segment normal white " "
  else
    prompt_segment normal white "$spad\$ "
  end

  set_color normal
end

## SHOW PROMPT
function fish_prompt
  show_pwd
  show_prompt
end
