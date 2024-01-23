# Function to print colored text
function Print-Colored {
    param (
        [string]$text,
        [System.ConsoleColor]$color = [System.ConsoleColor]::White,
        [System.ConsoleColor]$backgroundColor = [System.ConsoleColor]::Black
    )
    Write-Host $text -ForegroundColor $color -BackgroundColor $backgroundColor
}

# Function for animated loading
function Animate-Loading {
    for ($i = 1; $i -le 3; $i++) {
        Print-Colored "Cracking..." -ForegroundColor Yellow -BackgroundColor Black
        Start-Sleep -Seconds 0.5
        Write-Host -NoNewline "`b`b`b   "
        Start-Sleep -Seconds 0.5
    }
}

# Function to show the main user interface
function Show-UI {
    Clear-Host
    Print-Colored @"
    ____   ____               _________                       __
    \   \ /   /____           \_   ___ \____________    ____ |  | __ ___________
     \   Y   /     \   ______ /    \  \/\_  __ \__  \ _/ ___\|  |/ // __ \_  __ \
      \     /  Y Y  \ /_____/ \     \____|  | \// __ \\  \___|    <\  ___/|  | \/
       \___/|__|_|  /          \______  /|__|  (____  /\___  >__|_ \\___  >__|
                  \/                  \/            \/     \/     \/    \/
"@ -ForegroundColor Cyan

    Print-Colored "1. Crack" -ForegroundColor Green
    Print-Colored "2. Download" -ForegroundColor Green
    Print-Colored "3. Detect Version" -ForegroundColor Green
    Print-Colored "4. Exit" -ForegroundColor Red

    $option = Read-Host "Select an option"

    switch ($option) {
        "1" { Crack-Menu }
        "2" { Download }
        "3" { Detect-Version }
        "4" {
            Print-Colored "Exiting..." -ForegroundColor Red
            Start-Sleep -Seconds 1
            Exit
        }
        default {
            Print-Colored "Invalid Option!" -ForegroundColor Red
            Start-Sleep -Seconds 1
            Show-UI
        }
    }
}

# Function for the crack menu
function Crack-Menu {
    Clear-Host
    Print-Colored "VMware Cracking Script" -ForegroundColor Cyan
    Print-Colored "1. VMware Workstation Pro" -ForegroundColor Green
    Print-Colored "2. VMware Workstation Player" -ForegroundColor Green
    Print-Colored "3. VMware Fusion Pro" -ForegroundColor Green
    Print-Colored "4. VMware Fusion Player" -ForegroundColor Green
    Print-Colored "5. VMware ESXi" -ForegroundColor Green

    $option = Read-Host "Select an option"

    switch ($option) {
        "1" { Crack "pro" }
        "2" { Crack "player" }
        "3" { Detect-Version }
        "4" { Exit }
        "5" { ESXi-Menu }
        default {
            Print-Colored "Invalid Option!" -ForegroundColor Red
            Start-Sleep -Seconds 1
            Show-UI
        }
    }
}

# Function for the ESXi menu
function ESXi-Menu {
    Clear-Host
    Print-Colored "ESXi Versions" -ForegroundColor Cyan
    Print-Colored "1. vSphere 6 Enterprise Plus" -ForegroundColor Green
    Print-Colored "2. vSphere with Operations Management 6 Enterprise" -ForegroundColor Green
    Print-Colored "3. vSphere ESXi 7.0 Enterprise Plus" -ForegroundColor Green
    Print-Colored "4. vSAN 7 Enterprise Plus" -ForegroundColor Green
    Print-Colored "5. vSphere 7 Enterprise Plus with Add-on for Kubernetes" -ForegroundColor Green
    Print-Colored "6. vCenter Server 7 Standard" -ForegroundColor Green
    Print-Colored "7. vSphere ESXi 8.0 Enterprise" -ForegroundColor Green
    Print-Colored "8. vSphere ESXi 8.0 Enterprise Plus" -ForegroundColor Green
    Print-Colored "9. vSphere 8.0 Standard" -ForegroundColor Green
    Print-Colored "10. Back to Main Menu" -ForegroundColor Red

    $option = Read-Host "Select an option"

    switch ($option) {
        "1" { Crack-ESXi "vSphere 6 Enterprise Plus" }
        "2" { Crack-ESXi "vSphere with Operations Management 6 Enterprise" }
        "3" { Crack-ESXi "vSphere ESXi 7.0 Enterprise Plus" }
        "4" { Crack-ESXi "vSAN 7 Enterprise Plus" }
        "5" { Crack-ESXi "vSphere 7 Enterprise Plus with Add-on for Kubernetes" }
        "6" { Crack-ESXi "vCenter Server 7 Standard" }
        "7" { Crack-ESXi "vSphere ESXi 8.0 Enterprise" }
        "8" { Crack-ESXi "vSphere ESXi 8.0 Enterprise Plus" }
        "9" { Crack-ESXi "vSphere 8.0 Standard" }
        "10" { Show-UI }
        default {
            Print-Colored "Invalid Option!" -ForegroundColor Red
            Start-Sleep -Seconds 1
            ESXi-Menu
        }
    }
}

# Function for animated cracking countdown
function Animate-Cracking-Countdown {
    for ($i = 20; $i -ge 0; $i--) {
        Print-Colored "Cracking in $i seconds..." -ForegroundColor Yellow -BackgroundColor Black
        Start-Sleep -Seconds 1
        Clear-Host
    }
}

# Function for animated Metasploit-like startup
function Animate-Startup {
    $frames = @(
        " [*] Loading modules...",
        " [+] Starting VMware exploit...",
        " [!] Exploit successful! Cracking keys...",
        " [+] Keys found! Activating VMware..."
    )

    foreach ($frame in $frames) {
        Print-Colored "$frame" -ForegroundColor Green
        Start-Sleep -Milliseconds 500
        Clear-Host
    }
}

# Function for the crack operation
function Crack {
    param (
        [string]$version
    )

    Animate-Startup
    Animate-Cracking-Countdown

    # Keys in the script labeled as valid
    $keys = @(
        "MC60H-DWHD5-H80U9-6V85M-8280D",
        "4A4RR-813DK-M81A9-4U35H-06KND",
        "NZ4RR-FTK5H-H81C1-Q30QH-1V2LA",
        "JU090-6039P-08409-8J0QH-2YR7F",
        "4Y09U-AJK97-089Z0-A3054-83KLA",
        "4C21U-2KK9Q-M8130-4V2QH-CF81",
        "HY45K-8KK96-MJ8E0-0UCQ4-0UH72",
        "JC0D8-F93E4-HJ9Q9-088N6-96A7F",
        "NG0RK-2DK9L-HJDF8-1LAXP-1ARQ0",
        "0U2J0-2E19P-HJEX1-132Q2-8AKK6"
    )

    # Check if a valid key is present in the script
    $validKeyFound = $keys | ForEach-Object { Validate-Key $_ }

    if ($validKeyFound) {
        Use-Keys $keys
        Print-Colored "Exiting..." -ForegroundColor Red
        Exit
    }

    Print-Colored "Cracking... Please wait." -ForegroundColor Yellow
    Animate-Loading

    # Shuffle the keys to select a random one
    $shuffledKeys = $keys | Get-Random -Count $keys.Count

    foreach ($key in $shuffledKeys) {
        if (Validate-Key $key) {
            Print-Colored "Cracked Successfully!" -ForegroundColor Green
            Open-Vmware-With-Key-Gui $key
            break
        }
    }

    if (-not $validKeyFound) {
        Print-Colored "No valid key found." -ForegroundColor Red
    }
}


# Function to crack ESXi
function Crack-ESXi {
    param (
        [string]$version
    )

    # Use the respective keys based on the selected version
    $keys = @{
        "vSphere 6 Enterprise Plus" = @(
            "1C20K-4Z214-H84U1-T92EP-92838",
            "1A2JU-DEH12-48460-CT956-AC84D",
            "MC28R-4L006-484D1-VV8NK-C7R58",
            "5C6TK-4C39J-48E00-PH0XH-828Q4",
            "4A4X0-69HE3-M8548-6L1QK-1Y240"
        )
        "vSphere with Operations Management 6 Enterprise" = @(
            "4Y2NU-4Z301-085C8-M18EP-2K8M8",
            "1Y48R-0EJEK-084R0-GK9XM-23R52",
            "5Z6HK-61L00-M84A0-VR2GP-26UK4",
            "MF4M2-4RL8P-085L8-QVANK-8P832",
            "JY2WK-6G10L-H81Z0-QUCZP-1Y842",
            "5Z6HK-61L00-M84A0-VR2GP-26UK4"
        )
        "vSphere ESXi 7.0 Enterprise Plus" = @(
            "JJ2WR-25L9P-H71A8-6J20P-C0K3F",
            "HN2X0-0DH5M-M78Q1-780HH-CN214",
            "JH09A-2YL84-M7EC8-FL0K2-3N2J2"
        )
        "vSAN 7 Enterprise Plus" = @(
            "JG0RU-8AJEN-M8069-X23X0-330P8"
        )
        "vSphere 7 Enterprise Plus with Add-on for Kubernetes" = @(
            "0G0X0-DL29M-489T1-0C3GK-1Z2J6",
            "J1608-4GJEQ-071L8-9VA0H-2MUK6",
            "M10DH-8YL47-474L1-DV3U0-8H054",
            "MM4MR-2G005-H7039-JVCAP-2RAL8"
        )
        "vCenter Server 7 Standard" = @(
            "MA6NU-6RL07-484V8-WA1XP-87ALF"
        )
        "vSphere ESXi 8.0 Enterprise" = @(
            "4F40H-4ML1K-M89U0-0C2N4-1AKL4"
        )
        "vSphere ESXi 8.0 Enterprise Plus" = @(
            "4V492-44210-48830-931GK-2PRJ4",
            "HG00K-03H8K-48929-8K1NP-3LUJ4"
        )
        "vSphere 8.0 Standard" = @(
            "4F282-0MLD2-M8869-T89G0-CF240",
            "0F41K-0MJ4H-M88U1-0C3N0-0A214"
        )
    }

    if ($keys.ContainsKey($version)) {
        $selectedKeys = $keys[$version]
        Print-Colored "Using keys for $($version):" -ForegroundColor Yellow
        $selectedKeys | ForEach-Object { Print-Colored $_ -ForegroundColor Yellow }
        Start-Sleep -Seconds 1
    } else {
        Print-Colored "Invalid ESXi version selected!" -ForegroundColor Red
        Start-Sleep -Seconds 1
        ESXi-Menu
    }
}

# Function to validate a key
function Validate-Key {
    param (
        [string]$key
    )
    # Perform validation here if needed
    return $true  # Placeholder, replace with actual validation
}

# Function to use keys
function Use-Keys {
    param (
        [string[]]$keys
    )
    # Prompt the user to input a key
    Print-Colored "Using key: $($keys[0])" -ForegroundColor Magenta
    Read-Host "Please open VMware, go to Help > Enter License Key, and input the key. Press Enter when done."
}

# Function to open VMware with a key in GUI
function Open-Vmware-With-Key-Gui {
    param (
        [string]$key
    )
    $objForm = New-Object System.Windows.Forms.Form
    $objForm.Text = "VMware Key Activation"
    $objForm.Size = New-Object System.Drawing.Size(300,200)
    $objForm.StartPosition = "CenterScreen"
    
    $objLabel = New-Object System.Windows.Forms.Label
    $objLabel.Location = New-Object System.Drawing.Size(20,20)
    $objLabel.Size = New-Object System.Drawing.Size(260,20)
    $objLabel.Text = "Please input the following key in VMware:`n`n$key"
    
    $objForm.Controls.Add($objLabel)
    
    $objForm.ShowDialog()
}

# Function for downloading
function Download {
    try {
        $url = if ($IsWindows) {
            "https://www.vmware.com/go/getworkstation-win"
        } else {
            "https://www.vmware.com/go/getworkstation-linux"
        }

        $response = Invoke-RestMethod -Uri $url -Method Head
        $downloadUrl = $response.Headers.Location

        if ($IsWindows) {
            Start-Process $downloadUrl
        } else {
            Start-Process xdg-open -ArgumentList $downloadUrl
        }
    } catch {
        Print-Colored "Error!" -ForegroundColor Red
        Start-Sleep -Seconds 1
        Download
    }
}

# Function to detect the version
function Detect-Version {
    try {
        $registryKeyPath = "HKLM:\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation"
        $keyExists = Test-Path $registryKeyPath

        if (-not $keyExists) {
            Print-Colored "VMware Workstation is not installed." -ForegroundColor Yellow
            return
        }

        $version = Get-WmiObject Win32_Product | Where-Object { $_.Caption -like "*VMware Workstation*" } | Select-Object -ExpandProperty Version
        if ($version) {
            Print-Colored "Detected Version: VMware Workstation $version" -ForegroundColor Green
        } else {
            Print-Colored "Unable to determine the VMware Workstation version." -ForegroundColor Red
        }
    } catch {
        $errorMessage = $_.Exception.Message
        Print-Colored "Error during version detection: $errorMessage" -ForegroundColor Red
    }
}

# Main function
function Main {
    Show-UI
}

# Run the main function
Main
