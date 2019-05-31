Class buttons : System.Windows.Forms.Button {
buttons(){}

buttons([string] $text, [int] $width, [int] $height, [int] $pointx, [int] $pointy){

	$this.width = $width
	$this.text = $text
	$this.height = $height
	$this.font = 'Microsoft Sans Serif, 10'
	$this.location =  New-Object System.Drawing.Point($pointx,$pointy)
}

}