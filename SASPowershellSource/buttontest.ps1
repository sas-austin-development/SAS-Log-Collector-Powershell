Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

. C:\Users\dizher\Desktop\logic.ps1
. C:\Users\dizher\Desktop\buttonClass.ps1

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.BackColor                  = "#ffffff"
$Form.TopMost                    = $false
$Form.MaximizeBox 				 = $false

Class buttons : System.Windows.Forms.Button {
buttons(){

	$this.text = 'test'
	$this.width = 60
	$this.height = 25
	$this.font = 'Microsoft Sans Serif, 10'
	$this.location =  New-Object System.Drawing.Point(315,50)
	$this.visible = $true
}

}

$newButtom = [buttons]::new()
$form.controls.add($newButton)


[void]$Form.ShowDialog()