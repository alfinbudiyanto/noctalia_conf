# Requirement
---

### For pipewire/virtual cables
```
sudo dnf install pulseaudio-utils
```

you need to install it because the program is using pactl and it is on pulseaudio-utils package.

For the error:
`
You should reset Pipewire to last defaults  before 'running programs may need to be restarted. OBS will need this. Best to run when no apps are running 
 
VirtualSpeaker
/home/wolfei/.config/noctalia/shortcuts/virtual-cable-pipewire.sh: line 21: pactl: command not found
 
VirtualMic
/home/wolfei/.config/noctalia/shortcuts/virtual-cable-pipewire.sh: line 25: pactl: command not found
 
Linking together
failed to link ports: No such file or directory
failed to link ports: No such file or directory
 
Loopback
/home/wolfei/.config/noctalia/shortcuts/virtual-cable-pipewire.sh: line 33: pactl: command not found
 
 
If no errors done!
 
 
 To configure loop back in pulseaudio manager. This will be needed to do each time sorry.
Use this comand to reset:
systemctl --user restart pipewire pipewire-pulse
from https://luke.hsiao.dev/blog/pipewire-virtual-microphone/
Updates at : https://github.com/steven3363/Virtual-Cables-Linux
`
