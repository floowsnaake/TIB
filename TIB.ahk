#SingleInstance Force

SetWorkingDir, %A_ScriptDir%
#MaxThreadsPerHotkey 2
#Include classMemory.ahk
#Persistent

gameWinTitle := "GAME HERE"
mem := new _ClassMemory(gameWinTitle)

Player_X := 0x000000
Player_Y := 0x000000

Global Player_Y
Global Player_X
Global X_done
Global Y_done

Global read_Px
Global read_Py

Global xx
Global yy
Global nodes_done
X_done := 0
Y_done := 0

CoordMode,client

ToolTip,T.I.B-2.0`n`nZ start`nC pause`n^!X Record nodes (2000) time,0,0

SetTimer,Read_mem,50

Read_mem:
read_Px = % mem.read(Player_X, "ufloat")
read_Py = % mem.read(Player_Y, "ufloat")
return



X::
Loop
{
nodez++
ToolTip, Node Recorder`nNode %nodez%`n X:`n%read_Px%`nY: %read_Py%,0,0
FileAppend,Walk_to_Node("%read_Px%|%read_Py%")`n,TL2.txt
Sleep, 200
}
return


c::
MsgBox puased
Pause
return

Z::

WinActivate,Torchlight: Infinite
WinWaitActive,Torchlight: Infinite
Sleep,1000

;===================================================

;===================================================


;!!!!!!!!!PATH INSIDE THESE!


; Walk_to_Node("-5735.014160","-7028.085938")





;===================================================

Walk_to_Node(xx,yy)
{
X_done = 0
Y_done = 0
Loop
{


dx := read_Px-xx
dy := read_Py-yy

ToolTip,T.I.B-2.0`n`nAdress Type: UFloat`nPlayer X:%read_Px%`nPlayer Y:%read_Py%`nX Node:%xx%`nY Node:%yy%`nDistance from X Node:%dx%`nDistance from Y Node:%dy%`nWalking Directions: %Dir%`nNodes Cleared:%nodes_done%/154`nX coordinate Done: %X_done%`nY coordinate Done: %Y_done%`ntolerance of the Nodes for X_done and Y_done: -200 to +200`nKey sleep/Delay time: 300`nNode Record Timer: 500,11,32

IF (X_done = 1 AND Y_done = 1)
{
X_done = 0
Y_done = 0
nodes_done++
break
}

IF (dx >= -200 and dx <= 200)
{
X_done = 1
send, {down up}
send, {up up}
}

IF (dy >= -200 and dy <= 200)
{
Y_done = 1
send, {down up}
send, {up up}
}


IF(Y_done = 0)
{
IF (read_Py > yy)
{
send, {left up}
send, {up up}
send, {right up}

Dir = V Down

send, {down down}
Sleep,300
send, {down up}
}

IF (read_Py < yy)
{
send, {left up}
send, {down up}
send, {right up}

Dir = ^ Up

send, {up down}
Sleep,300
send, {up up}
}
}

IF(X_done = 0)
{
IF (read_Px > xx)
{
send, {right up}
send, {up up}
send, {down up}

Dir = Left ->

send, {left down}
Sleep,300
send, {left up}
}

IF (read_Px < xx)
{
send, {left up}
send, {up up}
send, {down up}

Dir = <- Right

send, {right down}
Sleep,300
send, {right up}
}
}

}
}

return