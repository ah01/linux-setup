if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

echo -e "\033[0;34m" && cat /sys/firmware/devicetree/base/model && echo -e "\033[0m\n"

df -h -x tmpfs -x udev # disk usage, minus def and swap
echo ""

# tmux attache is added by setup script only if tmux is enabled
#tmux attach
