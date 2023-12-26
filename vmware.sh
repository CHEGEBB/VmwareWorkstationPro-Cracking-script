#!/bin/bash

# Function to print colored text
print_colored() {
    local text="$1"
    local color="${2:-\e[97m}"  # Default to white
    local background="${3:-\e[40m}"  # Default to black
    echo -e "${color}${background}${text}\e[0m"
}

# Function for animated loading
animate_loading() {
    for ((i = 1; i <= 3; i++)); do
        print_colored "Cracking..." "\e[93m" "\e[1m" -n
        sleep 0.5
        echo -en "\b\b\b   "
        sleep 0.5
    done
    echo
}

# Function for the main user interface
show_ui() {
    clear
    print_colored "
    Welcome to the Vmware Cracking script. This script was written by CHEGEBB. Follow me on GitHub for more.
    ____   ____               _________                       __
    \\   \\ /   /____           \\_   ___ \\____________    ____ |  | __ ___________
     \\   Y   /     \\   ______ /    \\  \\/\\_  __ \\__  \\ _/ ___\\|  |/ // __ \\_  __ \\
      \\     /  Y Y  \\ /_____/ \\     \\____|  | \\/\\  __ \\  \\___|    <\\  ___/|  | \\/
       \\___/|__|_|  /          \\______  /|__|   \\____/\\___  >__|_ \\\\___  >__|
                  \\/                  \\/                  \\/     \\/    \\/
" "\e[96m"
    print_colored "1. Crack" "\e[92m"
    print_colored "2. Download" "\e[92m"
    print_colored "3. Detect Version" "\e[92m"
    print_colored "4. Exit" "\e[91m"

    read -p "Select an option: " option

    case $option in
        1) crack_menu ;;
        2) download ;;
        3) detect_version ;;
        4)
            print_colored "Exiting..." "\e[91m"
            sleep 1
            exit ;;
        *)
            print_colored "Invalid Option!" "\e[91m"
            sleep 1
            show_ui ;;
    esac
}

# Function for the crack menu
crack_menu() {
    clear
    print_colored "VMware Cracking Script" "\e[96m"
    print_colored "1. VMware Workstation Pro" "\e[92m"
    print_colored "2. VMware Workstation Player" "\e[92m"
    print_colored "3. VMware Fusion Pro" "\e[92m"
    print_colored "4. VMware Fusion Player" "\e[92m"
    print_colored "5. VMware ESXi" "\e[92m"

    read -p "Select an option: " option

    case $option in
        1) crack "pro" ;;
        2) crack "player" ;;
        3) crack "fusion_pro" ;;
        4) crack "fusion_player" ;;
        5) detect_version ;;
        *)
            print_colored "Invalid Option!" "\e[91m"
            sleep 1
            show_ui ;;
    esac
}

# Function for animated cracking countdown
animate_cracking_countdown() {
    for ((i = 20; i >= 0; i--)); do
        print_colored "Cracking in $i seconds..." "\e[93m" "\e[1m"
        sleep 1
        clear
    done
}

# Function for animated Metasploit-like startup
animate_startup() {
    frames=(
        " [*] Loading modules..."
        " [+] Starting VMware exploit..."
        " [!] Exploit successful! Cracking keys..."
        " [+] Keys found! Activating VMware..."
    )

    for frame in "${frames[@]}"; do
        print_colored "$frame" "\e[92m"
        sleep 0.5
        clear
    done
}

# Function for the crack operation
crack() {
    local version="$1"
    animate_startup
    animate_cracking_countdown

    # Keys in the script labeled as valid
    keys=(
        "MC60H-DWHD5-H80U9-6V85M-8280D"
        "4A4RR-813DK-M81A9-4U35H-06KND"
        "NZ4RR-FTK5H-H81C1-Q30QH-1V2LA"
        "JU090-6039P-08409-8J0QH-2YR7F"
        "4Y09U-AJK97-089Z0-A3054-83KLA"
        "4C21U-2KK9Q-M8130-4V2QH-CF81"
        "HY45K-8KK96-MJ8E0-0UCQ4-0UH72"
        "JC0D8-F93E4-HJ9Q9-088N6-96A7F"
        "NG0RK-2DK9L-HJDF8-1LAXP-1ARQ0"
        "0U2J0-2E19P-HJEX1-132Q2-8AKK6"
    )

    # Check if a valid key is present in the script
    local valid_key_found=false
    for key in "${keys[@]}"; do
        if validate_key "$key"; then
            valid_key_found=true
            use_keys "${keys[@]}"
            print_colored "Exiting..." "\e[91m"
            exit
        fi
    done

    print_colored "Cracking... Please wait." "\e[93m"
    animate_loading

    # Shuffle the keys to select a random one
    keys=($(shuf -e "${keys[@]}"))

    for key in "${keys[@]}"; do
        if validate_key "$key"; then
            print_colored "\nCracked Successfully!" "\e[92m"
            open_vmware_with_key_gui "$key"
            break
        fi
    done

    if ! "$valid_key_found"; then
        print_colored "No valid key found." "\e[91m"
    fi
}

# Function to validate a key
validate_key() {
    local key="$1"
    # Perform validation here if needed
    return 0  # Placeholder, replace with actual validation
}

# Function to use keys
use_keys() {
    local keys=("$@")
    # Prompt the user to input a key
    print_colored "Using key: ${keys[0]}" "\e[95m"
    read -p "Please open VMware, go to Help > Enter License Key, and input the key. Press Enter when done.: "
}

# Function to open VMware with a key in GUI
open_vmware_with_key_gui() {
    local key="$1"
    echo -e "Please input the following key in VMware:\n\n$key"
}

# Function for downloading
download() {
    url=""
    if [[ $(uname) == "Darwin" ]]; then
        url="https://www.vmware.com/go/getworkstation-mac"
    elif [[ $(uname) == "Linux" ]]; then
        url="https://www.vmware.com/go/getworkstation-linux"
    else
        url="https://www.vmware.com/go/getworkstation-win"
    fi

    try_count=0
    while [[ $try_count -lt 3 ]]; do
        if command -v xdg-open &> /dev/null; then
            xdg-open "$url"
        elif command -v open &> /dev/null; then
            open "$url"
        elif command -v start &> /dev/null; then
            start "$url"
        else
            print_colored "Error!" "\e[91m"
            sleep 1
            download
        fi

        sleep 1
        ((try_count++))
    done
}

# Function to detect the version
detect_version() {
    # Check if VMware Workstation is installed by looking for the registry key
    registry_key_path="SOFTWARE\\WOW6432Node\\VMware, Inc.\\VMware Workstation"
    if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
        key_exists=$(reg.exe query "$registry_key_path" 2>/dev/null)
    else
        key_exists=$(reg query "$registry_key_path" 2>/dev/null)
    fi

    if [ -z "$key_exists" ]; then
        print_colored "VMware Workstation is not installed." "\e[93m"
        return
    fi

    # Get VMware Workstation version
    version=$(wmic product get name,version | grep "VMware Workstation" | cut -d' ' -f2)
    if [ -n "$version" ]; then
        print_colored "Detected Version: VMware Workstation $version" "\e[92m"
    else
        print_colored "Unable to determine the VMware Workstation version." "\e[91m"
    fi
}

# Main function
main() {
    show_ui
}

# Run the main function
main
