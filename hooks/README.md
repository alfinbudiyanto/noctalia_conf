# How
It is not automatically can to execute that mean is you have to make it executable

#### 1. Check
```
ls -l ~/.config/noctalia/hooks/name-file.sh
```

if it print something like `-rwxr-xr-x` in front (`-x`) in last of that line, it was executable

if nothing (`-x`) you have to do this

#### 2. Make Executable
```
chmod +x ~/.config/noctalia/hooks/name-file.sh
```
