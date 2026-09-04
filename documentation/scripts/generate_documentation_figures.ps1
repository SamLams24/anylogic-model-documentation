Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Drawing

$chEAcute = [char]0x00E9
$chEAcuteUpper = [char]0x00C9
$chEGrave = [char]0x00E8
$chECirc = [char]0x00EA
$chICirc = [char]0x00EE
$chAGrave = [char]0x00E0
$chCCedilla = [char]0x00E7
$chOCirc = [char]0x00F4
$chUGrave = [char]0x00F9

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
    param([int]$From, [int]$To, [string]$Label = '', [string]$Style = 'solid')
    [pscustomobject]@{ From = $From; To = $To; Label = $Label; Style = $Style }
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
        $fromCenterX = $from.X + [int]($from.Width / 2)
        $fromCenterY = $from.Y + [int]($from.Height / 2)
        $toCenterX = $to.X + [int]($to.Width / 2)
        $toCenterY = $to.Y + [int]($to.Height / 2)
        $deltaX = $toCenterX - $fromCenterX
        $deltaY = $toCenterY - $fromCenterY
        if ([Math]::Abs($deltaX) -ge [Math]::Abs($deltaY)) {
            $x1 = if ($deltaX -ge 0) { $from.X + $from.Width } else { $from.X }
            $y1 = $fromCenterY
            $x2 = if ($deltaX -ge 0) { $to.X } else { $to.X + $to.Width }
            $y2 = $toCenterY
        } else {
            $x1 = $fromCenterX
            $y1 = if ($deltaY -ge 0) { $from.Y + $from.Height } else { $from.Y }
            $x2 = $toCenterX
            $y2 = if ($deltaY -ge 0) { $to.Y } else { $to.Y + $to.Height }
        }
        $edgePen.DashStyle = if ($edge.Style -eq 'dashed') {
            [System.Drawing.Drawing2D.DashStyle]::Dash
        } else {
            [System.Drawing.Drawing2D.DashStyle]::Solid
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
        if ($node.Kind -eq 'decision') {
            $points = [System.Drawing.Point[]]@(
                [System.Drawing.Point]::new($node.X + [int]($node.Width / 2), $node.Y),
                [System.Drawing.Point]::new($node.X + $node.Width, $node.Y + [int]($node.Height / 2)),
                [System.Drawing.Point]::new($node.X + [int]($node.Width / 2), $node.Y + $node.Height),
                [System.Drawing.Point]::new($node.X, $node.Y + [int]($node.Height / 2))
            )
            $graphics.FillPolygon($brush, $points)
            $graphics.DrawPolygon($borderPen, $points)
        } else {
            $graphics.FillRectangle($brush, $rectangle)
            $graphics.DrawRectangle($borderPen, $node.X, $node.Y, $node.Width, $node.Height)
        }
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

function Write-SequenceDiagram {
    param(
        [string]$Title,
        [string[]]$Participants,
        [object[]]$Messages,
        [string]$FileName,
        [int]$Width = 1900,
        [int]$Height = 1120
    )

    $bitmap = [System.Drawing.Bitmap]::new($Width, $Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $graphics.Clear([System.Drawing.Color]::White)

    $titleFont = [System.Drawing.Font]::new('Arial', 25, [System.Drawing.FontStyle]::Bold)
    $participantFont = [System.Drawing.Font]::new('Arial', 14, [System.Drawing.FontStyle]::Bold)
    $messageFont = [System.Drawing.Font]::new('Arial', 13, [System.Drawing.FontStyle]::Regular)
    $titleBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(40, 55, 70))
    $textBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(25, 25, 25))
    $headerBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(237, 243, 248))
    $borderPen = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(51, 92, 129), 3)
    $lifePen = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(130, 130, 130), 2)
    $lifePen.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
    $messagePen = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(55, 55, 55), 2.5)
    $arrow = [System.Drawing.Drawing2D.AdjustableArrowCap]::new(5, 6, $true)
    $messagePen.CustomEndCap = $arrow
    $center = [System.Drawing.StringFormat]::new()
    $center.Alignment = [System.Drawing.StringAlignment]::Center
    $center.LineAlignment = [System.Drawing.StringAlignment]::Center

    $graphics.DrawString($Title, $titleFont, $titleBrush, 45, 28)
    $left = 130
    $right = 130
    $headerTop = 100
    $headerWidth = 210
    $headerHeight = 78
    $spacing = if ($Participants.Count -gt 1) { ($Width - $left - $right) / ($Participants.Count - 1) } else { 0 }
    $xPositions = @()
    for ($i = 0; $i -lt $Participants.Count; $i++) {
        $x = [int]($left + $i * $spacing)
        $xPositions += $x
        $rect = [System.Drawing.RectangleF]::new($x - [int]($headerWidth / 2), $headerTop, $headerWidth, $headerHeight)
        $graphics.FillRectangle($headerBrush, $rect)
        $graphics.DrawRectangle($borderPen, [int]$rect.X, [int]$rect.Y, [int]$rect.Width, [int]$rect.Height)
        $graphics.DrawString($Participants[$i], $participantFont, $textBrush, $rect, $center)
        $graphics.DrawLine($lifePen, $x, $headerTop + $headerHeight, $x, $Height - 55)
    }

    $startY = 230
    $stepY = [int](($Height - $startY - 80) / [Math]::Max(1, $Messages.Count))
    for ($i = 0; $i -lt $Messages.Count; $i++) {
        $m = $Messages[$i]
        $y = $startY + $i * $stepY
        $x1 = $xPositions[$m.From]
        $x2 = $xPositions[$m.To]
        $messagePen.DashStyle = if ($m.Style -eq 'return') {
            [System.Drawing.Drawing2D.DashStyle]::Dash
        } else {
            [System.Drawing.Drawing2D.DashStyle]::Solid
        }
        if ($m.From -eq $m.To) {
            $graphics.DrawLine($messagePen, $x1, $y, $x1 + 80, $y)
            $graphics.DrawLine($messagePen, $x1 + 80, $y, $x1 + 80, $y + 34)
            $graphics.DrawLine($messagePen, $x1 + 80, $y + 34, $x1, $y + 34)
            $labelX = $x1 + 10
            $labelY = $y - 25
        } else {
            $graphics.DrawLine($messagePen, $x1, $y, $x2, $y)
            $labelX = [int](($x1 + $x2) / 2) - 110
            $labelY = $y - 27
        }
        $graphics.DrawString($m.Label, $messageFont, $textBrush, $labelX, $labelY)
    }

    $center.Dispose(); $arrow.Dispose(); $messagePen.Dispose(); $lifePen.Dispose(); $borderPen.Dispose()
    $headerBrush.Dispose(); $textBrush.Dispose(); $titleBrush.Dispose(); $messageFont.Dispose()
    $participantFont.Dispose(); $titleFont.Dispose(); $graphics.Dispose()
    $target = Join-Path $figureDirectory $FileName
    $bitmap.Save($target, [System.Drawing.Imaging.ImageFormat]::Png)
    $bitmap.Dispose()
    Write-Host "Figure generee : $target"
}

function New-SequenceMessage {
    param([int]$From, [int]$To, [string]$Label, [string]$Style = 'call')
    [pscustomobject]@{ From = $From; To = $To; Label = $Label; Style = $Style }
}

$purposeNodes = @(
    (New-Node 730 330 360 150 'SCONTO-SVU' 'actor'),
    (New-Node 80 120 260 100 "Comprendre la cha${chICirc}ne" 'input'),
    (New-Node 470 120 220 100 'Configurer' 'input'),
    (New-Node 820 90 220 100 'Simuler' 'input'),
    (New-Node 1160 120 220 100 'Observer' 'input'),
    (New-Node 1480 120 220 100 'Mesurer' 'input'),
    (New-Node 1480 330 220 100 'Tracer' 'output'),
    (New-Node 120 690 300 105 "Responsable acad${chEAcute}mique" 'output'),
    (New-Node 540 690 300 105 'Responsable de projet' 'output'),
    (New-Node 960 690 300 105 "Utilisateur ou d${chEAcute}monstrateur" 'output'),
    (New-Node 1380 690 300 105 "D${chEAcute}veloppeur ou mainteneur" 'output')
)
$purposeEdges = @(
    (New-Edge 1 0), (New-Edge 2 0), (New-Edge 3 0), (New-Edge 0 4), (New-Edge 0 5), (New-Edge 0 6),
    (New-Edge 0 7), (New-Edge 0 8), (New-Edge 0 9), (New-Edge 0 10)
)
Write-Diagram "Finalit${chEAcute}s et publics de SCONTO-SVU" $purposeNodes $purposeEdges 'finalite_publics.png' 1800 900

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

$flowNodes = @(
    (New-Node 60 150 300 120 "Mati${chEGrave}res et produits" 'input'),
    (New-Node 510 150 320 120 'Source, Make, Deliver' 'process'),
    (New-Node 1010 150 300 120 'Stocks et mouvements' 'output'),
    (New-Node 60 440 300 120 'Commandes et ordres' 'actor'),
    (New-Node 510 440 320 120 "Messages, d${chEAcute}cisions, alertes" 'actor'),
    (New-Node 1010 440 300 120 "Plans et r${chEAcute}ponses" 'actor'),
    (New-Node 60 730 300 120 "${chEAcute}v${chEAcute}nements et mesures" 'output'),
    (New-Node 510 730 320 120 'Tables, CSV et Excel' 'output'),
    (New-Node 1010 730 300 120 'ABox et archivage' 'output'),
    (New-Node 1450 410 300 160 "Une ex${chEAcute}cution, trois lectures compl${chEAcute}mentaires" 'decision')
)
$flowEdges = @(
    (New-Edge 0 1), (New-Edge 1 2),
    (New-Edge 3 4), (New-Edge 4 5),
    (New-Edge 6 7), (New-Edge 7 8),
    (New-Edge 1 6 'observer'), (New-Edge 4 6 'tracer'),
    (New-Edge 2 9), (New-Edge 5 9), (New-Edge 8 9)
)
Write-Diagram 'Flux physique, informationnel et probatoire' $flowNodes $flowEdges 'trois_flux.png' 1800 1000

$actorNodes = @(
    (New-Node 70 110 340 105 'Fournisseur du GPL' 'input'),
    (New-Node 70 350 340 105 'Fournisseur de bouteilles vides' 'input'),
    (New-Node 70 590 340 105 'Fournisseur des accessoires' 'input'),
    (New-Node 710 340 360 130 "ZENER SA Togo`nEntreprise focale" 'actor'),
    (New-Node 1400 350 320 110 "Client g${chEAcute}n${chEAcute}rique" 'output')
)
$actorEdges = @(
    (New-Edge 0 3 'GPL vrac'), (New-Edge 1 3 'contenants'), (New-Edge 2 3 'accessoires'), (New-Edge 3 4 'produit fini')
)
Write-Diagram 'Acteurs de la configuration ZENER' $actorNodes $actorEdges 'chaine_acteurs.png' 1800 850

$dataNodes = @(
    (New-Node 50 130 280 130 "Acteur`ncat${chEAcute}gorie, r${chOCirc}le" 'actor'),
    (New-Node 430 130 300 130 "Fiche mati${chEGrave}re`nstock, s${chEAcute}curit${chEAcute}, d${chEAcute}lai" 'input'),
    (New-Node 830 130 250 130 "Mati${chEGrave}re`nidentifiant" 'input'),
    (New-Node 1180 130 330 130 "Nomenclature`nquantit${chEAcute} par unit${chEAcute}" 'process'),
    (New-Node 50 520 280 130 "Sc${chEAcute}nario`nproduit, gamme" 'input'),
    (New-Node 430 520 280 130 "Produit`nparcours ex${chEAcute}cut${chEAcute}" 'output'),
    (New-Node 830 520 280 130 "Poste`nmicro-activit${chEAcute}, capacit${chEAcute}" 'process'),
    (New-Node 1230 520 280 130 "Machine`ncapacit${chEAcute}, cycle" 'process')
)
$dataEdges = @(
    (New-Edge 0 1 'fournit'), (New-Edge 1 2 "param${chEGrave}tre"), (New-Edge 2 3 'requise par'),
    (New-Edge 4 5 "d${chEAcute}crit"), (New-Edge 5 3 'porte'),
    (New-Edge 4 6 'gamme'), (New-Edge 6 7 'affectation'), (New-Edge 0 6 'responsable')
)
Write-Diagram "Relations entre les donn${chEAcute}es m${chEAcute}tier" $dataNodes $dataEdges 'modele_donnees_metier.png' 1750 820

$commandNodes = @(
    (New-Node 50 470 210 110 'Commande cliente CMD' 'input'),
    (New-Node 330 470 220 110 'Prise en charge' 'process'),
    (New-Node 640 430 290 190 'Stock produit fini suffisant ?' 'decision'),
    (New-Node 1040 130 220 110 "R${chEAcute}server" 'process'),
    (New-Node 1350 130 190 110 'Deliver' 'process'),
    (New-Node 1620 130 210 110 "R${chEAcute}ception client" 'output'),
    (New-Node 1620 330 210 110 "Cl${chOCirc}ture" 'output'),
    (New-Node 1010 750 250 110 "Ouvrir l'attente" 'process'),
    (New-Node 1350 750 250 110 "Cr${chEAcute}er ou lier REAPPRO" 'actor'),
    (New-Node 1570 940 250 110 "Cr${chEAcute}diter le stock fini" 'output'),
    (New-Node 1050 940 250 110 "R${chEAcute}veiller CMD" 'process'),
    (New-Node 580 940 280 110 "Nouvelle analyse du stock" 'process')
)
$commandEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3 'oui'), (New-Edge 3 4),
    (New-Edge 4 5), (New-Edge 5 6), (New-Edge 2 7 'non'), (New-Edge 7 8),
    (New-Edge 8 9 'Source puis Make si besoin'), (New-Edge 9 10),
    (New-Edge 10 11), (New-Edge 11 2 "r${chEAcute}analyse")
)
Write-Diagram 'Cycle d''une commande cliente' $commandNodes $commandEdges 'cycle_commande.png' 1900 1120

$commandParticipants = @(
    'Client externe',
    "AOe-sD1.2`nOrder Management",
    "AOp-sD1.3`nPilotage Deliver",
    'Stock produit fini',
    'Politique MTS',
    "Ex${chEAcute}cution Deliver"
)
$commandMessages = @(
    (New-SequenceMessage 0 1 'CustomerOrder'),
    (New-SequenceMessage 1 2 'OrderReceived'),
    (New-SequenceMessage 2 3 'InventoryCheckRequest'),
    (New-SequenceMessage 3 2 'InventoryAvailabilityResponse' 'return'),
    (New-SequenceMessage 2 4 '[stock insuffisant] ouvrir attente'),
    (New-SequenceMessage 4 4 "cr${chEAcute}er ou rattacher REAPPRO_*"),
    (New-SequenceMessage 4 2 "[stock cr${chEAcute}dit${chEAcute}] r${chEAcute}veiller et r${chEAcute}analyser" 'return'),
    (New-SequenceMessage 2 3 'ReserveInventory'),
    (New-SequenceMessage 2 5 'DeliveryPlan et instructions'),
    (New-SequenceMessage 5 0 "livraison, r${chEAcute}ception et cl${chOCirc}ture")
)
Write-SequenceDiagram "${chEAcuteUpper}changes utiles au traitement d'une commande" $commandParticipants $commandMessages 'sequence_commande_client.png'

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

$decisionNodes = @(
    (New-Node 60 150 280 110 'Stock disponible' 'input'),
    (New-Node 430 120 320 170 "Disponible au moins ${chEAcute}gal au besoin CMD ?" 'decision'),
    (New-Node 890 100 250 110 "R${chEAcute}server puis Deliver" 'output'),
    (New-Node 890 300 250 110 'Mettre CMD en attente' 'process'),
    (New-Node 60 650 340 110 "Stock projet${chEAcute} produit fini" 'input'),
    (New-Node 480 620 330 170 "Stock projet${chEAcute} inf${chEAcute}rieur ou ${chEAcute}gal au ROP ?" 'decision'),
    (New-Node 940 620 300 110 "Cr${chEAcute}er REAPPRO born${chEAcute}" 'actor'),
    (New-Node 1360 620 300 110 "Source si besoin, puis Make" 'process'),
    (New-Node 1360 310 300 110 "Cr${chEAcute}diter le stock et r${chEAcute}veiller CMD" 'output')
)
$decisionEdges = @(
    (New-Edge 0 1), (New-Edge 1 2 'oui'), (New-Edge 1 3 'non'),
    (New-Edge 4 5), (New-Edge 5 6 'oui'), (New-Edge 6 7), (New-Edge 7 8),
    (New-Edge 8 1 "r${chEAcute}analyse du service"), (New-Edge 3 6 'politique autonome')
)
Write-Diagram "Deux d${chEAcute}cisions distinctes autour du stock fini" $decisionNodes $decisionEdges 'decision_stock_fini.png' 1800 930

$needNodes = @(
    (New-Node 50 100 270 105 "Quantit${chEAcute} ${chAGrave} produire" 'input'),
    (New-Node 50 280 270 105 "Nomenclature par unit${chEAcute}" 'input'),
    (New-Node 50 460 270 105 'Stock disponible' 'input'),
    (New-Node 50 640 270 105 "R${chEAcute}ceptions attendues" 'input'),
    (New-Node 50 820 270 105 "Stock de s${chEAcute}curit${chEAcute} et d${chEAcute}lai" 'input'),
    (New-Node 650 400 390 190 "Besoin et stock projet${chEAcute}s`nselon la politique active" 'decision'),
    (New-Node 1320 260 330 120 "Source : quantit${chEAcute} manquante" 'output'),
    (New-Node 1320 610 330 120 "Mati${chEGrave}re disponible pour Make" 'output')
)
$needEdges = @(
    (New-Edge 0 5), (New-Edge 1 5), (New-Edge 2 5), (New-Edge 3 5), (New-Edge 4 5),
    (New-Edge 5 6 'si manque'), (New-Edge 5 7 'si couvert')
)
Write-Diagram "Lecture p${chEAcute}dagogique du besoin mati${chEGrave}re" $needNodes $needEdges 'besoin_net_matiere.png' 1800 1020

$replenishmentParticipants = @(
    'Politique MTS',
    "AT-sP3`nPlan Make",
    "AT-sP2`nPlan Source",
    'SupplierActor',
    "AOe-sS1.3`nReceiving",
    "Ex${chEAcute}cution Make",
    'Magasin PF',
    'CMD en attente'
)
$replenishmentMessages = @(
    (New-SequenceMessage 0 1 'ordre interne REAPPRO_*'),
    (New-SequenceMessage 1 2 "[mati${chEGrave}re manquante] MaterialAvailabilityRequest"),
    (New-SequenceMessage 2 3 'PurchaseOrder'),
    (New-SequenceMessage 3 4 'InboundDelivery'),
    (New-SequenceMessage 4 2 'MaterialReceived' 'return'),
    (New-SequenceMessage 2 1 'MaterialAvailable' 'return'),
    (New-SequenceMessage 1 5 'ProductionPlan et affectation'),
    (New-SequenceMessage 5 6 "unit${chEAcute}s produites, cr${chEAcute}dit M1.5"),
    (New-SequenceMessage 6 0 "stock fini reconstitu${chEAcute}" 'return'),
    (New-SequenceMessage 0 7 "r${chEAcute}veil et nouvelle analyse")
)
Write-SequenceDiagram 'Reconstitution autonome du stock fini' $replenishmentParticipants $replenishmentMessages 'sequence_reconstitution_stock.png' 2000 1120

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

$userPathNodes = @(
    (New-Node 70 350 300 140 'Choisir un objectif' 'decision'),
    (New-Node 500 90 260 110 "Pr${chEAcute}parer" 'input'),
    (New-Node 850 90 300 110 "Configuration et nomenclature" 'process'),
    (New-Node 1260 90 300 110 "Contr${chOCirc}ler puis sauvegarder" 'output'),
    (New-Node 500 350 260 110 "Ex${chEAcute}cuter" 'input'),
    (New-Node 850 350 300 110 "R${chEAcute}gler puis d${chEAcute}marrer" 'process'),
    (New-Node 1260 350 300 110 "Suivre l'ex${chEAcute}cution" 'output'),
    (New-Node 500 610 260 110 'Analyser' 'input'),
    (New-Node 850 610 300 110 "Vue Globale et vues cibl${chEAcute}es" 'process'),
    (New-Node 1260 610 300 110 "Interpr${chEAcute}ter les sorties" 'output')
)
$userPathEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3),
    (New-Edge 0 4), (New-Edge 4 5), (New-Edge 5 6),
    (New-Edge 0 7), (New-Edge 7 8), (New-Edge 8 9)
)
Write-Diagram "Trois parcours possibles dans le mod${chEGrave}le" $userPathNodes $userPathEdges 'parcours_utilisateur.png' 1700 850

$jsonBlockNodes = @(
    (New-Node 680 330 320 150 "Configuration JSON`n13 blocs racine" 'actor'),
    (New-Node 50 70 430 160 "Identification`nmeta" 'input'),
    (New-Node 580 70 520 190 "Configuration m${chEAcute}tier`nparametresGlobaux, acteurs, postes, scenarios`nmachines, fichesMatiere" 'process'),
    (New-Node 1200 70 500 190 "Mesure et pond${chEAcute}ration`nnormalizationProfiles, ahpConfiguration`nperformanceMeasurement" 'process'),
    (New-Node 180 650 450 170 "Tra${chCCedilla}abilit${chEAcute}`naboxExport" 'output'),
    (New-Node 1050 650 500 170 "Hi${chEAcute}rarchie d'${chEAcute}quipements`nisa95Hierarchy, isa95Assignments" 'output')
)
$jsonBlockEdges = @(
    (New-Edge 1 0), (New-Edge 2 0), (New-Edge 3 0), (New-Edge 0 4), (New-Edge 0 5)
)
Write-Diagram "Organisation m${chEAcute}tier des blocs JSON" $jsonBlockNodes $jsonBlockEdges 'blocs_json.png' 1800 900

$jsonSelectionParticipants = @(
    'Utilisateur',
    'Vue Configuration',
    'Liste des fichiers',
    'Chargeur JSON',
    "Mod${chEGrave}le"
)
$jsonSelectionMessages = @(
    (New-SequenceMessage 0 1 'Rafraichir la liste'),
    (New-SequenceMessage 1 2 'rechercher scenario_*.json'),
    (New-SequenceMessage 2 1 "noms tri${chEAcute}s" 'return'),
    (New-SequenceMessage 1 0 'afficher les choix' 'return'),
    (New-SequenceMessage 0 1 "s${chEAcute}lectionner puis charger"),
    (New-SequenceMessage 1 3 "transmettre le fichier s${chEAcute}lectionn${chEAcute}"),
    (New-SequenceMessage 3 3 "refuser si une ex${chEAcute}cution est active"),
    (New-SequenceMessage 3 4 "lire, contr${chOCirc}ler et reconstruire"),
    (New-SequenceMessage 4 1 "actualiser l'interface" 'return'),
    (New-SequenceMessage 1 0 'confirmer le chargement' 'return')
)
Write-SequenceDiagram "S${chEAcute}lection et chargement d'une configuration JSON" $jsonSelectionParticipants $jsonSelectionMessages 'sequence_selection_json.png' 1900 1120

# --- Chapitres 6 a 10 : processus, agents, VSM, SCOR/PI, ISA-95 ---

$scorWorkflowNodes = @(
    (New-Node 60 460 220 110 'Plan' 'process'),
    (New-Node 380 460 220 110 'Source' 'process'),
    (New-Node 700 460 220 110 'Make' 'process'),
    (New-Node 1020 460 220 110 'Deliver' 'process'),
    (New-Node 1340 460 220 110 'Client' 'output'),
    (New-Node 1020 120 260 110 'Return client (DR1)' 'actor'),
    (New-Node 380 800 280 110 'Return fournisseur (SR1)' 'actor')
)
$scorWorkflowEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4),
    (New-Edge 3 5 "branche disponible, non observ${chEAcute}e" 'dashed'),
    (New-Edge 1 6 "branche disponible, non observ${chEAcute}e" 'dashed')
)
Write-Diagram "Encha${chICirc}nement Plan, Source, Make, Deliver et Return" $scorWorkflowNodes $scorWorkflowEdges 'workflow_scor.png' 1750 1000

$microActNodes = @(
    (New-Node 40 90 300 100 "Poste A`n(unique pr${chEAcute}d${chEAcute}cesseur)" 'input'),
    (New-Node 420 90 260 100 'Poste B' 'process'),
    (New-Node 40 380 260 100 'Poste C1' 'input'),
    (New-Node 40 620 260 100 'Poste C2' 'input'),
    (New-Node 420 500 320 140 "Poste D`n(jonction, attend tous`nles pr${chEAcute}d${chEAcute}cesseurs)" 'decision'),
    (New-Node 850 280 300 110 "Poste E`n(aiguillage alternatif)" 'process'),
    (New-Node 1250 280 260 110 'Suite de la gamme' 'output')
)
$microActEdges = @(
    (New-Edge 0 1), (New-Edge 2 4), (New-Edge 3 4), (New-Edge 4 5), (New-Edge 1 5), (New-Edge 5 6)
)
Write-Diagram "Extrait p${chEAcute}dagogique du graphe des micro-activit${chEAcute}s" $microActNodes $microActEdges 'graphe_micro_activites.png' 1650 850

$agentHierarchyNodes = @(
    (New-Node 700 60 380 110 "Strat${chEAcute}gique (AS-sP1)" 'actor'),
    (New-Node 660 240 460 110 "Tactique (AT-sP2 ${chAGrave} AT-sP5)" 'actor'),
    (New-Node 660 420 460 110 'Coordination (CA-*)' 'actor'),
    (New-Node 660 600 460 110 "Pilotage op${chEAcute}rationnel (AOp-*)" 'process'),
    (New-Node 660 780 460 110 "Ex${chEAcute}cution (AOe-* et postes)" 'process'),
    (New-Node 60 420 480 150 "Blackboard`nm${chEAcute}moire partag${chEAcute}e" 'decision')
)
$agentHierarchyEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4),
    (New-Edge 5 2 'partage' 'dashed'), (New-Edge 5 3 'partage' 'dashed'), (New-Edge 5 4 'partage' 'dashed')
)
Write-Diagram "Cinq niveaux de d${chEAcute}cision et Blackboard partag${chEAcute}" $agentHierarchyNodes $agentHierarchyEdges 'hierarchie_agents.png' 1650 970

$aerParticipants = @(
    'Fournisseur GPL',
    "Pilotage Source`n(AOp)",
    "Coordination Source`n(CA-sS1)",
    "Tactique Source`n(AT-sP2)",
    "Tactique Make`n(AT-sP3)",
    "Tactique Deliver`n(AT-sP4)",
    "Coordination Deliver`n(CA-sD1)"
)
$aerMessages = @(
    (New-SequenceMessage 0 1 'SupplierDelayAlert'),
    (New-SequenceMessage 1 2 'OperationalException'),
    (New-SequenceMessage 2 3 'ProcessDeviationReport'),
    (New-SequenceMessage 3 4 'RevisedMaterialAvailability'),
    (New-SequenceMessage 4 5 'RevisedProductionCompletionDate'),
    (New-SequenceMessage 5 6 'RevisedDeliveryPlan')
)
Write-SequenceDiagram "Propagation AER d'un retard fournisseur" $aerParticipants $aerMessages 'sequence_aer.png' 2000 900

$blackboardNodes = @(
    (New-Node 40 350 220 110 "${chEAcuteUpper}v${chEAcute}nement" 'input'),
    (New-Node 320 350 220 110 'Observation' 'process'),
    (New-Node 600 350 240 110 'Partage (Blackboard)' 'actor'),
    (New-Node 900 350 260 110 "D${chEAcute}cision ${chEAcute}ventuelle" 'decision'),
    (New-Node 1220 350 220 110 'Instruction' 'process'),
    (New-Node 1500 350 220 110 "Ex${chEAcute}cution" 'process'),
    (New-Node 1780 350 220 110 'Compte rendu' 'output')
)
$blackboardEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4), (New-Edge 4 5), (New-Edge 5 6)
)
Write-Diagram "D'un ${chEAcute}v${chEAcute}nement au compte rendu, via le Blackboard" $blackboardNodes $blackboardEdges 'blackboard_tracabilite.png' 2050 800

$ledgerNodes = @(
    (New-Node 40 300 250 120 "T=156 s`nCMD_1 cr${chEAcute}${chEAcute}e" 'input'),
    (New-Node 340 300 250 120 "T=159 s`nAttente et REAPPRO_1" 'actor'),
    (New-Node 640 300 250 120 "T=233 s`nGPL disponible" 'process'),
    (New-Node 940 300 250 120 "T=235 s`nMake d${chEAcute}marre" 'process'),
    (New-Node 1240 300 250 120 "T=2314 s`nReconstitution close" 'process'),
    (New-Node 1540 300 250 120 "T=2320 s`nDeliver d${chEAcute}marre" 'process'),
    (New-Node 1840 300 250 120 "T=2343 s`nCl${chOCirc}ture de CMD_1" 'output')
)
$ledgerEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4), (New-Edge 4 5), (New-Edge 5 6)
)
Write-Diagram "Ligne temporelle du run de validation" $ledgerNodes $ledgerEdges 'ledger_vsm.png' 2130 700

$vaNvaNodes = @(
    (New-Node 40 100 320 110 "ZENER Process Time`n59,39 s" 'input'),
    (New-Node 40 340 320 110 "ZENER Waiting Time`n12,70 s" 'input'),
    (New-Node 460 220 320 140 "Somme`n72,08 s" 'decision'),
    (New-Node 460 500 380 130 "Valeur ajout${chEAcute}e estim${chEAcute}e`n~51,09 s (taux configur${chEAcute}s)" 'process'),
    (New-Node 950 340 380 140 "PCE estim${chEAcute} = VA / Somme`n= 70,9 %" 'output')
)
$vaNvaEdges = @(
    (New-Edge 0 2), (New-Edge 1 2), (New-Edge 2 4), (New-Edge 3 4)
)
Write-Diagram "Construction p${chEAcute}dagogique du PCE estim${chEAcute}" $vaNvaNodes $vaNvaEdges 'calcul_va_nva.png' 1450 800

$wipNodes = @(
    (New-Node 40 60 340 120 "WIP physique`n(hors jetons visuels)" 'input'),
    (New-Node 40 320 340 120 "D${chEAcute}bit observ${chEAcute}`n1,536 unit${chEAcute}/h" 'process'),
    (New-Node 40 580 340 120 "Takt time`nrythme de la demande" 'process'),
    (New-Node 520 320 420 140 "Lecture combin${chEAcute}e du flux`nsans formule unique impos${chEAcute}e" 'decision')
)
$wipEdges = @((New-Edge 0 3), (New-Edge 1 3), (New-Edge 2 3))
Write-Diagram "WIP, d${chEAcute}bit et takt time" $wipNodes $wipEdges 'wip_debit_takt.png' 1100 800

$pipelineNodes = @(
    (New-Node 30 320 260 120 "Valeur physique`nmesur${chEAcute}e" 'input'),
    (New-Node 340 320 260 120 "Normalisation`nBottom / Perfect" 'process'),
    (New-Node 650 320 220 120 'Score sur 10' 'process'),
    (New-Node 920 320 220 120 'Classe floue' 'decision'),
    (New-Node 1190 320 260 120 "Attribut`nRL, RS, AG, CO, AM" 'process'),
    (New-Node 1500 320 220 120 "Pond${chEAcute}ration" 'process'),
    (New-Node 1770 320 200 120 'PI' 'output')
)
$pipelineEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4), (New-Edge 4 5), (New-Edge 5 6)
)
Write-Diagram "Pipeline de la valeur physique au Performance Index" $pipelineNodes $pipelineEdges 'pipeline_scor_pi.png' 2020 760

$scaleNodes = @(
    (New-Node 40 300 340 130 "Bottom (pire cas)`nvaleur = 1,0" 'input'),
    (New-Node 560 300 380 130 "Valeur observ${chEAcute}e CO.1.1`n= 1,0" 'decision'),
    (New-Node 1460 300 380 130 "Perfect (meilleur cas)`nvaleur = 0,0" 'output')
)
$scaleEdges = @(
    (New-Edge 0 1 'valeur du run'),
    (New-Edge 1 2 "score croissant de 0 ${chAGrave} 10")
)
Write-Diagram "Principe de l'${chEAcute}chelle Bottom / Perfect" $scaleNodes $scaleEdges 'echelle_bottom_perfect.png' 1950 700

$ahpUsageNodes = @(
    (New-Node 40 90 340 110 "Situation locale`n(ex. goulot sM1.3.1)" 'input'),
    (New-Node 460 90 380 110 "AHP local`nmatrice de comparaison par paires" 'process'),
    (New-Node 920 90 320 110 "D${chEAcute}cision locale`n(ex. REBALANCE)" 'output'),
    (New-Node 40 450 340 110 "Observations VSM`net m${chEAcute}triques" 'input'),
    (New-Node 460 450 380 110 "Normalisation, logique floue,`nattributs" 'process'),
    (New-Node 920 450 320 110 "PI global pond${chEAcute}r${chEAcute}" 'output')
)
$ahpUsageEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 3 4), (New-Edge 4 5)
)
Write-Diagram "Deux usages distincts de l'AHP" $ahpUsageNodes $ahpUsageEdges 'deux_usages_ahp.png' 1350 700

$isa95TreeNodes = @(
    (New-Node 40 320 260 110 'EnterpriseUnit' 'actor'),
    (New-Node 350 320 220 110 'Site' 'input'),
    (New-Node 620 320 220 110 'Area' 'input'),
    (New-Node 890 320 220 110 'Workshop' 'process'),
    (New-Node 1160 320 220 110 'WorkCenter' 'process'),
    (New-Node 1430 320 220 110 'WorkCell' 'output')
)
$isa95TreeEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 2 3), (New-Edge 3 4), (New-Edge 4 5)
)
Write-Diagram "Niveaux de la hi${chEAcute}rarchie ISA-95 du mod${chEGrave}le" $isa95TreeNodes $isa95TreeEdges 'hierarchie_isa95.png' 1700 700

$isa95AssignNodes = @(
    (New-Node 40 260 320 120 "Micro-activit${chEAcute}`n(poste)" 'input'),
    (New-Node 440 260 280 120 'executedAt' 'decision'),
    (New-Node 800 260 340 120 "${chEAcuteUpper}l${chEAcute}ment ISA-95`n(WorkCenter ou WorkCell)" 'output'),
    (New-Node 440 60 400 110 "71 affectations dans`nl'ex${chEAcute}cution valid${chEAcute}e" 'actor')
)
$isa95AssignEdges = @(
    (New-Edge 0 1), (New-Edge 1 2), (New-Edge 3 1 'annotation' 'dashed')
)
Write-Diagram "Principe de la relation executedAt" $isa95AssignNodes $isa95AssignEdges 'affectations_isa95.png' 1250 500

$tboxAboxNodes = @(
    (New-Node 40 260 380 130 "TBox`nvocabulaire (core:, agent:, aer:)" 'input'),
    (New-Node 520 260 380 130 "ABox`nindividus d'une ex${chEAcute}cution (run:)" 'process'),
    (New-Node 1000 100 340 120 "SimulationRun`n(runId, cl${chOCirc}ture)" 'actor'),
    (New-Node 1000 420 340 120 "Export Turtle (.ttl)" 'output')
)
$tboxAboxEdges = @(
    (New-Edge 0 1 'instancie'), (New-Edge 1 2 "rattach${chEAcute} ${chAGrave}"), (New-Edge 1 3 "export${chEAcute} vers")
)
Write-Diagram "TBox, ABox et export d'un run" $tboxAboxNodes $tboxAboxEdges 'tbox_abox_run.png' 1450 620
