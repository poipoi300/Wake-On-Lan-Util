Painless Wake-On-Lan (WoW)
==========================

## Current status
INCOMPLETE!
You can setup clients, which will never need to change, but I haven't made the install script for the server-side script yet.

## Requirements
* Access to the network the computer you wish to wake up is on.
* Access to a device which can run bash scripts

## Purpose
Facilitating setup for WOL over a local VPN for use in combination with streaming software like [Moonlight](https://github.com/moonlight-stream).

## Planned function
* Seamlessly wake your device from outside your home, provided you have a VPN
* Setup your monitor resolution according to the device sending the wake-up request

## Planned usage
* Move over the install script on your VPN host (or other device that's always on and reachable from your home VPN)
* Make it executable (chmod +x ServerInstallScript.sh)

## External libraries
* 

## Known issues
* Many, as this is still incomplete. 

## Limitations
* Adding new clients is only semi-automatic right now, and may never be fully automated in the future.
* Some bash-capable machines (tested on termux) will complain about an unrecognized command, but they still work.