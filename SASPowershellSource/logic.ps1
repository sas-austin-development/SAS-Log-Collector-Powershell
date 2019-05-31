#global Variables
$logDir = 'C:\Users\' + $env:username + "\AppData\Local\SAS"





Function mainScreen
	{
		$nextButton.visible = $true
		$objectSpawner.visible = $true
		$deployWiz.visible = $true
		$browseButton.visible = $false
		$trackingNumber.visible = $false
		$trackingNumberLabel.visible = $false
		$emailAddress.visible = $false
		$emailAddressLabel.visible = $false
		$backButton.visible = $false
		$logTitle.visible = $false
		$logLabel.visible = $false
		$logDirectory.visible = $false
		$cancelButton.location   = New-Object System.Drawing.Point(245,350)
		$listBox.visible = $true
		$32bit.visible = $true
		$64bit.visible = $true
		$objectSpawner.visible = $true
		$workspace.visible = $true
		$submitbutton.visible = $false
		$enterpriseGuide.visible = $true
	}
	
Function logInput
	{
		if($deployWiz.checked)
			{
				deployWizProtocol
			}
	}

Function deployWizProtocol
	{
		#$Title.visible 			 = $False
		$cancelButton.location = New-Object System.Drawing.Point(15,350)
		$objectSpawner.visible = $false
		$browseButton.visible	 = $true
		$nextButton.visible 	 = $false
		$deployWiz.visible 		 = $False
		$enterpriseGuide.visible = $false
		$workspace.visible = $false
		$workspace.visible = $false
		$listBox.visible = $false
		$32bit.visible = $false
		$64bit.visible = $false
		$logTitle.visible 		 = $true
		$logLabel.visible 		 = $true
		$logDirectory.visible 	 = $true
		$logDir = 'C:\Users\' + $env:username + "\AppData\Local\SAS"
		if(Test-path $logDir){
			$logDirectory.text = $logDir}
		
		$logDirectory.enabled = $false
		$backButton.visible		 = $true
		$submitbutton.visible = $true
		$trackingNumber.visible  = $true
		$trackingNumberLabel.visible = $true
		$emailAddress.visible 	 = $true
		$emailAddressLabel.visible = $true
		$logLabel.text			 = "SAS Deployment Wizard Log Directory:"
		#if($logDirectory.text -eq "")
		#{
		#	$logDirectory.text 		 = Select-FolderDialog
		#}
	}
	



Function theZipper
	{
		$source = $logDirectory.text
		$destination = "C:\Users\" + $env:username + "\Desktop\SASLogs.zip"
		if(Test-path $destination){
			Remove-item $destination}
		Add-Type -assembly "system.io.compression.filesystem"
		[io.compression.zipfile]::CreateFromDirectory($source, $destination)
	}

#submit-process powershell.exe .\Invoke-PartyParrot.ps1

Function Select-FolderDialog
	{
    param([string]$Description="Select Folder",[string]$RootFolder="Desktop")

	[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
     Out-Null     

   $objForm = New-Object System.Windows.Forms.FolderBrowserDialog
        $objForm.Rootfolder 	 = $RootFolder
        $objForm.Description 	 = $Description
        $Show = $objForm.ShowDialog()
		
        If ($show -eq "OK")
        {
			
            return $objForm.SelectedPath
        }
		If ($show -eq "Cancel")
		{return $logdir}
        }
    
	
Function exitConfirm
{
	$exitForm = New-Object system.Windows.Forms.Form
	
	$okButton = New-Object System.Windows.Forms.Button
	$okButton.location = New-Object System.Drawing.Point(100,80)
	$okButton.text = "Okay"
	$okButton.Add_click(
	{
		$exitForm.close()
		$Form.close()
		
	})
	
	$noButton = New-Object system.Windows.Forms.Button
	$noButton.location = New-Object System.Drawing.Point(20,80)
	$noButton.text = "No"
	$noButton.Add_click(
	{
		$exitForm.close()
	})
	
	$exitForm.controls.addrange(@($okButton,$noButton))

	$exitForm.ShowDialog()
}

Function logtransfer
{
	$logs = "C:\Users\" + $env:username + "\Desktop\SASLogs.zip"
	$client = New-Object System.Net.WebClient
	$client.credentials = New-Object System.net.networkCredential("arts","@preworkout131173!")
	$client.uploadfile("ftp://stormfly.na.sas.com/logdir", "C:\Users\dizher\Desktop\SASLogs.zip")

	

}