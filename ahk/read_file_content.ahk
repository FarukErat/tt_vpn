#SingleInstance Force

; Set the path to your file
filePath := "auth_code.txt"

; Busy wait until the file has content
Loop
{
    ; Read the file content
    authCode := FileRead(filePath)

    ; Check if the content is not empty
    if (authCode != "")
    {
        ; Create a new file with the name from the content
        FileAppend("", authCode) ; Create an empty file with the name read from auth_code.txt

        ; Clear the original file content
        FileDelete(filePath)
        FileAppend("", filePath) ; Create an empty file again if needed

        ; Exit the script after creating the file
        Exit
    }

    ; Optional: Sleep for a short duration to avoid high CPU usage
    Sleep(100) ; Adjust the duration as needed
}
