#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%

popupDuration := 700
offset := 12

; -------- CTRL + C (PASS-THROUGH) --------
~^c::
    Sleep, 150
    ClipWait, 0.5, 1

    if (ErrorLevel)
        ShowTip("Empty")
    else
        ShowTip("Copied")
return

; -------- POPUP --------
ShowTip(text) {
    global popupDuration, offset
    MouseGetPos, x, y
    x += offset
    y += offset

    ToolTip, %text%, %x%, %y%
    SetTimer, HideTip, -%popupDuration%
}

HideTip:
    ToolTip
return
