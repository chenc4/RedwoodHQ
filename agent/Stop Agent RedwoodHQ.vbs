Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute """D:\Program Files\RedwoodHQ Agent\vendor\nodejs\node.exe""", """D:\Program Files\RedwoodHQ Agent\agent\agentWrapper.js"" --stop", "D:\Program Files\RedwoodHQ Agent\agent", "runas", 0
objShell.ShellExecute """F:\chenchen5\RedwoodHQ\vendor\nodejs\node.exe""", """F:\chenchen5\RedwoodHQ\agent\agentWrapper.js"" --stop", "F:\chenchen5\RedwoodHQ\agent", "runas", 0
