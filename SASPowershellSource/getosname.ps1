Function getosname
{
	#$os = Get-ComputerInfo -Property "osname"
	$os = (Get-WMIObject win32_operatingsystem).name
	
	if($os -like "*10*")
		{return "Windows 10"}
	elseif($os -like "*8*")
		{return "Windows 8"}
	elseif($os -like "*7*")
		{return "Windows 7"}
}