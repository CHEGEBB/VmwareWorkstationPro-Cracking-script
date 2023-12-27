#!/bin/bash

print_colored() {
    local text="$1"
    local color="${2:-\e[97m}"  
    local background="${3:-\e[40m}"  
    echo -e "${color}${background}${text}\e[0m"
}

animate_ui() {
    for ((i = 1; i <= 3; i++)); do
        clear
        print_colored "Loading..." "\e[93m" "\e[1m"
        sleep 0.5
        clear
        print_colored "Welcome!" "\e[96m"
        sleep 0.5
    done
}

animate_crack_operation() {
    print_colored "Performing additional operations..." "\e[93m" "\e[1m"
    sleep 2
    clear
}

animate_success_message() {
    for ((i = 1; i <= 3; i++)); do
        clear
        print_colored "Success!" "\e[92m" "\e[1m"
        sleep 0.5
        clear
        sleep 0.5
    done
}

animate_loading() {
    for ((i = 1; i <= 3; i++)); do
        print_colored "Cracking..." "\e[93m" "\e[1m" -n
        sleep 0.5
        echo -en "\b\b\b   "
        sleep 0.5
    done
    echo
}

animate_cracking_countdown() {
    for ((i = 20; i >= 0; i--)); do
        print_colored "Cracking in $i seconds..." "\e[93m" "\e[1m"
        sleep 1
        clear
    done
}

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

crack() {
    local version="$1"
    animate_startup
    animate_cracking_countdown
    animate_crack_operation

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

    local valid_key_found=false
    for key in "${keys[@]}"; do
        if validate_key "$key"; then
            valid_key_found=true
            use_keys "${keys[@]}"
            animate_success_message
            exit
        fi
    done

    print_colored "Cracking... Please wait." "\e[93m"
    animate_loading

    keys=($(shuf -e "${keys[@]}"))

    for key in "${keys[@]}"; do
        if validate_key "$key"; then
            print_colored "\nCracked Successfully!" "\e[92m"
            open_vmware_with_key_gui "$key"
            animate_success_message
            break
        fi
    done

    if ! "$valid_key_found"; then
        print_colored "No valid key found." "\e[91m"
    fi
}

validate_key() {
    local key="$1"
    # Perform validation here if needed
    return 0  # Placeholder, replace with actual validation
}

use_keys() {
    local keys=("$@")
    print_colored "Using key: ${keys[0]}" "\e[95m"
    read -p "Please open VMware, go to Help > Enter License Key, and input the key. Press Enter when done.: "
}

open_vmware_with_key_gui() {
    local key="$1"
    echo -e "Please input the following key in VMware:\n\n$key"
}

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

detect_version() {
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

    version=$(wmic product get name,version | grep "VMware Workstation" | cut -d' ' -f2)
    if [ -n "$version" ]; then
        print_colored "Detected Version: VMware Workstation $version" "\e[92m"
    else
        print_colored "Unable to determine the VMware Workstation version." "\e[91m"
    fi
}

show_ui() {
    animate_ui
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
    animate_ui
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

crack_menu() {
    animate_ui
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

main() {
    show_ui
}

main
