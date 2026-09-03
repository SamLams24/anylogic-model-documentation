Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Drawing

$chEAcute = [char]0x00E9
$chEGrave = [char]0x00E8
$chOCirc = [char]0x00F4

$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$documentationDirectory = Split-Path -Parent $scriptDirectory
$figureDirectory = Join-Path $documentationDirectory 'figures'
New-Item -ItemType Directory -Path $figureDirectory -Force | Out-Null

function New-Node {
    param(
        [int]$X,
        [int]$Y,
        [int]$Width,
        [int]$Height,
        [string]$Text,
        [string]$Kind = 'process'
    )
    [pscustomobject]@{ X = $X; Y = $Y; Width = $Width; Height = $Height; Text = $Text; Kind = $Kind }
}

function New-Edge {
    param([int]$From, [int]$To, [string]$Label = '')
    [pscustomobject]@{ From = $From; To = $To; Label = $Label }
}

function Get-NodeBrush {
    param([string]$Kind)
    switch ($Kind) {
        'input' { return [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(237, 243, 248)) }
        'decision' { return [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255, 247, 230)) }
        'output' { return [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(238, 247, 241)) }
        'actor' { return [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(242, 237, 250)) }
        default { return [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(245, 245, 245)) }
    }
}

function Write-Diagram {
    param(
        [string]$Title,
        [object[]]$Nodes,
        [object[]]$Edges,
        [string]$FileName,
        [int]$Width = 1800,
        [int]$Height = 900
    )

    $bitmap = [System.Drawing.Bitmap]::new($Width, $Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $graphics.Clear([System.Drawing.Color]::White)

    $titleFont = [System.Drawing.Font]::new('Arial', 25, [System.Drawing.FontStyle]::Bold)
    $nodeFont = [System.Drawing.Font]::new('Arial', 16, [System.Drawing.FontStyle]::Regular)
    $labelFont = [System.Drawing.Font]::new('Arial', 13, [System.Drawing.FontStyle]::Italic)
    $titleBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(40, 55, 70))
    $textBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(25, 25, 25))
    $borderPen = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(51, 92, 129), 3)
    $edgePen = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(70, 70, 70), 3)
    $arrow = [System.Drawing.Drawing2D.AdjustableArrowCap]::new(5, 6, $true)
    $edgePen.CustomEndCap = $arrow
    $center = [System.Drawing.StringFormat]::new()
    $center.Alignment = [System.Drawing.StringAlignment]::Center
    $center.LineAlignment = [System.Drawing.StringAlignment]::Center

    $graphics.DrawString($Title, $titleFont, $titleBrush, 45, 30)

    foreach ($edge in $Edges) {
        $from = $Nodes[$edge.From]
        $to = $Nodes[$edge.To]
        $x1 = $from.X + $from.Width
        $y1 = $from.Y + [int]($from.Height / 2)
        $x2 = $to.X
        $y2 = $to.Y + [int]($to.Height / 2)
        if ($to.X -lt $from.X) {
            $x1 = $from.X
            $x2 = $to.X + $to.Width
        }
        $graphics.DrawLine($edgePen, $x1, $y1, $x2, $y2)
        if ($edge.Label) {
            $mx = [int](($x1 + $x2) / 2)
            $my = [int](($y1 + $y2) / 2) - 28
            $graphics.DrawString($edge.Label, $labelFont, $textBrush, $mx, $my, $center)
        }
    }

    foreach ($node in $Nodes) {
        $rectangle = [System.Drawing.RectangleF]::new($node.X, $node.Y, $node.Width, $node.Height)
        $brush = Get-NodeBrush $node.Kind
        $graphics.FillRectangle($brush, $rectangle)
        $graphics.DrawRectangle($borderPen, $node.X, $node.Y, $node.Width, $node.Height)
        $graphics.DrawString($node.Text, $nodeFont, $textBrush, $rectangle, $center)
        $brush.Dispose()
    }

    $target = Join-Path $figureDirectory $FileName
    $bitmap.Save($target, [System.Drawing.Imaging.ImageFormat]::Png)

    $center.Dispose()
    $arrow.Dispose()
    $edgePen.Dispose()
    $borderPen.Dispose()
    $textBrush.Dispose()
    $titleBrush.Dispose()
    $labelFont.Dispose()
    $nodeFont.Dispose()
    $titleFont.Dispose()
    $graphics.Dispose()
    $bitmap.Dispose()
    Write-Host "Figure generee : $target"
}

$architectureNodes = @(
    (New-Node 70 250 260 130 'Configuration JSON et interface' 'input'),
    (New-Node 470 160 300 130 "Donn${chEAcute}es m${chEAcute}tier et r${chEAcute}seau logistique" 'process'),
    (New-Node 470 420 300 130 'Agents et communications AER' 'actor'),
    (New-Node 910 290 300 130 "Ex${chEAcute}cution des flux et d${chEAcute}cisions" 'decision'),
    (New-Node 1360 130 300 130 'Mesures VSM, SCOR et PI' 'output'),
    (New-Node 1360 450 300 130 'CSV, Excel, ABox et vues' 'output')
)
$architectureEdges = @(
    (New-Edge 0 1), (New-Edge 0 2), (New-Edge 1 3), (New-Edge 2 3), (New-Edge 3 4), (New-Edge 3 5)
)
Write-Diagram 'Architecture fonctionnelle de SCONTO-SVU' $architectureNodes $architectureEdges 'architecture_generale.png'

$commandNodes = @(
    (New-Node 50 320 230 120 'Commande cliente CMD' 'input'),
    (New-Node 350 320 230 120 'Analyse du stock fini' 'decision'),
    (New-Node 680 140 230 120 'Stock disponible' 'output'),
    (New-Node 680 500 230 120 'Attente de reconstitution' 'decision'),
    (New-Node 1030 320 230 120 "R${chEAcute}servation du produit" 'process'),
    (New-Node 1360 320 230 120 'Deliver' 'process'),
    (New-Node 1660 320 120 120 "Cl${chOCirc}ture" 'output')
)
$commandEdges = @(
    (New-Edge 0 1), (New-Edge 1 2 'oui'), (New-Edge 1 3 'non'), (New-Edge 2 4),
    (New-Edge 3 4 "r${chEAcute}veil"), (New-Edge 4 5), (New-Edge 5 6)
)
Write-Diagram 'Cycle d''une commande cliente' $commandNodes $commandEdges 'cycle_commande.png'

$stockNodes = @(
    (New-Node 60 130 280 120 'CMD : demande externe' 'input'),
    (New-Node 60 560 280 120 'REAPPRO : ordre interne' 'actor'),
    (New-Node 480 130 280 120 'Servir ou mettre en attente' 'decision'),
    (New-Node 480 560 280 120 "Calculer le besoin mati${chEGrave}re" 'decision'),
    (New-Node 900 560 220 120 'Source' 'process'),
    (New-Node 1220 560 220 120 'Make' 'process'),
    (New-Node 1540 560 220 120 "Cr${chEAcute}diter le stock fini" 'output'),
    (New-Node 1220 130 220 120 'Deliver' 'output')
)
$stockEdges = @(
    (New-Edge 0 2), (New-Edge 2 7 'stock suffisant'), (New-Edge 2 1 'stock insuffisant'),
    (New-Edge 1 3), (New-Edge 3 4), (New-Edge 4 5), (New-Edge 5 6), (New-Edge 6 2 "r${chEAcute}veiller")
)
Write-Diagram 'Commande cliente et reconstitution autonome du stock' $stockNodes $stockEdges 'cmd_reappro.png'

$saveNodes = @(
    (New-Node 90 330 280 120 'Configuration actuelle' 'input'),
    (New-Node 500 330 280 120 'Sauver config JSON' 'process'),
    (New-Node 910 330 280 120 'Conversion des blocs' 'process'),
    (New-Node 1320 330 280 120 'Fichier JSON en UTF-8' 'output')
)
$saveEdges = @((New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3))
Write-Diagram 'Sauvegarde d''une configuration' $saveNodes $saveEdges 'workflow_sauvegarde_json.png'

$loadNodes = @(
    (New-Node 40 330 220 120 'Fichier JSON' 'input'),
    (New-Node 330 330 220 120 "Lecture et contr${chOCirc}le" 'decision'),
    (New-Node 620 330 220 120 "Nettoyage de l'${chEAcute}tat" 'process'),
    (New-Node 910 330 220 120 "Reconstruction m${chEAcute}tier" 'process'),
    (New-Node 1200 330 220 120 'Connexions et agents' 'actor'),
    (New-Node 1490 330 260 120 "V${chEAcute}rification avant simulation" 'output')
)
$loadEdges = @((New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4), (New-Edge 4 5))
Write-Diagram 'Chargement et reconstruction d''une configuration' $loadNodes $loadEdges 'workflow_chargement_json.png'
