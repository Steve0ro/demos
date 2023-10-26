# Author: Steve0ro

PROMPT='
<-[%F{blue} %~%f] [%F{green};👽 $(get_ip_address)%f]
-> '

RPROMPT='[%F{red}%?%f]'

get_ip_address() {
  if [[ -n "$(ip -4 addr show dev eth0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ip -4 addr show dev eth0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ip -4 addr show dev tun0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ip -4 addr show dev tun0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP - ❌%{$reset_color%}"
  fi
}