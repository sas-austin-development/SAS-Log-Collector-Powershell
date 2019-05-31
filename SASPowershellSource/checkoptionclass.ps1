Class checkoption : System.Windows.Forms.checkbox {
checkoption(){}

checkoption([string] $text, [int] $width, [int] $height, [int] $pointx, [int] $pointy, [bool] $autoSize, [bool] $enabled){
	$this.width = $width
	$this.text = $text
	$this.height = $height
	$this.font = 'Microsoft Sans Serif, 10'
	$this.location =  New-Object System.Drawing.Point($pointx,$pointy)
	$this.autosize = $autoSize
	$this.enabled = $enabled
}

}