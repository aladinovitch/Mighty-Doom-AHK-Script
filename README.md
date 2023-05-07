# Mighty Doom - Play the Roguelite Mobile Game on PC with AutoHotkey


# Introduction:

This AutoHotkey script provides a quality of life improvement for the mobile game Mighty Doom. It uses shortcuts to make it comfortable to play on PC using the Screen Copy software (scrcpy). It makes an alternative to mobile devices, especially if one is tired of playing on a small screen.

The script includes the following features:

- Keyboard and mouse controls.
- A GUI that shows which shortcut is being pressed.
- Configurable controls.
- Works with `scrcpy`.

## Disclaimer:
- This script does not impart any automation nor gives any advantage, it is not a cheat or a hack.
- It simply provides keyboard and mouse controls for the mobile game, making it more comfortable to play on PC.
- The best experience for enjoying Mighty Doom is still on its original platform, a mobile device.


# Prerequisites:

1. Install Auto Hotkey (AHK v2). Download the latest version of Auto Hotkey from the official website: [www.autohotkey.com](https://www.autohotkey.com/)
1. Install `scrcpy`. Download the installer from the GitHub repository: [github.com/Genymobile/scrcpy](https://github.com/Genymobile/scrcpy)
1. Turn on USB debugging on your phone.

The steps to enable developer options, and turn on USB debugging, generally vary depending on the phone, but typically are as follow:
- Go to your Android device's "Settings" menu.
- Scroll down to "About Phone" or "About Device" and tap on it.
- Scroll down to "Build Number" and tap on it repeatedly (about 7 times) until you see a message that says "You are now a developer!" or something similar.
- Go back to the main "Settings" menu, and you should now see a new option called "Developer Options".
- Tap on "Developer Options" the switch should be on "On" or "Enabled"
- Scroll down to "USB debugging" and toggle the switch to "On" or "Enabled".
That's it! You should now be able to connect your Android device to your computer.

At this stage, using `scrcpy` should result in bidirectional functionality. However, on certain devices, `scrcpy` may only display the phone screen on the computer without accepting keyboard or mouse clicks, essentially creating a one-way connection.

To enable full bidirectional functionality, an additional option needs to be enabled as follows:

<p align="center"><img width="30%" src="https://user-images.githubusercontent.com/8851260/236570788-a15c099a-1729-4d02-9dd7-b0a1180e6e76.jpg" alt="usb debug with security settings" title="USB debugging settings"><br/><em>USB debugging settings</em></p>

After following these steps, you will be able to use `scrcpy` to mirror your Android screen to your computer and control it in both directions.

# Description

The game can be played with a keyboard and mouse out of the box. The WASD keys are supported for movement, and the E and F keys are used for the secondary and ultimate abilities, respectively.
However, in order to get the WASD keys to work properly, you must always hold down the CTRL key that simulate the finger press. On a physical keyboard this can be tiresome.

That is why the script is made, to provide a way to toggle the the CTRL key down, replicating a finger press. It also offers other shortcuts, such as the ability to choose perks.


# Overview
This AutoHotkey script offers the following shortcuts:

- Toggle to keep the CTRL key held down
- Shortcuts for choosing a perk
    - Between stages
    - Perk of the Sentinel
    - Spinning the wheel
- Shortcut to double-click and skip the boss animations


# Usage
## Wired connection
1. Connect the phone to the computer through USB.
1. Launch `scrcpy`. To avoid an unnecessary floating terminal window, run only `scrcpy-noconsole.vbs`.
1. Launch the script.

## Wireless scrcpy

`scrcpy` can also work wirelessly, although the latency will increase significantly. Here is how to do it:

1. Connect the phone to the computer through USB.
1. Open an ADB console.
1. Run the command: `scrcpy --tcpip`
1. Unplug the USB.
1. To disable the wireless connection on all devices, you can use the `adb disconnect` command from a terminal.

## Interface
- The script works only if the active `scrcpy` window is active, that is recognized by its title, set in the `DeviceName` variable (see [bellow](#Script-constants-section) how to set this variable).
- The moment another window gain focus a.k.a is active, the CTRL key will be released, so it won't affect any other applications, such as a web browser or a text editor.
- Here is the script's UI, it displays all the available hotkeys along with their brief descriptions.
- When a hotkey is pressed, there will be a quick blink feedback to confirm the action.

<p align="center"><img src="https://user-images.githubusercontent.com/8851260/236583325-c2be81a4-5deb-4287-b437-a28b1d1cc360.jpg" alt="Mighty Doom PC Controls" title="Mighty Doom PC Controls"><br/><em>Mighty Doom PC Controls</em></p>

## Caution
- The scripts is designed to be used while playing the stages, where you need the CTRL held down i.e. finger press. However, the CTRL needs to be disabled when you are in the menu, as there the finger doesn't need to be pressed.
- To release the CTRL press the ALT key, or F1 to exit the script entirely.
- Please note that if you close the script through the system tray, without exiting it with its exit shortcyt F1, the CTRL key may be held down in other applications, such as a web browser. If this happens, simply click once on the CTRL key to release it.


# Hotkeys

The script will maintain the CTRL key held down. Therefore, each hotkey will have its CTRL equivalent in the code.
| Hotkey | Description |
| :-: | :-- |
| Q | The main key to use whenever controls are lost, usually at each stage entrance, or after choosing a perk |
| Alt | Release the CTRL key |
| F1 | Exit the script altogether |
| Space | Performs a double click to skip boss animations. |
| 1 | Performs multiple clicks on perk locations, first click as a pick for the first perk out of three, then the perk from the sentinel perk or seraphim reject offer, finally click on the spinning wheel. |
| 2 | Second perk of the three, sentile heal, accept seraphim offer. |
| 3 | Third perk out of three. |

## Secondary and ultimate abilities

The secondary and ultimate abilities are already implemented in the game.
| Hotkey | Description |
| :-: | :-- |
| E | Secondary |
| F | Ultimate |

## Hotkeys clicks in game

| Abilities | Night Sentinel | The Seraphim |
| :-:   | :-:      | :-:      |
| ![perks](https://user-images.githubusercontent.com/8851260/235378372-c29b3540-7c72-4e31-8ef5-40a4c8a89d8f.jpg "Abilities") | ![sentinel](https://user-images.githubusercontent.com/8851260/235380308-64e8c653-102f-453f-9c7e-6d9dd709cda0.jpg "Night Sentinel") | ![seraphim](https://user-images.githubusercontent.com/8851260/235380311-0c04ce4e-2f2c-49f5-b4f5-b2d2f691a930.jpg "The Seraphim") |
| Mod-Bot Spin | Skip animation | Skip animation |
| ![wheel](https://user-images.githubusercontent.com/8851260/235380320-a05c4164-a655-4bdf-8cc6-c527c6840e22.jpg "Mod-Bot Spin") | ![skip1](https://user-images.githubusercontent.com/8851260/235380313-8b8b8a29-e188-4e92-811f-83b199058b59.jpg "Skip animation") | ![skip2](https://user-images.githubusercontent.com/8851260/235380316-2c1b6090-01d2-4ce7-a8b9-04be566d2e55.jpg "Skip animation") |


# Configuration
- As the script is written in AutoHotkey (AHK), it is highly recommended to have at least a basic understanding of this programming language, particularly the variables, to quickly configure hotkeys and click location coordinates.
- The script uses values specific to the device's resolution, which in this case is 1080 x 2400.
- Despite many mobile devices have screen resolutions that are close to this size. It's important to adjust the values in the script's constant section based on the resolution of your specific mobile or tablet.
- The click location coordinates used in the script are obtained from AHK Spy, a tool that is included with AHK.
- The **Client** mouse position is the one that matters to the script

<p align="center"><img src="https://user-images.githubusercontent.com/8851260/236707944-78d8ec55-6569-40c6-8dd1-9641d9a27582.jpg" alt="AHKv2 Window Spy" title="AHKv2 Window Spy"><br/><em>Window Spy for AHKv2</em></p>

<a name="Script-constants-section"></a>
## Script constants section
Here lies the constants section in the script, containing the device name, values, coordinates, and hotkey names that can be customized to your liking.

```ahk
DeviceName := "Redmi Note 9 Pro"
#SingleInstance Force
WinActivate DeviceName
WinWaitActive DeviceName
HotIfWinActive DeviceName

; Constants
; The script uses values that are specific to the device's resolution.
; The current resolution is 1080 x 2400.
; These values are obtained from the AHK Window spy.
; The values need to be adjusted to match your mobile device's resolution.
DPadCenter := { x: 216, y: 742 }
PerkScreenLocations := [
    perk1 := { x: 108, y: 600 }, perk2 := { x: 260, y: 600 }, perk3 := { x: 348, y: 524 }
    , seraphimReject := { x: 140, y: 868 }, seraphimAccept := { x: 280, y: 868 }]

; Hotkey map
KeyResetControl := "Q"
KeyAbility1 := "1"
KeyAbility2 := "2"
KeyAbility3 := "3"
KeyDoubleClick := "Space"
KeyReleaseCtrl := "Alt"
KeyExit := "F1"
```

# Development

The following tools were used to develop the script:

1. AutoHotkey v2
1. Visual Studio Code
1. VSCode extension: AutoHotkey v2 Language Support

- **AutoHotkey v2**: is a scripting language that allows you to automate tasks on your computer. It is a powerful tool that can be used for a variety of purposes, including gaming, productivity, and web development.

- **Visual Studio Code**: is a free and open-source code editor developed by Microsoft. It is a powerful and versatile editor that can be used for a variety of programming languages, including AutoHotkey.

- **VSCode extension: AutoHotkey v2 Language Support**: is an extension for Visual Studio Code that provides support for AutoHotkey v2. It includes syntax highlighting, code completion, and linting.


# References
If you want to learn more about `scrcpy` and how to get the most out of it, check out this helpful playlist that covers a wide range of topics:

https://www.youtube.com/playlist?list=PL2IcGP6tqTobWv4aVJWGw41q5k5TriX-d

It ontains a variety of videos that provide detailed guidance on how to enable Wi-Fi, choose the video codec, change the bitrate, set max fps, troubleshoot crashes, and more.

By following the tips and tricks outlined in these videos, you'll be able to customize `scrcpy` to meet your specific needs.
