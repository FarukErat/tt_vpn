#Requires AuthoHotkey v2.0
#SingleInstance Force

ivanti_exe := "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe -show"
ivanti_homepage := "Ivanti Secure Access Client"
sms_window := "Connect to:"

Run(ivanti_exe)
WinWaitActivate(ivanti_homepage)

Click(262, 135) ; relative coordinate of connect button
WinWait(sms_window)
