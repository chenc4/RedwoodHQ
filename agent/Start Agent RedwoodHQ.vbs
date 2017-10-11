Dim WshShell,pid,objFile, strLine,dbPort,dbPath
Set objShell = CreateObject("Shell.Application")

objShell.ShellExecute """F:\chenchen5\RedwoodHQ\vendor\nodejs\node.exe""", """F:\chenchen5\RedwoodHQ\agent\app.js""", "F:\chenchen5\RedwoodHQ\agent", "runas", 0

vnc = "not installed"

If vnc="installed" Then

Dim objFSO: Set objFSO = CreateObject("Scripting.FileSystemObject")

objShell.ShellExecute """F:\chenchen5\RedwoodHQ\vendor\UltraVNC\winvnc.exe""", "", "F:\chenchen5\RedwoodHQ\agent", "runas", 0

objShell.ShellExecute """F:\chenchen5\RedwoodHQ\vendor\nodejs\node.exe""", "vnc.js", "F:\chenchen5\RedwoodHQ\agent", "runas", 0


Set objwmi=getobject("winmgmts:\\.\root\cimv2")
Set colProcess = objwmi.ExecQuery("Select * from Win32_Process")
For each ind_process in colProcess
	If ind_process.name="winvnc.exe"  Then
		'Wscript.Echo(ind_process.ProcessId)
		pid=ind_process.ProcessId
	End If
	
Next
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile("F:\chenchen5\RedwoodHQ\agent\agent.vnc.pid",2,true)
objFileToWrite.WriteLine(pid)
objFileToWrite.Close
Set objFileToWrite = Nothing

End If