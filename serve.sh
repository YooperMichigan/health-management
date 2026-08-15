#!/usr/bin/env bash
# Serves this folder over HTTP on your Mac's local network so you can test
# the PWA in Safari on your iPhone/iPad, plus locally at http://localhost:8080
set -euo pipefail
cd "$(dirname "$0")"
PORT="${1:-8080}"
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "your-mac-ip")
echo "Serving $(pwd)"
echo "  On this Mac:      http://localhost:$PORT"
echo "  On iPhone/iPad:   http://$IP:$PORT   (same Wi-Fi network required)"
echo "Press Ctrl+C to stop."
python3 -m http.server "$PORT"
