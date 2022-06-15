# to update on all hosts :
# ap -t=copy_basic_files_toto
#
alias h='history'
#alias mysuspend='sudo dbus-send --system --print-reply  --dest="org.freedesktop.UPower"  /org/freedesktop/UPower org.freedesktop.UPower.Suspend'
#alias mountdrived='sudo mkdir /mnt/mysmb; sudo mount -t cifs -o username=toto,password=mypw //192.168.0.2/d  /mnt/mysmb'
#alias unmountdrived='sudo umount /mnt/mysmb'
#alias wolmypc3='wakeonlan 74:DA:38:82:A3:EC'
alias addbackup='addbackup_fct'
alias hp='. /home/toto/http_proxy.sh'
alias leaf='leafpad_fct'
alias uhp='unset http_proxy && unset https_proxy'

alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'


alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -ltra'

#my aliases
alias aliasedit='vi ~/utils/my-bash_aliases'
alias aliasrun='. ~/utils/my-bash_aliases'
alias aliastest="echo test3"

alias mysuspend="sudo systemctl --no-wall suspend"
#alias mysuspend="sudo sh -c 'echo mem > /sys/power/state'"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias startwifi='sudo wpa_supplicant -B -iwlan0 -clinksyswpa.conf -Dwext'
#alias wolhp='sudo ifconfig eth0 up; sudo etherwake -i eth0 e4:11:5b:32:98:63'
alias wolhp='wakeonlan e4:11:5b:32:98:63'
alias wolmypc3='wakeonlan f4:4d:30:05:78:01'
alias gitca='git commit -a -m "."'
alias gitpp='git pull; git push'
alias gitcapp2='git commit -a -m "."; git pull; git push; git status'
alias gitlog='git log --oneline --decorate --all --graph'
alias sshagent="eval \`ssh-agent -s\`; ssh-add ~/.ssh/id_ed25519_toto"
alias lsys="less /var/log/syslog"
alias sshgit='sed -i "s#https://github.com/#git@github.com:#" .git/config'
alias release="bash ~/utils/release.sh"
alias mygitdiff='git fetch origin ; git diff origin/master'

gitcapp() 
{
  # check if ssh-agent has already been loaded with a key
  ssh-add -l > /dev/null 2>&1
  result=$?
  # echo $result

  # if ssh-agent has already been loaded, continueIf in a git repo - call git mv. otherwise- call mv
  if [ $result -eq 0 ]; 
  then
      gitcapp2
  else 
      echo "please run sshagent before"  
  fi
}


# NB : to print the definition of a given bash function :
# type mynmap

mynmap() 
{
  sudo nmap -sn 192.168.0.* | awk ' /scan report/ {printf ("%15s %s\n",$5,$6) }'
}

mynmap2() 
{
  sudo nmap -sn 192.168.0.* | awk '/Nmap scan/{ip=$NF;name=$5; next}ip && /MAC/{printf "%s %-16s %s\n", $3, ip, name}' | bash ~/utils/map_mac_addr.sh
}

disp() 
{
  export DISPLAY=localhost:$1.0
  echo "DISPLAY:" $DISPLAY
}


export XAUTHORITY=~/.Xauthority


alias ap="ansible-playbook site.yml"
alias aps="ansible-playbook site.yml --skip-tags=always"
alias cf="cp -vu ~/{.tmux.conf,.bash_aliases,.vimrc} ~/ansible/roles/base/files/"

alias virtualenv="$(which virtualenv) -p $(which python3)"
alias venv=". venv/bin/activate"
alias venv2=". venv/Scripts/activate"

if [ -f ~/.my_aliases ]; then
  . ~/.my_aliases
fi

