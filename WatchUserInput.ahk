#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Run, KeyBoardIn.ahk,,,EinzeltasteNowID
OnExit,Schluss
k:={}
Loop
{
	L:=A_Space A_Space A_Space
	R:=A_Space A_Space A_Space
	if(GetKeyState("LButton"))
		L:="🗬"
	if(GetKeyState("RButton"))
		R:="🗭"
	MouseGetPos,X,Y
	veraendert:=false
	kk:=
	FileRead,kk,EinzeltasteNow.txt
	if not ErrorLevel
	{
		FileDelete,EinzeltasteNow.txt
		c.=kk
		vomKeyboard= % A_Tab "⌨ " c " ⌨"
		LastCharTime:=A_TickCount
		veraendert:=true
	}
	if(vomKeyboard<>"" AND A_TickCount-LastCharTime > 2000)
	{
		c:=
		vomKeyboard:=
		veraendert:=true
	}
	if(A_TimeIdle>4000)
	{
		ToolTip
	}
	if (xalt<>x or yalt<>y or lalt<>l or ralt<>r or veraendert)
	{
		ToolTip,%L%🐭%R%%vomKeyboard%
	}
	xalt:=x
	yalt:=y
	lalt:=l
	ralt:=r
}
LShift & RShift::
Schluss:
Process,Close,%EinzeltasteNowID%
ExitApp
