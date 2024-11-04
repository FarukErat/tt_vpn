#Requires AuthoHotkey v2.0
#SingleInstance Force


ivanti_exe := "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe -show"
ivanti_homepage := "Ivanti Secure Access Client"
sms_window := "Connect to:"
filePath := "auth_code.txt"


Run(ivanti_exe)


WinWaitActivate(ivanti_homepage)
Click(262, 135) ; relative coordinate of connect button


WinWaitActivate(sms_window)
Loop
{
    authCode := FileRead(filePath)
    if (authCode != "")
    {
        FileDelete(filePath)
        break
    }
    Sleep(1000)
}
Send(authCode)
Send("{Enter}")


WinWaitClose(sms_window) ; waits for sms_window to close


WinWait(sms_window) ; waits for sms_window to pop up
WinClose(sms_window) ; when sms_window pops up, it closes
