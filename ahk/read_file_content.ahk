#SingleInstance Force

; Set the path to your file
filePath := "auth_code.txt"

; Read the file content
authCode := FileRead(filePath)

; Open Notepad
Run("notepad")
WinWaitActive("Untitled")

; Paste the file content
Send(authCode)
