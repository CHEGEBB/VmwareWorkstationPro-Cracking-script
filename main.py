import os
import sys
import time
import random
import tkinter as tk
import subprocess

def print_colored(text, color="\033[97m", background="\033[40m"):
    print(f"{color}{background}{text}\033[0m", end='')

def show_banner():
    print_colored("""
----------------------------------------****************************************----------------------------------------
    ____   ____               _________                       __
    \   \ /   /____           \_   ___ \____________    ____ |  | __ ___________
     \   Y   /     \   ______ /    \  \/\_  __ \__  \ _/ ___\|  |/ // __ \_  __ \\
      \     /  Y Y  \ /_____/ \     \____|  | \/\  __ \  \___|    <\  ___/|  | \/
       \___/|__|_|  /          \______  /|__|   \____/\___  >__|_ \___  >__|
                  \/                  \/                  \/     \/    \/
                 VMware Cracker                        Written by CHEGEBB              GitHub: https://github.com/CHEGEBB   ----------------------------------------****************************************----------------------------------------
""", "\033[96m")

def animate_title_and_author():
    title = "VMware Cracker"
    author = "CHEGEBB"
    github = "GitHub: https://github.com/CHEGEBB"

    width = max(len(title), len(author), len(github)) + 6

    print_colored(f"\n{'-' * width}")
    print_colored(f"{'*' * width}")
    print_colored(f"{'-' * width}")
    
    print_colored(f"{title.center(width)}", "\033[96m")
    time.sleep(0.5)
    print_colored(f"{author.center(width)}", "\033[92m")
    time.sleep(0.5)
    print_colored(f"{github.center(width)}", "\033[92m")
    time.sleep(0.5)

    print_colored(f"{'-' * width}")
    print_colored(f"{'*' * width}")
    print_colored(f"{'-' * width}")

def show_ui():
    show_banner()
    animate_title_and_author()

    try:
        if os.name == "posix":
            os.system("clear")
        elif os.name == "nt":
            os.system("cls")
        else:
            print_colored("Unsupported OS!", "\033[91m")
            time.sleep(1)
            sys.exit()

    except KeyboardInterrupt:
        print_colored("Exiting...", "\033[91m")
        time.sleep(1)
        sys.exit()

    print_colored("\n1. Crack\n2. Download\n3. Detect Version\n4. Exit", "\033[92m")

    option = input("Select an option: ")

    if option == "1":
        crack_menu()
    elif option == "2":
        download()
    elif option == "3":
        detect_version()
    elif option == "4":
        print_colored("Exiting...", "\033[91m")
        time.sleep(1)
        sys.exit()
    else:
        print_colored("Invalid Option!", "\033[91m")
        time.sleep(1)
        show_ui()

def crack_menu():
    try:
        if os.name == "posix":
            os.system("clear")
        elif os.name == "nt":
            os.system("cls")
        else:
            print_colored("Unsupported OS!", "\033[91m")
            time.sleep(1)
            show_ui()
    except KeyboardInterrupt:
        print_colored("Exiting...", "\033[91m")
        time.sleep(1)
        sys.exit()

    print_colored("1. VMware Workstation Pro\n2. VMware Workstation Player\n3. VMware Fusion Pro\n4. VMware Fusion Player\n5. VMware ESXi", "\033[92m")

    option = input("Select an option: ")

    if option == "1":
        crack("pro")
    elif option == "2":
        crack("player")
    elif option == "3":
        detect_version()
    elif option == "4":
        sys.exit()
    else:
        print_colored("Invalid Option!", "\033[91m")
        time.sleep(1)
        show_ui()

def animate_startup():
    frames = [
        " [*] Loading modules...",
        " [+] Starting VMware exploit...",
        " [!] Exploit successful! Cracking keys...",
        " [+] Keys found! Activating VMware..."
    ]

    for frame in frames:
        print_colored(frame, "\033[92m")
        time.sleep(0.5)
        if os.name == "posix":
            os.system("clear")
        elif os.name == "nt":
            os.system("cls")

def animate_cracking_countdown():
    for i in range(20, -1, -1):
        print_colored(f"Cracking in {i} seconds...", "\033[93m", "\033[1m")
        time.sleep(1)
        if os.name == "posix":
            os.system("clear")
        elif os.name == "nt":
            os.system("cls")

def crack(version):
    animate_startup()
    animate_cracking_countdown()

    # Keys in the script labeled as valid
    keys = [
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
    ]

    # Check if a valid key is present in the script
    valid_key_found = any(validate_key(key) for key in keys)

    if valid_key_found:
        use_keys(keys)
        print_colored("Exiting...", "\033[91m")
        sys.exit()

    print_colored("Cracking... Please wait.", "\033[93m")
    animate_loading()

    # Shuffle the keys to select a random one
    random.shuffle(keys)

    for key in keys:
        if validate_key(key):
            print_colored("\nCracked Successfully!", "\033[92m")
            open_vmware_with_key_gui(key)
            break

    if not valid_key_found:
        print_colored("No valid key found.", "\033[91m")

def validate_key(key):
    # Perform validation here if needed
    return True  # Placeholder, replace with actual validation

def use_keys(keys):
    # Prompt the user to input a key
    print_colored(f"Using key: {keys[0]}", "\033[95m")
    input("Please open VMware, go to Help > Enter License Key, and input the key. Press Enter when done.")

def open_vmware_with_key_gui(key):
    root = tk.Tk()
    root.title("VMware Key Activation")

    label = tk.Label(root, text=f"Please input the following key in VMware:\n\n{key}", padx=10, pady=10)
    label.pack()

    root.mainloop()

def download():
    try:
        url = ""
        if os.name == "posix":
            url = "https://www.vmware.com/go/getworkstation-linux"
        elif os.name == "nt":
            url = "https://www.vmware.com/go/getworkstation-win"
        else:
            print_colored("Unsupported OS!", "\033[91m")
            time.sleep(1)
            sys.exit()

        os.system(f"xdg-open {url}") if os.name == "posix" else os.startfile(url) if os.name == "nt" else None
    except Exception as e:
        print_colored("Error!", "\033[91m")
        print(e)
        time.sleep(1)
        download()

def detect_version():
    try:
        # Check if VMware Workstation is installed by looking for the registry key
        registry_key_path = r"SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation"
        key_exists = check_registry_key_exists(registry_key_path)

        if not key_exists:
            print_colored("VMware Workstation is not installed.", "\033[93m")
            return

        # Get VMware Workstation version using WMI
        version = get_vmware_workstation_version()
        if version:
            print_colored(f"Detected Version: VMware Workstation {version}", "\033[92m")
        else:
            print_colored("Unable to determine the VMware Workstation version.", "\033[91m")
    except Exception as e:
        print_colored(f"Error during version detection: {e}", "\033[91m")

def check_registry_key_exists(key_path):
    try:
        with open(os.devnull, 'wb') as null:
            subprocess.check_call(["reg", "query", key_path], stdout=null, stderr=null)
            return True
    except subprocess.CalledProcessError:
        return False

def get_vmware_workstation_version():
    try:
        import wmi
        c = wmi.WMI()
        for product in c.Win32_Product():
            if "VMware Workstation" in product.Caption:
                return product.Version
    except Exception as e:
        print_colored(f"Error during version detection: {e}", "\033[91m")

def main():
    show_ui()

if __name__ == "__main__":
    main()
