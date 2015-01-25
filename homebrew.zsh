#!/usr/bin/env zsh

#########
# BREWS #
#########

brews=(
  # Ruby
  ## Tool for ing Ruby from source
  ruby-build
  ## Ruby version manager
  chruby
  ## Featherweight gemset-like provider
  gem_home

  # Cache
  ## Memory-based object store
  memcached

  # DB
  ## Small, embedded database
  sqlite
  ## General purpose RDBMS
  mysql

  # Dev stuff
  ## Editor
  vim
  ## The DVCS
  git
  ## Terminal multiplexer. Split console windows and stuff
  tmux
  ## OS X specific trick to allow copy/pastes work from CLI
  reattach-to-user-namespace
  ## Fuzzy file content searcher, like grep only 1000x faster
  the_silver_searcher
  ## Tiny bit faster `the_silver_searcher`
  the_platinum_searcher
  ## Fuzzy file name searcher
  watchman
  ## Tag creator. Keeps index of definitions
  ctags
  ## TLS toolkit
  openssl

  # JS
  ## Compressor and linter
  closure-compiler
  ## Node version manager
  nvm

  # Misc
  ## wget(1) on steroids
  aria2
  ## Graphics toolkit
  imagemagick
  ## Periodical command execution
  watch
  ## .rpm extraction
  rpm2cpio
  ## CLI IRC client
  weechat
  ## Password generator
  pwgen
  ## Assorted pack of various small Unix utilities
  moreutils
  ## top(1) on steroids
  htop-osx
  ## Random git utilities
  git-extras
  ## Speed up directory traversal
  z
  ## Retrieval of files across various protocols
  wget
  ## CLI hex viewer
  dhex
  ## Cleanup filenames with weird characters
  detox
  ## Collection of usefull non-standard tools
  moreutils
  ## CLI disk usage viewer
  ncdu
)

#########
# CASKS #
#########

casks=(
  # Dev stuff
  ## LDAP workhorse
  apache-directory-studio
  ## Git GUI for visualizing those tens of parallel flows
  sourcetree
  ## Virtual development environment management
  vagrant
  ## OS virtualization package
  virtualbox
  ## Packet analyzer
  wireshark

  # OS X
  ## Multi-button mouse savior
  bettertouchtool
  ## Disk space analyzer/treemap viewer
  disk-inventory-x
  ## Keyboard mapping customizer. Goes hand in hand with Seil
  karabiner
  ## File archiver. Happily munges through all popular and obscure formats (e.g. RAR)
  keka
  ## Menubar status insights
  menumeters
  ## Keyboard driver patch/advanced config tool. Allows remapping of CapsLock. Used in combination with Karabiner
  seil
  ## X11 for Mac
  xquartz

  # Misc
  ## 3D graphics workbench [3ds Max]
  blender
  ## E-book library management
  calibre
  ## Free diagram builder [Visio]
  dia
  ## Automatic display color management
  flux
  ## Free 2D raster graphics editor [Photoshop]
  gimp
  ## Google Hangouts Screenshare enablement browser extensions
  google-hangouts
  ## Free vector graphics editor [Illustrator]
  inkscape
  ## Free office suite [Office]
  libreoffice
  ## IM client
  skype
  ## Spiffy music streaming
  spotify
  ## Desktop sharing/remote control
  teamviewer
  ## BitTorrent client
  transmission
  ## Install disk images of flash drives
  unetbootin
  ## Media player, hadling anything thrown at it
  vlc
)

###########
###########
###########

brew update
brew upgrade

for package in $brews
do
  brew install $package
done

brew tap caskroom/cask
for package in $casks
do
  brew cask install $package
done

brew cleanup
