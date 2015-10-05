desc "Homebrew taps setup"
task :homebrew_taps do
  # Caskroom
  `brew tap caskroom/cask`
  # Neovim
  `brew tap neovim/homebrew-neovim`
  # Tmux with TrueColor support
  `brew tap aleksandrs-ledovskis/tmux-tc https://github.com/aleksandrs-ledovskis/tmux-tc.git`
end

desc "Homebrew package install & update"
task homebrew: %i(homebrew_update homebrew_upgrade)  do
  Rake::Task["homebrew_install_packages"].invoke
end

task :homebrew_install_packages do
  BREWS.each do |package|
    `brew install #{package}`
  end

  CASKS.each do |package|
    `brew cask install #{package}`
  end

  Rake::Task["homebrew_cleanup"].invoke
end

task :homebrew_cleanup do
  `brew cleanup`
end

task :homebrew_update do
  `brew update`
end

task :homebrew_upgrade do
  `brew upgrade`
end

########################################

BREWS = [
  # Ruby
  ## Tool for installing Ruby from source
  "ruby-build",
  ## Ruby version manager
  "chruby",
  ## Featherweight gemset-like provider
  "--HEAD https://raw.github.com/postmodern/gem_home/master/homebrew/gem_home.rb",

  # Cache
  ## Memory-based object store
  "memcached",

  # DB
  ## Small, embedded database
  "sqlite",
  ## General purpose RDBMS
  "mysql",
  ## Solid ORDBMS
  "postgresql",
  ## Geographic object support for pgSQL
  "postgis",

  # Dev stuff
  ## Editor
  "--HEAD neovim",
  ## The DVCS
  "git --with-brewed-openssl --with-brewed-svn",
  ## Terminal multiplexer. Split console windows and stuff (With custom patches)
  "tmux-tc",
  ## Fuzzy file content searcher, like grep only 1000x faster
  "the_silver_searcher",
  ## Tag creator. Keeps index of definitions
  "ctags",
  ## TLS toolkit
  "openssl",
  ## Compiler system
  "gcc",
  ## Dependecy library, parsing options in command lines
  "popt",
  ## Prehistoric revision control system
  "cvs",
  ## Old school revision control system
  "svn",
  ## Alternate revision control system
  "hg",
  ## Cartographic projection conversion library, Proj4
  "proj",
  ## Geospatial data format management library
  "gdal",
  ## Solid web server & reverse proxy
  "nginx",

  # JS
  ## Compressor and linter
  "closure-compiler",
  ## Node version manager
  "nvm",

  # Misc
  ## wget(1) on steroids
  "aria2",
  ## Graphics toolkit
  "imagemagick",
  ## Periodical command execution
  "watch",
  ## .rpm extraction
  "rpm2cpio",
  ## CLI IRC client
  "weechat",
  ## Password generator
  "pwgen",
  ## Assorted pack of various small Unix utilities
  "moreutils",
  ## top(1) on steroids
  "htop-osx",
  ## Random git utilities
  "git-extras",
  ## Speed up directory traversal
  "z",
  ## Retrieval of files across various protocols
  "wget",
  ## CLI hex viewer
  "dhex",
  ## Cleanup filenames with weird characters
  "detox",
  ## Collection of usefull non-standard tools
  "moreutils",
  ## CLI disk usage viewer
  "ncdu",
  ## Adequate (and OSS) version of Cisco AnyConnect VPN software
  "openconnect",
]

CASKS = [
  # Dev stuff
  ## LDAP workhorse
  "apache-directory-studio",
  ## GUI frontend to PostgreSQL
  "pgadmin3",
  ## Git GUI for visualizing those tens of parallel flows
  "sourcetree",
  ## Virtual development environment management
  "vagrant",
  ## OS virtualization package
  "virtualbox",
  ## Packet analyzer
  "wireshark",

  # OS X
  ## Multi-button mouse savior
  "bettertouchtool",
  ## Disk space analyzer/treemap viewer
  "disk-inventory-x",
  ## DNS encryption. Secure lookups against first-hop MITM's (e.g. public access points messing with/blocking some sites)
  "dnscrypt",
  ## Mac OS X build of Chromium
  "freesmug-chromium",
  ## Keyboard mapping customizer. Goes hand in hand with Seil
  "karabiner",
  ## File archiver. Happily munges through all popular and obscure formats (e.g. RAR)
  "keka",
  ## Menubar status insights (for OS X 10.11+)
  "yujitach-menumeters",
  ## Keyboard driver patch/advanced config tool. Allows remapping of CapsLock. Used in combination with Karabiner
  "seil",
  ## X11 for Mac
  "xquartz",

  # Misc
  ## 3D graphics workbench [3ds Max]
  "blender",
  ## E-book library management
  "calibre",
  ## Free diagram builder [Visio]
  "dia",
  ## Automatic display color management
  "flux",
  ## Free 2D raster graphics editor [Photoshop]
  "gimp",
  ## Google Hangouts Screenshare enablement browser extensions
  "google-hangouts",
  ## Free vector graphics editor [Illustrator]
  "inkscape",
  ## Free office suite [Office]
  "libreoffice",
  ## IM client
  "skype",
  ## Spiffy music streaming
  "spotify",
  ## Desktop sharing/remote control
  "teamviewer",
  ## BitTorrent client
  "transmission",
  ## Install disk images of flash drives
  "unetbootin",
  ## Media player, hadling anything thrown at it
  "vlc",
]
