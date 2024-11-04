#Requires AuthoHotkey v2.0
#SingleInstance Force

sms_window := "Connect to:"

WinActivate(sms_window)
Send(A_Args[1])
Send("{Enter}")
Sleep(10000) ; waits for sms_window to close

WinWait(sms_window) ; waits for sms_window to pop up
WinClose(sms_window) ; when sms_window pops up, it closes
