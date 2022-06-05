Painless Wake-On-Lan (WoW)
==========================

## Current status
INCOMPLETE!
You can setup clients, which will never need to change, but I haven't made the install script for the server-side script yet.

## Purpose
Facilitating setup for WOL over a local VPN for use in combination with streaming software like [Moonlight](https://github.com/moonlight-stream).

## Planned function
* [] Seamlessly wake your device from outside your home, provided you have a VPN
* [] Setup your monitor resolution according to the device sending the wake-up request

## Planned setup
* [] - Move over the install script on your VPN host (or other device that's always on and reachable from your home VPN)
* [] - Make it executable (chmod +x ServerInstallScript.sh)

## External libraries
* 

## Known issues
* [] Many, as this is still incomplete. 

## Limitations
* [] Adding new clients is only semi-automatic right now, and may never be fully automated in the future.
* [] Must use a device which can run bash scripts, and have connectivity to a system (which can also run bash scripts) on the target network.