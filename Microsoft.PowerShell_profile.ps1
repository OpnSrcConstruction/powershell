# Oh-my-Posh Lcars-ish prompt
oh-my-posh init pwsh | Invoke-Expression

# Adding a fct. to list the aliases of $cmdletname parameter.
function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

# Basic Aliases:

# Simple alias to save a char using gh instead of man.
New-Alias -Name "gh" -Value "Get-Help" # man also works. :D

# alias to clear the screen w/ a single char.
New-Alias -Name "c" -Value "Clear-Host" # Just like a Unix system. :D

# alias to exit the current screen/session.
# New-Alias -Name "x" -Value "exit" # Just like a Unix system.
# A fct wrapper to exit the current screen/session.
function x{eXit}

# alias to list my aliases the same way I do on Linux.
New-Alias -Name "a" -Value "Get-Alias" # :D

# File LiSting aliases:
# LSD/Exa are ls replacements written in Rust.
# Functions are required to add parameters to a shortcut.
New-Alias -Name "l" -Value "lsd" # plain single char alias Ubuntu spoiled me on.
function la {lsd -a}      # Makes la show all of the files.
function ll {lsd -la}     # Gives ALL a LONG liSting.
function lt {lsd --tree}  # Builds a colorful tree view.
# Careful only to use lt in directories w/o many levels,
# because it could be quite slow.
# for example git project directories.
function ldd { lsd --human-readable --directory-only --all }

# I like using the up command to go up a level on the tree.
function up{cd ..}

# Rust utilities:
# dust is a du(directory-usage) alternative.
New-Alias -Name "du" -Value "dust"
New-Alias -Name "df" -Value "duf"

function tmux { wsl -d posh_tmux tmux } # Alpine container w/ default user set to tmux.
# eventually that tmux will point to my PS Sessions adding a highly configured tmux system...
New-Alias -Name "t" -Value "tmux"

function gdu { gdu --si } # -si makes for more human readable gdu output
New-Alias -Name "nf" -Value "neofetch.cmd" # Another great colorful utility for terminal cred.
