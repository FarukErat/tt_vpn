#Requires AutoHotkey v2.0
#SingleInstance Force


ivanti_exe := "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe -show"
ivanti_homepage := "Ivanti Secure Access Client"
sms_window := "Connect to:"
file_path := "auth_code.txt"


Run(ivanti_exe)


WinWaitActivate(ivanti_homepage)
Click(262, 135) ; relative coordinate of connect button


readAndSendAuthCode() {
    global file_path, sms_window
    WinWaitActivate(sms_window)

    Loop {
        auth_code := FileRead(file_path)
        if (auth_code != "") {
            FileDelete(file_path)
            Send(auth_code)
            Send("{Enter}")
            break
        }
        Sleep(1000)
    }

    WinWaitClose(sms_window)
}


Loop {
    readAndSendAuthCode()
}
