# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export QSYS_ROOTDIR="/home/victor/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
export PATH="$PATH:/tools/Xilinx/Vivado/2018.3/bin"
export PATH="$PATH:/home/victor/intelFPGA_lite/23.1std/quartus/bin"
export PATH="$PATH:/home/victor/intelFPGA/20.1/modelsim_ase/linuxaloem"

export PATH="~/Downloads/firefox/firefox-bin:$PATH"
export ADS_LICENSE_FILE="$HOME/Keysight/19374751_20250304090725.lic"
export HPEESOF_DIR="/usr/local/ADS2025_Update1/Licensing/2024.06/linux_x86_64/bin" 
export PATH=$HPEESOF_DIR/bin:$PATH
export PATH="opt/riscv/bin:$PATH"
export VSIM_PATH="/home/victor/pulp/pulpissimo/sim"
