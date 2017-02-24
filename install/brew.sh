
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

apps=(
    ag
    neovim/neovim/neovim
    agda
    node
    postgresql
    haskell-stack
    smlnj
    rlwrap
    git
    swi-prolog
    leiningen
    python3
    homebrew/games/nethack
)

brew install "${apps[@]}"
brew cleanup