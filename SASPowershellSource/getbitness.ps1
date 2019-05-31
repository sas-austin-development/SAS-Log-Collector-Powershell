Function getbitness
{
	#$os = Get-ComputerInfo -Property "osarchitecture"
	<#
	if($os -like "*64*")
		{return "64-Bit"}
	elseif($os -like "*32*")
		{return "32-Bit"}
		#>
	
	if([Environment]::Is64BitProcess)
		{return "64-Bit"}
	elseif([Environment]::Is32BitProcess)
		{return "32-Bit"}
}