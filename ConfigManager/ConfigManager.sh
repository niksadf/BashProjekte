#!/bin/bash

clear
CONFIG_FILE="/etc/FirmaXYZ.conf"

if [ "$EUID" -ne 0 ]; then
    echo "Bitte als Root ausführen."
    exit 1
fi

while true; do
    echo "Was möchten Sie tun?"
    echo "1) Konfigurationsdatei erstellen"
    echo "2) Konfigurationsdatei lesen"
    echo "3) Konfigurationsdatei löschen"
    echo "4) Beenden"
    read -p "Wählen Sie eine Option (1-4): " choice

    case $choice in
        1)
            echo "key=value" > "$CONFIG_FILE"
            clear
            echo "Konfigurationsdatei erstellt: $CONFIG_FILE"
            ;;
        2)
            if [ -f "$CONFIG_FILE" ]; then
            clear
                cat "$CONFIG_FILE"
                echo ""
            else
            clear
                echo "Konfigurationsdatei existiert nicht."
            fi
            ;;
        3)
            if [ -f "$CONFIG_FILE" ]; then
            clear
                rm "$CONFIG_FILE"
                echo "Konfigurationsdatei gelöscht: $CONFIG_FILE"
            else
            clear
                echo "Konfigurationsdatei existiert nicht."
            fi
            ;;
        4)
            echo "Beenden..."
            sleep 1
            exit 0
            ;;
        *)
            clear
            echo "Ungültige Auswahl. Bitte erneut versuchen."
            ;;
    esac
    echo ""
done
