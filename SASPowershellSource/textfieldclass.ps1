class textField : system.windows.forms.textbox{

textField([string] $text, [int] $width, [int] $height,  [int] $pointx, [int] $pointy,[bool] $autosize,[bool] $multiline)
{
	$this.text = $text
	$this.width = $width
	$this.height = $height
	$this.font = 'Microsoft Sans Serif, 10'
	$this.location =  New-Object System.Drawing.Point($pointx,$pointy)
	$this.multiline = $multiline
	$this.autosize = $autosize

}
}