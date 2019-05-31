Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $true
$TextBox1.width                  = 267
$TextBox1.height                 = 242
$TextBox1.location               = New-Object System.Drawing.Point(10,20)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'
$TextBox1.text 					 = .\Invoke-PartyParrot.ps1

$Form.controls.AddRange(@($TextBox1))

[void]$Form.ShowDialog()