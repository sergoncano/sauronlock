# Sauronlock
Sauronlock is a very bad lockscreen that plays an Eye of Sauron screamer whenever someone else tries to access the computer.
## Dependencies
To run this you need [quickshell](https://quickshell.org/) installed. It is available in most distros' repositories.  
The program is designed to run in hyprland. It might work in other wayland compositors but it does not work on x11 WM's.
## Usage
Clone this repo, then run ```quickshell -p /path/to/shell.qml```.
Once the command is ran, the next key you press will be saved as the unlock key. If this key is pressed the program closes, if any other key is pressed the screamer plays over the current window.
#### Warning
This program does not implement [WlSessionLock](https://quickshell.org/docs/v0.2.0/types/Quickshell.Wayland/WlSessionLock/) and therefore is not a secure lockscreen, besides for the fact that brute-forcing a one key password is trivial. It is meant as a prank program rather than a real lockscreen.
## Customization
Both the audio and video can be easiy changed by replacing those in the assets folder. Note that if the video has any audio, it won't play. They must be separated.  
You can also set a default unlock key by changing line 21 of the ```shell.qml``` file from ```property var unlockKey``` to ```property var unlockKey: id``` being id the numeric code for the key.
