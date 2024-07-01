_add_to_path ()
{
    if [[ ":$PATH:" != *":$1:"* ]]; then
        path=("$1" $path)
        export PATH
    fi
}

_add_to_path $HOME/.juliaup/bin

_add_to_path $HOME/.local/bin

_add_to_path $HOME/dotfiles/bin

_add_to_path /usr/bin

unset _add_to_path
