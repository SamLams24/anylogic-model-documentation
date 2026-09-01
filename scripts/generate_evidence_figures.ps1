Add-Type -AssemblyName System.Drawing

$outputDirectory = Join-Path $PSScriptRoot "..\figures"
$outputDirectory = [System.IO.Path]::GetFullPath($outputDirectory)

function New-Canvas {
    param([int]$Width = 1600, [int]$Height = 900)
    $bitmap = New-Object System.Drawing.Bitmap $Width, $Height
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

function Draw-FlowNode {
    param($Graphics, $Node, $Font, $TextBrush, $BorderPen)
    $Graphics.FillRectangle($Node.Brush, $Node.X, $Node.Y, $Node.W, $Node.H)
    $Graphics.DrawRectangle($BorderPen, $Node.X, $Node.Y, $Node.W, $Node.H)
    Draw-CenteredText $Graphics $Node.Label $Font $TextBrush $Node.X $Node.Y $Node.W $Node.H
}

$ink = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(32, 42, 56))
$muted = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(82, 94, 108))
$accent = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(32, 112, 144))
$accentSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(224, 239, 245))
$secondarySoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(235, 239, 228))
$externalSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(220, 235, 247))
$internalSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(250, 232, 199))
$processSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(224, 239, 224))
$stockSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(235, 225, 245))
$messageSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(244, 234, 214))
$border = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(151, 164, 177)), 2
$arrowPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(58, 78, 96)), 4
$arrowPen.CustomEndCap = New-Object System.Drawing.Drawing2D.AdjustableArrowCap 6, 8
$titleFont = New-Object System.Drawing.Font "Arial", 28, ([System.Drawing.FontStyle]::Bold)
$groupFont = New-Object System.Drawing.Font "Arial", 18, ([System.Drawing.FontStyle]::Bold)
$labelFont = New-Object System.Drawing.Font "Arial", 15, ([System.Drawing.FontStyle]::Regular)
$valueFont = New-Object System.Drawing.Font "Arial", 23, ([System.Drawing.FontStyle]::Bold)
$smallFont = New-Object System.Drawing.Font "Arial", 15, ([System.Drawing.FontStyle]::Regular)
$flowFont = New-Object System.Drawing.Font "Arial", 22, ([System.Drawing.FontStyle]::Bold)
$messageFont = New-Object System.Drawing.Font "Arial", 20, ([System.Drawing.FontStyle]::Bold)
$eAcute = [char]0x00E9
$eGrave = [char]0x00E8
$aGrave = [char]0x00E0
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
Draw-CenteredText $graphics ("Excel et ABox concordants | PCE estim" + $eAcute) $smallFont $muted 100 790 1400 35
$bitmap.Save((Join-Path $outputDirectory "dashboard_vsm_valide.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()

$canvas = New-Canvas
$bitmap = $canvas[0]
$graphics = $canvas[1]
Draw-CenteredText $graphics ("Pipeline VSM, m" + $eAcute + "triques, attributs et PI") $titleFont $ink 80 35 1440 60

$pipelineNodes = @(
    @{X=25; W=175; Title="Observations"; Body="Traces runtime"},
    @{X=220; W=175; Title="Indicateurs VSM"; Body="Temps et PCE"},
    @{X=415; W=175; Title=("M" + $eAcute + "triques"); Body="Associations"},
    @{X=610; W=175; Title="Normalisation"; Body="Bottom, Perfect"},
    @{X=805; W=175; Title="Logique floue"; Body="Grades internes"},
    @{X=1000; W=175; Title="Attributs"; Body="RL, RS, AG`nCO, AM"},
    @{X=1195; W=175; Title=("Pond" + $eAcute + "ration"); Body="Poids internes"},
    @{X=1390; W=175; Title="PI"; Body="6,11881172`nsur 10"}
)

foreach ($node in $pipelineNodes) {
    $graphics.FillRectangle($accentSoft, $node.X, 245, $node.W, 250)
    $graphics.DrawRectangle($border, $node.X, 245, $node.W, 250)
    Draw-CenteredText $graphics $node.Title $groupFont $ink $node.X 265 $node.W 75
    Draw-CenteredText $graphics $node.Body $labelFont $muted $node.X 350 $node.W 100
}

for ($index = 0; $index -lt ($pipelineNodes.Count - 1); $index++) {
    $startX = $pipelineNodes[$index].X + $pipelineNodes[$index].W + 4
    $endX = $pipelineNodes[$index + 1].X - 4
    $graphics.DrawLine($arrowPen, $startX, 370, $endX, 370)
}

Draw-CenteredText $graphics "Poids: RL 0,40 | RS 0,20 | AG 0,10 | CO 0,15 | AM 0,15" $groupFont $accent 160 575 1280 50
Draw-CenteredText $graphics ("Les profils Bottom/Perfect sont internes au mod" + $eGrave + "le. Le score ne constitue pas une notation externe de ZENER SA Togo.") $labelFont $ink 130 665 1340 70
Draw-CenteredText $graphics ("Ex" + $eAcute + "cution valid" + $eAcute + "e | Profils internes au mod" + $eGrave + "le") $smallFont $muted 100 805 1400 30
$bitmap.Save((Join-Path $outputDirectory "pipeline_vsm_scor_pi.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()

$canvas = New-Canvas 1400 1900
$bitmap = $canvas[0]
$graphics = $canvas[1]
Draw-CenteredText $graphics ("Cha" + [char]0x00EE + "ne d'ex" + $eAcute + "cution consolid" + $eAcute + "e") $titleFont $ink 80 35 1240 65

$chainLabels = @(
    @{Label="Commande cliente CMD_1"; Brush=$externalSoft},
    @{Label="Diagnostic du stock de produit fini"; Brush=$stockSoft},
    @{Label="Ordre interne REAPPRO_1"; Brush=$internalSoft},
    @{Label=("Analyse mati" + $eGrave + "re"); Brush=$stockSoft},
    @{Label="Source"; Brush=$processSoft},
    @{Label="MaterialAvailable"; Brush=$stockSoft},
    @{Label="Make"; Brush=$processSoft},
    @{Label=("Cr" + $eAcute + "dit du stock de produit fini"); Brush=$stockSoft},
    @{Label=("R" + $eAcute + "veil de CMD_1"); Brush=$externalSoft},
    @{Label="Deliver"; Brush=$processSoft},
    @{Label=("Cl" + $oCircumflex + "ture client"); Brush=$externalSoft}
)

$chainNodes = @()
for ($index = 0; $index -lt $chainLabels.Count; $index++) {
    $chainNodes += @{X=300; Y=(130 + $index * 142); W=800; H=82; Label=$chainLabels[$index].Label; Brush=$chainLabels[$index].Brush}
}
foreach ($node in $chainNodes) { Draw-FlowNode $graphics $node $flowFont $ink $border }
for ($index = 0; $index -lt ($chainNodes.Count - 1); $index++) {
    $graphics.DrawLine($arrowPen, 700, ($chainNodes[$index].Y + $chainNodes[$index].H + 6), 700, ($chainNodes[$index + 1].Y - 7))
}

$legendY = 1740
$legend = @(
    @{X=120; Label="Commande externe"; Brush=$externalSoft},
    @{X=420; Label="Ordre interne"; Brush=$internalSoft},
    @{X=700; Label="Processus"; Brush=$processSoft},
    @{X=940; Label=("Stock ou disponibilit" + $eAcute); Brush=$stockSoft}
)
foreach ($item in $legend) {
    $graphics.FillRectangle($item.Brush, $item.X, $legendY, 42, 28)
    $graphics.DrawRectangle($border, $item.X, $legendY, 42, 28)
    $graphics.DrawString($item.Label, $smallFont, $ink, ($item.X + 55), ($legendY + 4))
}
$bitmap.Save((Join-Path $outputDirectory "chaine_execution_consolidee.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()

$canvas = New-Canvas 1400 2050
$bitmap = $canvas[0]
$graphics = $canvas[1]
Draw-CenteredText $graphics "Propagation du retard fournisseur" $titleFont $ink 80 35 1240 65
Draw-CenteredText $graphics ("De l'alerte locale " + $aGrave + " la r" + $eAcute + "vision du plan Deliver") $labelFont $muted 80 95 1240 45

$propagationLabels = @(
    @{Label="Supplier"; Brush=$processSoft},
    @{Label="SupplierDelayAlert"; Brush=$messageSoft},
    @{Label=("Source op" + $eAcute + "rationnel"); Brush=$processSoft},
    @{Label="OperationalException"; Brush=$messageSoft},
    @{Label="Coordinateur Source"; Brush=$processSoft},
    @{Label="ProcessDeviationReport"; Brush=$messageSoft},
    @{Label="Tactique Source"; Brush=$processSoft},
    @{Label="RevisedMaterialAvailability"; Brush=$messageSoft},
    @{Label="Tactique Make"; Brush=$processSoft},
    @{Label="RevisedProductionCompletionDate"; Brush=$messageSoft},
    @{Label="Tactique Deliver"; Brush=$processSoft},
    @{Label="RevisedDeliveryPlan"; Brush=$messageSoft},
    @{Label="Coordinateur Deliver"; Brush=$processSoft}
)

$propagationNodes = @()
for ($index = 0; $index -lt $propagationLabels.Count; $index++) {
    $isMessage = ($index % 2 -eq 1)
    $nodeWidth = if ($isMessage) { 860 } else { 640 }
    $nodeX = (1400 - $nodeWidth) / 2
    $propagationNodes += @{X=$nodeX; Y=(155 + $index * 138); W=$nodeWidth; H=78; Label=$propagationLabels[$index].Label; Brush=$propagationLabels[$index].Brush}
}
foreach ($node in $propagationNodes) {
    $nodeFont = if ($node.Brush -eq $messageSoft) { $messageFont } else { $flowFont }
    Draw-FlowNode $graphics $node $nodeFont $ink $border
}
for ($index = 0; $index -lt ($propagationNodes.Count - 1); $index++) {
    $graphics.DrawLine($arrowPen, 700, ($propagationNodes[$index].Y + $propagationNodes[$index].H + 5), 700, ($propagationNodes[$index + 1].Y - 7))
}

$graphics.FillRectangle($processSoft, 320, 1945, 42, 28)
$graphics.DrawRectangle($border, 320, 1945, 42, 28)
$graphics.DrawString("Acteur ou niveau de pilotage", $smallFont, $ink, 375, 1949)
$graphics.FillRectangle($messageSoft, 790, 1945, 42, 28)
$graphics.DrawRectangle($border, 790, 1945, 42, 28)
$graphics.DrawString(("Message AER observ" + $eAcute), $smallFont, $ink, 845, 1949)
$bitmap.Save((Join-Path $outputDirectory "propagation_retard_fournisseur.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()

$titleFont.Dispose()
$groupFont.Dispose()
$labelFont.Dispose()
$valueFont.Dispose()
$smallFont.Dispose()
$flowFont.Dispose()
$messageFont.Dispose()
$ink.Dispose()
$muted.Dispose()
$accent.Dispose()
$accentSoft.Dispose()
$secondarySoft.Dispose()
$externalSoft.Dispose()
$internalSoft.Dispose()
$processSoft.Dispose()
$stockSoft.Dispose()
$messageSoft.Dispose()
$border.Dispose()
$arrowPen.Dispose()
