# Mighty Doom - Play the Roguelite Mobile Game on PC with AutoHotkey


# Introduction:

This AutoHotkey script provides a quality of life improvement for the mobile game Mighty Doom. It uses shortcuts to make it comfortable to play on PC using the Screen Copy software (scrcpy). It makes an alternative to mobile devices, especially if one is tired of playing on a small screen.

The script includes the following features:

- Keyboard and mouse controls
- Configurable controls
- Easy to use
- Works with `scrcpy`

## Disclaimer:
This script does not impart any automation, it is not a hack or cheat. It simply provides keyboard and mouse controls for the mobile game, making it more comfortable to play on PC.

The best experience for Mighty Doom is still on its original platform, a mobile device.


# Prerequisites:

1. Install `scrcpy`. Download the installer from the GitHub repository: [github.com/Genymobile/scrcpy](https://github.com/Genymobile/scrcpy)
2. Turn on USB debugging on your phone.
    - Open the Settings app.
    - Tap on System.
    - Tap on Advanced.
    - Tap on Developer options.
    - Tap on the toggle switch next to USB debugging.
3. Install Auto Hotkey (AHK V2). Download the latest version of Auto Hotkey from the official website: [www.autohotkey.com](https://www.autohotkey.com/)

Once you have completed these steps, you will be ready to use `scrcpy` to mirror your Android screen to your computer.


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

## Caution
- The scripts designed to be used while playing the stages, where you need the CTRL held down (finger press). However, the script needs to be disabled when you are in the menu, as there the finger won't be always pressed.

- To release the CTRL press the ALT key. Or F1 to exit the script entirely.

- It is also important to note that sometimes the script may cause the CTRL key to be held down in other applications, such as the web browser. If this happens, simply stop the script and click the CTRL key once.


# Keystrokes

The script will maintain the CTRL key held down. Therefore, each keystroke will have its CTRL equivalent.
- Q: The main key to use whenever controls are lost, usually at each stage entrance, or after choosing a perk.
- Alt: Release the CTRL key.
- F1: Exit the script altogether.
- Space: Performs a double click to skip boss animations.
- 1: Performs multiple clicks on perk locations, first click as a pick for the first perk out of three, then the perk from the sentinel perk or seraphim reject offer, finally click on the spinning wheel.
- 2: Second perk of the three, sentile heal, accept seraphim offer.
- 3: Third perk out of three.

## Secondary and ultimate abilities

The secondary and ultimate abilities are already implemented in the game.
- E: Secondary
- F: Ultimate

| Abilities | Night Sentinel | The Seraphim |
| :-:   | :-:      | :-:      |
| ![perks](https://user-images.githubusercontent.com/8851260/235378372-c29b3540-7c72-4e31-8ef5-40a4c8a89d8f.jpg) | ![sentinel](https://user-images.githubusercontent.com/8851260/235380308-64e8c653-102f-453f-9c7e-6d9dd709cda0.jpg) | ![seraphim](https://user-images.githubusercontent.com/8851260/235380311-0c04ce4e-2f2c-49f5-b4f5-b2d2f691a930.jpg) |
| Mod-Bot Spin | Skip animation | Skip animation |
| ![wheel](https://user-images.githubusercontent.com/8851260/235380320-a05c4164-a655-4bdf-8cc6-c527c6840e22.jpg) | ![skip1](https://user-images.githubusercontent.com/8851260/235380313-8b8b8a29-e188-4e92-811f-83b199058b59.jpg) | ![skip2](https://user-images.githubusercontent.com/8851260/235380316-2c1b6090-01d2-4ce7-a8b9-04be566d2e55.jpg) |



# Development

The following tools were used to develop the script:

1. AutoHotkey v2
1. Visual Studio Code
1. VSCode extension: AutoHotkey v2 Language Support

- **AutoHotkey v2** is a scripting language that allows you to automate tasks on your computer. It is a powerful tool that can be used for a variety of purposes, including gaming, productivity, and web development.

- **Visual Studio Code** is a free and open-source code editor developed by Microsoft. It is a powerful and versatile editor that can be used for a variety of programming languages, including AutoHotkey.

- **VSCode extension: AutoHotkey v2 Language Support** is an extension for Visual Studio Code that provides support for AutoHotkey v2. It includes syntax highlighting, code completion, and linting.
