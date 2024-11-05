$env.config = {
  show_banner: false,
}

# Use nushell functions to define your right and left prompt
def create_left_prompt [] {
    let path_segment = ($env.PWD)

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | format date '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }

alias ll = ls -l
alias rebuild = nix run nix-darwin -- switch --flake /Users/ada/home/nix#bubblegum
