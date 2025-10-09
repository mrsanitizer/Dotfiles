#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bt='~/Scripts/bluetooth.sh'
alias prime-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only'
alias activate_env='source ~/python_envs/ml_use_pip_here/bin/activate'
#alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WaylandWindowDecorations' 
PS1='[\u@\h \W]\$ '
