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
DPadCenter := { x: 210, y: 744 }
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

; Model
class Model {
    ControlBack() {
        Send "{Ctrl Up}"
        MouseMove DPadCenter.x, DPadCenter.y
        Send "{Ctrl Down}"
    }

    AbilityPick(key) {
        idxs := []
        switch key {
            case KeyAbility1:
                idxs := [1, 4]
            case KeyAbility2:
                idxs := [2, 5]
            case KeyAbility3:
                idxs := [3]
        }
        for idx in idxs {
            Click PerkScreenLocations[idx].x, PerkScreenLocations[idx].y
            Sleep 400
        }
        this.ControlBack()
    }

    DoubleClick() {
        Click DPadCenter.x, DPadCenter.y
        Sleep 100
        Click DPadCenter.x, DPadCenter.y
        this.ControlBack()
    }

    ControlRelease() {
        Send "{Blind}{Ctrl Up}"
    }

    WindowActiveStatus(state) {
        if (!state && GetKeyState("Ctrl")) {
            this.ControlRelease()
        }
    }

    Exit() {
        this.ControlRelease()
        Sleep 500
        ExitApp
    }
}

; GUI
class View {
    BlinkToggle := false
    BlinkCount := 0
    HotkeysOptions := "w30 h30 0x200 Border Center"
    DescriptionYOffset := "xp y+m+15"
    __New() {
        this.UI := Gui("-SysMenu", "Mighty Doom PC Controls")
        this.UI.BackColor := "1e1e1e"
        this.UI.SetFont("s10", "Arial") ; Fallback font
        this.UI.SetFont("s10 c909898", "Consolas")
        ; Hotkeys display
        this.ResetCtrlKey := this.UI.AddText(this.HotkeysOptions, KeyResetControl)
        this.ResetCtrlKey.SetFont("bold")
        this.Ability1 := this.UI.AddText("xm " this.HotkeysOptions, KeyAbility1)
        this.Ability1.SetFont("bold")
        this.Ability2 := this.UI.AddText("x+m " this.HotkeysOptions, KeyAbility2)
        this.Ability2.SetFont("bold")
        this.Ability3 := this.UI.AddText("x+m " this.HotkeysOptions, KeyAbility3)
        this.Ability3.SetFont("bold")
        this.DoubleClick := this.UI.AddText("xm w72 h30 0x200 Border Center", KeyDoubleClick)
        this.DoubleClick.SetFont("bold")
        this.ReleaseCtrl := this.UI.AddText("xm " this.HotkeysOptions, KeyReleaseCtrl)
        this.ReleaseCtrl.SetFont("bold")
        this.Exit := this.UI.AddText("xm " this.HotkeysOptions, KeyExit)
        this.Exit.SetFont("bold")
        ; Descriptions display
        this.UI.AddText("section ym+6", ": Represse Ctrl")
        this.UI.AddText(this.DescriptionYOffset, ": Choose an Ability")
        this.UI.AddText(this.DescriptionYOffset, ": Double click")
        this.UI.AddText(this.DescriptionYOffset, ": Release Ctrl key")
        this.UI.AddText(this.DescriptionYOffset, ": Exit application")
        ; States
        this.UI.AddText("xm w260 0x10")
        this.UI.AddText("xm", DeviceName)
        this.UI.AddText("xm", "Ctrl")
        this.WindowActiveState := this.UI.AddText("xs yp-22 cGray", ": Deactivated")
        this.CtrlState := this.UI.AddText("xs y+m cGray", "Released")
        this.UI.Show()

        ; An encapsulation gymnastic, bind 'this' with the method name, necessary for the callback
        this.SetTimerEncapsulator := ObjBindMethod(this, "BlinkCallback")
    }

    CtrlStatus() {
        if (GetKeyState("Ctrl")) {
            this.CtrlState.Value := "PRESSED"
            this.CtrlState.SetFont("cGreen bold italic")
        } else {
            this.CtrlState.Value := "Released"
            this.CtrlState.SetFont("cGray norm")
        }
    }

    WindowActiveStatus(state) {
        If (state) {
            this.WindowActiveState.Value := "ACTIVE"
            this.WindowActiveState.SetFont("bold italic")
        } else {
            this.WindowActiveState.Value := "Deactivated"
            this.WindowActiveState.SetFont("norm")
        }
        this.CtrlStatus()
    }

    BlinkTimer(key) {
        switch key {
            case KeyResetControl:
                SetTimer(this.SetTimerEncapsulator.Bind(this.ResetCtrlKey), 70)
            case KeyAbility1:
                SetTimer(this.SetTimerEncapsulator.Bind(this.Ability1), 70)
            case KeyAbility2:
                SetTimer(this.SetTimerEncapsulator.Bind(this.Ability2), 70)
            case KeyAbility3:
                SetTimer(this.SetTimerEncapsulator.Bind(this.Ability3), 70)
            case KeyDoubleClick:
                SetTimer(this.SetTimerEncapsulator.Bind(this.DoubleClick), 70)
            case KeyReleaseCtrl:
                SetTimer(this.SetTimerEncapsulator.Bind(this.ReleaseCtrl), 70)
            case KeyExit:
                SetTimer(this.SetTimerEncapsulator.Bind(this.Exit), 70)
        }
    }

    BlinkCallback(target) {
        this.BlinkToggle := !this.BlinkToggle
        if (this.BlinkToggle) {
            this.Blink(target)
        } else {
            this.UnBlink(target)
        }

        this.BlinkCount := this.BlinkCount + 1
        if (this.BlinkCount >= 4) {
            this.BlinkCount := 0
            this.UnBlink(target)
            SetTimer(, 0)
        }
    }

    Blink(target) {
        target.Opt("BackgroundGreen")
        target.SetFont("s11")
    }

    UnBlink(target) {
        target.Opt("BackgroundDefault")
        target.SetFont("s10")
    }
}

; View Model
class ViewModel {
    __New(model, ui) {
        this.Model := model
        this.UI := ui
    }

    ControlBack(hotkey) {
        this.UI.BlinkTimer(KeyResetControl)
        this.Model.ControlBack()
        this.UI.CtrlStatus()
    }

    AbilityPick(hotkey, key) {
        this.UI.BlinkTimer(key)
        this.Model.AbilityPick(key)
        this.UI.CtrlStatus()
    }

    DoubleClick(hotkey) {
        this.UI.BlinkTimer(KeyDoubleClick)
        this.Model.DoubleClick()
    }

    ControlRelease(hotkey) {
        this.UI.BlinkTimer(KeyReleaseCtrl)
        this.Model.ControlRelease()
        this.ui.CtrlStatus()
    }

    WindowActiveStatus(state) {
        this.Model.WindowActiveStatus(state)
        this.UI.WindowActiveStatus(state)
    }

    Exit(hotkey) {
        this.UI.BlinkTimer(KeyExit)
        this.Model.Exit()
    }
}

; Init
Application := Model()
ApplicationUI := View()
ApplicationVM := ViewModel(Application, ApplicationUI)

; Keystrokes
; The main key to use whenever controls are lost, usually at each stage entrance, or after choosing a perk.
AppControlBack := ObjBindMethod(ApplicationVM, "ControlBack") ; Encapsulation for the callback
Hotkey(KeyResetControl, AppControlBack)
Hotkey("^" KeyResetControl, AppControlBack) ; Its CTRL key version, since CTRL is always held. Was this Q or Ctrl+Q !

; Pick first perk : Performs multiple clicks on perk locations,
; first click as a pick for the first perk out of three,
; then the perk from the sentinel perk or seraphim reject offer,
; finally click on the spinning wheel.
AppAbilityPick := ObjBindMethod(ApplicationVM, "AbilityPick")
Hotkey(KeyAbility1, AppAbilityPick.Bind(1))
Hotkey("^" KeyAbility1, AppAbilityPick.Bind(1))

; Second perk of the three, sentile heal, accept seraphim offer.
Hotkey(KeyAbility2, AppAbilityPick.Bind(2))
Hotkey("^" KeyAbility2, AppAbilityPick.Bind(2))

; Third perk out of three.
Hotkey(KeyAbility3, AppAbilityPick.Bind(3))
Hotkey("^" KeyAbility3, AppAbilityPick.Bind(3))

; Performs a double click to skip boss animations.
AppDoubleClick := ObjBindMethod(ApplicationVM, "DoubleClick")
Hotkey(KeyDoubleClick, AppDoubleClick)
Hotkey("^" KeyDoubleClick, AppDoubleClick)

; Release the CTRL key.
AppControlRelease := ObjBindMethod(ApplicationVM, "ControlRelease")
Hotkey(KeyReleaseCtrl, AppControlRelease)
Hotkey("^" KeyReleaseCtrl, AppControlRelease)

; Exit the script altogether.
AppExit := ObjBindMethod(ApplicationVM, "Exit")
Hotkey(KeyExit, AppExit)
Hotkey("^" KeyExit, AppExit)

; The secondary and ultimate abilities are already implemented
; in the game through E and F respectively

; This script periodically checks if the 'scrcpy' window is still active. Here named DeviceName.
; If it is not active, the script automatically releases the Ctrl key.
; This allow to switch to another app without worrying about the Ctrl key being pressed.

SetTimer(IsAppWindowActive)
IsAppWindowActive() {
    state := WinActive(DeviceName)
    ApplicationVM.WindowActiveStatus(state)
}
