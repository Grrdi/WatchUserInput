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
	kveraendert:=false
	kk:=
	FileRead,kk,EinzeltasteNow.txt
	if not ErrorLevel
	{
		k.push(kk)
		FileDelete,EinzeltasteNow.txt
		c:=
		for,Index,Char in K
			c.=Char
		vomKeyboard= % A_Tab "⌨ " c " ⌨"
		LastCharTime:=A_TickCount
		kveraendert:=true
	}
	if(vomKeyboard<>"" AND A_TickCount-LastCharTime > 2000)
	{
		k:=[]
		vomKeyboard:=
		kveraendert:=true
	}
	if(A_TimeIdle>4000)
	{
		ToolTip
	}
	if (xalt<>x or yalt<>y or lalt<>l or ralt<>r or kveraendert)
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
