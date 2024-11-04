#SingleInstance Force

Run("notepad")

; Define the window title of the specific application
windowTitle := "Untitled"

; Wait until the window opens (optional, if you want to ensure it's open before monitoring)
WinWait(windowTitle)

; Wait until the window closes
WinWaitClose(windowTitle)

; Trigger your action here (e.g., show a message or run another script)
MsgBox("The window has closed.")
