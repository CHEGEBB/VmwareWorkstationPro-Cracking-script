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

# Function for animated rotating loading
function Animate-Rotating-Loading {
    $spinner = @("/", "-", "\", "|")
    for ($i = 0; $i -le 5; $i++) {
        foreach ($spin in $spinner) {
            Write-Host -NoNewline "$spin`r"
            Start-Sleep -Milliseconds 200
        }
    }
    Clear-Host
}

# Function to show the main user interface
function Show-UI {
    Clear-Host
    Print-Colored @"
    Welcome to the VMware Cracking Script! This script was created by CHEGEBB. Follow me on GitHub:
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
    Print-Colored "Written by: CHEGEBB" -ForegroundColor Cyan

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
        "3" { Crack-FusionPro }
        "4" { Exit }
        default {
            Print-Colored "Invalid Option!" -ForegroundColor Red
            Start-Sleep -Seconds 1
            Show-UI
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

# Function for the Fusion Pro crack operation
function Crack-FusionPro {
    # Display the Fusion Pro key
    Print-Colored "Fusion Pro Key: YF390-0HF8P-M81RQ-2DXQE-M2UT6" -ForegroundColor Cyan

    Animate-Cracking-Countdown
    Print-Colored "Cracked Successfully!" -ForegroundColor Green
    Open-Vmware-With-Key-Gui "YF390-0HF8P-M81RQ-2DXQE-M2UT6"
}

# Function for the crack operation
function Crack {
    param (
        [string]$version
    )

    Animate-Startup

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

    # If Fusion Pro is selected, call the specific function
    if ($version -eq "fusionpro") {
        Crack-FusionPro
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

    # Display the key
    Print-Colored "VMware Key: $key" -ForegroundColor Cyan

}

# Function to detect the version with animated progress
function Detect-Version {
    try {
        $spinner = @("-", "\\", "|", "/")
        $versionDetectionMessage = "Detecting Version: VMware Workstation"
        $timeoutInSeconds = 30
        $startTime = Get-Date
        $versionDetermined = $false
        $progressWidth = 20

        # Start the detection in the background
        $detectionJob = Start-Job -ScriptBlock {
            param($versionDetectionMessage, $spinner, $progressWidth)
            $progress = "[" + ('=' * $progressWidth) + "]"
            while ($true) {
                foreach ($spin in $spinner) {
                    Clear-Host
                    Print-Colored "$versionDetectionMessage $progress $spin`r" -ForegroundColor Yellow
                    Start-Sleep -Milliseconds 100
                }
            }
        } -ArgumentList $versionDetectionMessage, $spinner, $progressWidth

        while ((Get-Date).Subtract($startTime).TotalSeconds -lt $timeoutInSeconds -and -not $versionDetermined) {
            $registryKeyPath = "HKLM:\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation"
            $keyExists = Test-Path $registryKeyPath

            if ($keyExists) {
                $version = Get-WmiObject Win32_Product | Where-Object { $_.Caption -like "*VMware Workstation*" } | Select-Object -ExpandProperty Version

                if ($version) {
                    $versionDetermined = $true
                    Clear-Host
                    Print-Colored "Detected Version: VMware Workstation $version" -ForegroundColor Green
                    Stop-Job $detectionJob  # Stop the detection animation
                    Remove-Job $detectionJob  # Remove the detection job
                    Start-Sleep -Seconds 2  # Display the version for 2 seconds
                    Crack-Menu  # Reload the crack menu
                    return
                }
            }
        }

        Clear-Host
        Stop-Job $detectionJob  # Stop the detection animation
        Remove-Job $detectionJob  # Remove the detection job
        if (-not $versionDetermined) {
            Print-Colored "Timed out. Unable to detect the VMware Workstation version." -ForegroundColor Red
            Start-Sleep -Seconds 2  # Display the error message for 2 seconds
            Crack-Menu  # Reload the crack menu
        }
    } catch {
        $errorMessage = $_.Exception.Message
        Print-Colored "Error during version detection: $errorMessage" -ForegroundColor Red
        Start-Sleep -Seconds 2  # Display the error message for 2 seconds
        Crack-Menu  # Reload the crack menu
    }
}


# Function to detect the version with rotating animation and timeout
function Detect-Version {
    try {
        $spinner = @("/", "-", "\", "|")
        $versionDetectionMessage = "Detecting Version: VMware Workstation"
        $timeoutInSeconds = 30
        $startTime = Get-Date
        $versionDetermined = $false
        $progressWidth = 20

        while ((Get-Date).Subtract($startTime).TotalSeconds -lt $timeoutInSeconds -and -not $versionDetermined) {
            foreach ($spin in $spinner) {
                Clear-Host
                $progress = "[" + ('=' * $progressWidth) + "]"
                Print-Colored "$versionDetectionMessage $progress $spin`r" -ForegroundColor Yellow
                Start-Sleep -Milliseconds 200
            }

            $registryKeyPath = "HKLM:\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation"
            $keyExists = Test-Path $registryKeyPath

            if ($keyExists) {
                $version = Get-WmiObject Win32_Product | Where-Object { $_.Caption -like "*VMware Workstation*" } | Select-Object -ExpandProperty Version

                if ($version) {
                    $versionDetermined = $true
                    Clear-Host
                    Print-Colored "Detected Version: VMware Workstation $version" -ForegroundColor Green
                    Start-Sleep -Seconds 2  # Display the version for 2 seconds
                    Crack-Menu  # Reload the crack menu
                    return
                }
            }
        }

        Clear-Host
        if (-not $versionDetermined) {
            Print-Colored "Timed out. Unable to detect the VMware Workstation version." -ForegroundColor Red
            Start-Sleep -Seconds 2  # Display the error message for 2 seconds
            Crack-Menu  # Reload the crack menu
        }
    } catch {
        $errorMessage = $_.Exception.Message
        Print-Colored "Error during version detection: $errorMessage" -ForegroundColor Red
        Start-Sleep -Seconds 2  # Display the error message for 2 seconds
        Crack-Menu  # Reload the crack menu
    }
}



# Main function
function Main {
    Show-UI
}

# Run the main function
Main
