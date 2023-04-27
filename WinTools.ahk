; MyClass.ahk
class WinTools {

    trayArray := Array()

    __New() {
    }

    getCurrentMonitorIndex() {
        CoordMode, Mouse, Screen
        MouseGetPos, mx, my
        SysGet, monitorsCount, 80

        Loop %monitorsCount% {
            SysGet, monitor, Monitor, %A_Index%
            if (monitorLeft <= mx && mx <= monitorRight && monitorTop <= my && my <= monitorBottom){
                return A_Index
            }
        }
        return 1
    }

   moveMouseToCurrentWindowCenter() {
        ; Move mouse to current window
        WinGetPos, winTopL_x, winTopL_y, width, height, A
        winCenter_x := winTopL_x + width/2
        winCenter_y := winTopL_y + height/2
        ;MouseMove, X, Y, 0 ; does not work with multi-monitor
        DllCall("SetCursorPos", int, winCenter_x, int, winCenter_y)
    }

}
