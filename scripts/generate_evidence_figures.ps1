Add-Type -AssemblyName System.Drawing

$outputDirectory = Join-Path $PSScriptRoot "..\figures"
$outputDirectory = [System.IO.Path]::GetFullPath($outputDirectory)

function New-Canvas {
    $bitmap = New-Object System.Drawing.Bitmap 1600, 900
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $graphics.Clear([System.Drawing.Color]::FromArgb(248, 249, 250))
    return @($bitmap, $graphics)
}

function Draw-CenteredText {
    param($Graphics, [string]$Text, $Font, $Brush, [float]$X, [float]$Y, [float]$Width, [float]$Height)
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    $Graphics.DrawString($Text, $Font, $Brush, (New-Object System.Drawing.RectangleF($X, $Y, $Width, $Height)), $format)
    $format.Dispose()
}

$ink = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(32, 42, 56))
$muted = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(82, 94, 108))
$accent = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(32, 112, 144))
$accentSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(224, 239, 245))
$secondarySoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(235, 239, 228))
$border = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(151, 164, 177)), 2
$arrowPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(58, 78, 96)), 4
$arrowPen.CustomEndCap = New-Object System.Drawing.Drawing2D.AdjustableArrowCap 6, 8
$titleFont = New-Object System.Drawing.Font "Arial", 28, ([System.Drawing.FontStyle]::Bold)
$groupFont = New-Object System.Drawing.Font "Arial", 19, ([System.Drawing.FontStyle]::Bold)
$labelFont = New-Object System.Drawing.Font "Arial", 15, ([System.Drawing.FontStyle]::Regular)
$valueFont = New-Object System.Drawing.Font "Arial", 23, ([System.Drawing.FontStyle]::Bold)
$smallFont = New-Object System.Drawing.Font "Arial", 12, ([System.Drawing.FontStyle]::Regular)
$eAcute = [char]0x00E9
$eGrave = [char]0x00E8
$oCircumflex = [char]0x00F4

$canvas = New-Canvas
$bitmap = $canvas[0]
$graphics = $canvas[1]
Draw-CenteredText $graphics ("Indicateurs VSM valid" + $eAcute + "s") $titleFont $ink 100 35 1400 60
Draw-CenteredText $graphics "Commande cliente, registre CMD_1" $groupFont $accent 100 105 1400 45

$topLabels = @("Order Processing Time", "Order Waiting / Dwell Time", "Order Fulfillment Lead Time")
$topValues = @("18 116,84 s", "46 924,40 s", "65 041,24 s")
$bottomLabels = @("ZENER Process Time", "ZENER Waiting Time", "ZENER Estimated PCE")
$bottomValues = @("59,39 s", "12,70 s", "70,9 %")

for ($index = 0; $index -lt 3; $index++) {
    $x = 100 + ($index * 500)
    $graphics.FillRectangle($accentSoft, $x, 165, 430, 190)
    $graphics.DrawRectangle($border, $x, 165, 430, 190)
    Draw-CenteredText $graphics $topLabels[$index] $labelFont $ink $x 185 430 55
    Draw-CenteredText $graphics $topValues[$index] $valueFont $accent $x 245 430 75
}

Draw-CenteredText $graphics ("VSM focalis" + $eAcute + " ZENER, observations ACT_4") $groupFont $accent 100 405 1400 45
for ($index = 0; $index -lt 3; $index++) {
    $x = 100 + ($index * 500)
    $graphics.FillRectangle($secondarySoft, $x, 465, 430, 190)
    $graphics.DrawRectangle($border, $x, 465, 430, 190)
    Draw-CenteredText $graphics $bottomLabels[$index] $labelFont $ink $x 485 430 55
    Draw-CenteredText $graphics $bottomValues[$index] $valueFont $accent $x 545 430 75
}

Draw-CenteredText $graphics ("Identit" + $eAcute + " contr" + $oCircumflex + "l" + $eAcute + "e: 18 116,83756052 + 46 924,40300189 = 65 041,24056241 s") $labelFont $ink 100 700 1400 45
Draw-CenteredText $graphics ("RUN_1773129600000_1788264883846 | Excel et ABox concordants | PCE estim" + $eAcute) $smallFont $muted 100 790 1400 35
$bitmap.Save((Join-Path $outputDirectory "dashboard_vsm_valide.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()

$canvas = New-Canvas
$bitmap = $canvas[0]
$graphics = $canvas[1]
Draw-CenteredText $graphics ("Pipeline VSM, m" + $eAcute + "triques, attributs et PI") $titleFont $ink 80 35 1440 60

$nodes = @(
    @{X=55; W=230; Title="Observations runtime"; Body="CMD_1, REAPPRO_1`nACT_4, stocks, AER"},
    @{X=315; W=230; Title="Indicateurs VSM"; Body="Temps commande`nTemps ZENER, PCE"},
    @{X=575; W=230; Title=("M" + $eAcute + "triques"); Body=("Associations nomm" + $eAcute + "es`nProxys explicites")},
    @{X=835; W=230; Title="Normalisation"; Body="Bottom, Perfect`nGrades flous"},
    @{X=1095; W=230; Title="Attributs"; Body="RL, RS, AG`nCO, AM"},
    @{X=1355; W=190; Title="PI"; Body="6,11881172`nsur 10"}
)

foreach ($node in $nodes) {
    $graphics.FillRectangle($accentSoft, $node.X, 250, $node.W, 250)
    $graphics.DrawRectangle($border, $node.X, 250, $node.W, 250)
    Draw-CenteredText $graphics $node.Title $groupFont $ink $node.X 275 $node.W 65
    Draw-CenteredText $graphics $node.Body $labelFont $muted $node.X 350 $node.W 110
}

for ($index = 0; $index -lt ($nodes.Count - 1); $index++) {
    $startX = $nodes[$index].X + $nodes[$index].W + 8
    $endX = $nodes[$index + 1].X - 8
    $graphics.DrawLine($arrowPen, $startX, 375, $endX, 375)
}

Draw-CenteredText $graphics "Poids: RL 0,40 | RS 0,20 | AG 0,10 | CO 0,15 | AM 0,15" $groupFont $accent 160 585 1280 50
Draw-CenteredText $graphics ("Les profils Bottom/Perfect sont internes au mod" + $eGrave + "le. Le score ne constitue pas une notation externe de ZENER SA Togo.") $labelFont $ink 130 675 1340 70
Draw-CenteredText $graphics ("Run valid" + $eAcute + ": RUN_1773129600000_1788264883846") $smallFont $muted 100 805 1400 30
$bitmap.Save((Join-Path $outputDirectory "pipeline_vsm_scor_pi.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()

$titleFont.Dispose()
$groupFont.Dispose()
$labelFont.Dispose()
$valueFont.Dispose()
$smallFont.Dispose()
$ink.Dispose()
$muted.Dispose()
$accent.Dispose()
$accentSoft.Dispose()
$secondarySoft.Dispose()
$border.Dispose()
$arrowPen.Dispose()
