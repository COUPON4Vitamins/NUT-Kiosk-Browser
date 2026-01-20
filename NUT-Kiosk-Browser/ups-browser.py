import sys
import os
from PyQt6.QtCore import QUrl, QTimer
from PyQt6.QtGui import QIcon
from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6.QtWebEngineWidgets import QWebEngineView

# 1. This is the magic for GNOME taskbars/docks
try:
    from ctypes import windll  # Only if you were on Windows, but for Linux:
    import setproctitle
    setproctitle.setproctitle("ups-monitor")
except ImportError:
    pass

class UPSBrowser(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("UPS Status Monitor")
        self.resize(1024, 768)
        
        # 2. Set the window icon explicitly
        icon_path = os.path.expanduser("~/.local/share/icons/hicolor/scalable/apps/ups-monitor.svg")
        self.setWindowIcon(QIcon(icon_path))
        
        self.browser = QWebEngineView()
        self.browser.setUrl(QUrl("http://localhost/cgi-bin/nut/upsstats.cgi"))
        self.setCentralWidget(self.browser)

        self.timer = QTimer()
        self.timer.timeout.connect(self.refresh_page)
        self.timer.start(30000)

    def refresh_page(self):
        self.browser.reload()

app = QApplication(sys.argv)

# 3. This matches the 'Name' in your .desktop file to group them correctly
app.setDesktopFileName("ups-monitor.desktop")

window = UPSBrowser()
window.show()
sys.exit(app.exec())
