DeviceName := "JSN-L22"
#SingleInstance Force
WinActivate DeviceName
WinWaitActive DeviceName
HotIfWinActive DeviceName

; Constants
; The values in this script depend on the device resolution. The current resolution is 2340 x 1080.
; These values are obtained from the AHK Window spy.
; They need to be adjusted depending on the mobile resolution.
DPadCenter := {x: 216, y: 742}
PerkScreenLocations := [perk1 := {x: 72, y: 520}, perk2 := {x: 216, y: 520}, perk3 := {x: 368, y: 520}
                    , perk1Sentinel := {x:130, y:640}, perk2Sentinel := {x:300, y:640}
                    , spinningWheel := {x:216, y:864}
                    , seraphimReject :={x:110, y:866}, seraphimAccept :={x:320, y:866}]

; Functions
PerkPick(key){
    idxs := []
    switch key {
        case "1":
            idxs := [1, 4, 6, 7]
        case "2":
            idxs := [2, 5, 8]
        case "3":
            idxs := [3]
    }
    for idx in idxs{
        Click PerkScreenLocations[idx].x, PerkScreenLocations[idx].y
        Sleep 300
    }
    Sleep 500
    ControlBack()
}

ControlBack(){
    Send "{Ctrl Up}"
    MouseMove DPadCenter.x, DPadCenter.y
    Send "{Ctrl Down}"
}

DoubleClick(){
    Click DPadCenter.x, DPadCenter.y
    Sleep 100
    Click DPadCenter.x, DPadCenter.y
    ControlBack()
}

; Keystrokes

; The main key to use whenever controls are lost, usually at each stage entrance, or after choosing a perk.
Q::ControlBack()
^Q::ControlBack() ; Its CTRL key version, since CTRL is always held. Was this Q or Ctrl+Q !

 ; Release the CTRL key.
Alt::Send "{Ctrl Up}"
^Alt::Send "{Ctrl Up}"

; Exit the script altogether.
F1::ExitApp
^F1::ExitApp

; Performs a double click to skip boss animations.
Space::DoubleClick()
^Space::DoubleClick()

; Pick first perk : Performs multiple clicks on perk locations,
; first click as a pick for the first perk out of three,
; then the perk from the sentinel perk or seraphim reject offer,
; finally click on the spinning wheel.
1::PerkPick(1)
^1::PerkPick(1)

; Second perk of the three, sentile heal, accept seraphim offer.
2::PerkPick(2)
^2::PerkPick(2)

; Third perk out of three.
3::PerkPick(3)
^3::PerkPick(3)

; The secondary and ultimate abilities are already implemented
; in the game through E and F respectively
