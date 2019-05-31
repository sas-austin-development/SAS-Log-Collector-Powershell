Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

. C:\Users\dizher\Desktop\logic.ps1
. C:\Users\dizher\Desktop\buttonClass.ps1
. C:\Users\dizher\Desktop\checkoptionclass.ps1
. C:\Users\dizher\Desktop\textfieldclass.ps1
. C:\Users\dizher\Desktop\getosname.ps1
. C:\Users\dizher\Desktop\getbitness.ps1

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.BackColor                  = "#ffffff"
$Form.TopMost                    = $false
$Form.MaximizeBox 				 = $false


<#
$newButton = [buttons]::new('test',60,25)
$form.controls.add($newButton)
#>

$Title                           = New-Object system.Windows.Forms.Label
$Title.text                      = "SAS Log Collector"
$Title.AutoSize                  = $true
$Title.width                     = 200
$Title.height                    = 10
$Title.location                  = New-Object System.Drawing.Point(100,31)
$Title.Font                      = 'Microsoft Sans Serif,18'
$Title.ForeColor                 = "#4a90e2"

$welcomeMessage                  = New-Object system.Windows.Forms.ToolTip

$nextButton                      = [buttons]::new('Next',60,30,315,350)
$cancelButton                    = [buttons]::new('Cancel',60,30,245,350)
$browseButton                    = [buttons]::new('Browse',60,30,330,186)
$backButton                      = [buttons]::new('Back',60,30,245,350)
$submitButton					 = [buttons]::new('Submit',60,30,315,350)

$deploywiz                       = [checkoption]::new('Deployment Wizard Logs',200,30,39,236,$false,$true)
$objectSpawner                   = [checkoption]::new('Object Spawner Logs',200,30,39,266,$false,$false)
$enterpriseGuide                 = [checkoption]::new('Enterprise Guide Logs',200,30,39,296,$false,$false)
$workspace                       = [checkoption]::new('Workspace Server Logs',200,30,39,326,$false,$false)




$32Bit = New-Object System.Windows.Forms.radiobutton
$32Bit.Location = '39,190'
$32Bit.size = '350,20'
$32Bit.Checked = $True
$32Bit.text = "32-Bit"

$64Bit = New-Object System.Windows.Forms.radiobutton
$64Bit.Location = '39,210'
$64Bit.size = '350,20'
$64Bit.Checked = $false
$64Bit.text = "64-Bit"


$form.controls.addrange(@($32Bit,$64Bit))



$logTitle                        = New-Object system.Windows.Forms.Label
$logTitle.text                   = ""
$logTitle.AutoSize               = $true
$logTitle.width                  = 200
$logTitle.height                 = 10
$logTitle.location               = New-Object System.Drawing.Point(100,31)
$logTitle.Font                   = 'Microsoft Sans Serif,18'
$logTitle.ForeColor              = "#4a90e2"
$logTitle.visible 				 = $false

$logLabel						 = New-Object system.Windows.Forms.Label
$logLabel.AutoSize				 = $true
$logLabel.width					 = 200
$logLabel.height				 = 10
$logLabel.location				 = New-Object System.Drawing.Point(15,165)
$logLabel.Font					 = 'Microsoft Sans Serif,8'
$logLabel.ForeColor              = "#000000"
$logLabel.visible 				 = $false 

$trackingNumberLabel						 = New-Object system.Windows.Forms.Label
$trackingNumberLabel.AutoSize				 = $true
$trackingNumberLabel.text = "Tracking Number:"
$trackingNumberLabel.width					 = 200
$trackingNumberLabel.height				     = 10
$trackingNumberLabel.location				 = New-Object System.Drawing.Point(15,215)
$trackingNumberLabel.Font					 = 'Microsoft Sans Serif,8'
$trackingNumberLabel.ForeColor               = "#000000"
$trackingNumberLabel.visible 				 = $false 

$trackingNumber					 = New-Object system.Windows.Forms.TextBox
$trackingNumber.multiline 		 = $false
$trackingNumber.text 				 = "761000000"
$trackingNumber.width              = 300
$trackingNumber.AutoSize			 = $true
$trackingNumber.height             = 30
$trackingNumber.location           = New-Object System.Drawing.Point(15,231)
$trackingNumber.Font               = 'Microsoft Sans Serif,10'
$trackingNumber.visible            = $false

$emailAddressLabel						 = New-Object system.Windows.Forms.Label
$emailAddressLabel.AutoSize				 = $true
$emailAddressLabel.text = "Email Address:"
$emailAddressLabel.width					 = 200
$emailAddressLabel.height				     = 10
$emailAddressLabel.location				 = New-Object System.Drawing.Point(15,260)
$emailAddressLabel.Font					 = 'Microsoft Sans Serif,8'
$emailAddressLabel.ForeColor               = "#000000"
$emailAddressLabel.visible 				 = $false 

$emailAddress					 = New-Object system.Windows.Forms.TextBox
$emailAddress.multiline 		 = $false
$emailAddress.text 				 = "support@sas.com"
$emailAddress.width              = 300
$emailAddress.AutoSize			 = $true
$emailAddress.height             = 30
$emailAddress.location           = New-Object System.Drawing.Point(15,276)
$emailAddress.Font               = 'Microsoft Sans Serif,10'
$emailAddress.visible            = $false

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(39,100)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

[void] $listBox.Items.Add('Windows 7')
[void] $listBox.Items.Add('Windows 8')
[void] $listBox.Items.Add('Windows 10')

$listBox.selectedItem = getosname

$bitness = getbitness
if($bitness -like "64-Bit")
{$64bit.checked = $true}
elseif($bitness -like "32-Bit")
{$32Bit.checked = $true}


$logDirectory = [textfield]::new("",300,25,15,186,$true,$true)

$nextButton.Add_click(
	{
		logInput
	}
	)
	
$backButton.Add_click(
	{
		mainScreen
	}
	)
$browseButton.Add_click(
	{
		$logDirectory.text = Select-FolderDialog
	}	
	)


$cancelButton.Add_click(
	{
		exitConfirm
	})

$submitButton.add_click(
	{
		if(($logDirectory.text -ne "") -and ($emailAddress.text -ne "") -and ($trackingNumber.text -ne ""))
		{
			theZipper
			logtransfer
		}
	}
)

$Form.controls.AddRange(@($submitButton,$enterpriseGuide,$workspace,$listBox,$emailAddress, $emailAddressLabel, $trackingNumber, $trackingNumberLabel, $Title,$nextButton,$cancelButton,$logDirectory, $logTitle,$logLabel,$backButton,$browseButton, $objectSpawner, $deploywiz))


#Write your logic code here


	
mainScreen
[void]$Form.ShowDialog()

# . C:\Users\dizher\Desktop\Invoke-PartyParrot.ps1




