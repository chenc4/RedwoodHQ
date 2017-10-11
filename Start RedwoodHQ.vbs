Dim WshShell,pid,objFile, strLine,dbPort,dbPath
Set WshShell = CreateObject("WScript.Shell")
Set objShell = CreateObject("Shell.Application")

Dim objFSO: Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile= objFSO.OpenTextFile("F:\chenchen5\RedwoodHQ\properties.conf", 1)
Do While Not objFile.AtEndOfStream
	strLine = objFile.readline
	If InStr(1, strLine, "DBPort") = 1 Then
		dbPort = Split(strLine,"=")(1)
	End If
	
Loop
objFile.Close

objShell.ShellExecute """F:\chenchen5\RedwoodHQ\vendor\MongoDB\bin\mongod.exe""", "--dbpath ""F:\chenchen5\RedwoodHQ\data\db""", "F:\chenchen5\RedwoodHQ", "runas", 0

objShell.ShellExecute """F:\chenchen5\RedwoodHQ\vendor\nodejs\node.exe""", "app.js", "F:\chenchen5\RedwoodHQ", "runas", 0

Set objwmi=getobject("winmgmts:\\.\root\cimv2")
Set colProcess = objwmi.ExecQuery("Select * from Win32_Process")
For each ind_process in colProcess
	If ind_process.name="mongod.exe"  Then
		'Wscript.Echo(ind_process.ProcessId)
		pid=ind_process.ProcessId
	End If
	
Next
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile("F:\chenchen5\RedwoodHQ\db.pid",2,true)
objFileToWrite.WriteLine(pid)
objFileToWrite.Close
Set objFileToWrite = Nothing

