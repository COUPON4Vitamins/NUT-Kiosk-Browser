🔋 NUT-Kiosk-Browser

A lightweight, dedicated "Single Site Browser" (SSB) built in Python to monitor Network UPS Tools (NUT) CGI statistics. This tool provides a clean, borderless window that auto-refreshes—perfect for a persistent "kiosk" view on your desktop or a dedicated monitoring station.
🌟 Features

  👉 Simplified Installation: Includes a shell script to automate dependency checks and desktop integration.

  👉 Auto-Refresh: Keeps data current without manual intervention.

  👉 Low Footprint: Uses a lightweight Qt6 WebEngine wrapper—much more efficient than a full browser tab.

  👉 Desktop Integrated: Provides a custom icon and groups correctly on the GNOME taskbar.

🚀 Installation

  Download and Extract the project folder.

  Open a Terminal inside the folder and run:

 🖥️

    chmod +x install.sh
    ./install.sh

⚙️ Customization: Changing the Refresh Rate

By default, the browser refreshes the UPS status every 30 seconds. If you want to change this frequency:

  Open the file *ups-browser.py* in a text editor.

  Locate line 32:

    self.timer.start(30000)

   Change the number inside the parentheses. The value is in milliseconds:

        10000 = 10 seconds

        30000 = 30 seconds (Default)

        60000 = 60 seconds (1 minute)

   Save the file and restart the application.

🛠️ Requirements

   OS: Recent GNU/Linux (Tested on Debian 13 "Trixie" / GNOME Desktop)

  Packages: python3-pyqt6, python3-pyqt6.qtwebengine (The installer will handle these on Debian/Ubuntu).
