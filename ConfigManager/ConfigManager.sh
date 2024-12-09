#!/bin/bash

clear
CONFIG_FILE="/etc/FirmaXYZ.conf"

#Testet ob als Root ausgeführt wurde:
if [ "$EUID" -ne 0 ]; then
    echo "Bitte als Root ausführen."
    exit 1
fi

#Zeigt die optionen and und fangt den Loop an
while true; do
    echo "Was möchten Sie tun?"
    echo "1) Konfigurationsdatei erstellen"
    echo "2) Konfigurationsdatei lesen"
    echo "3) Konfigurationsdatei löschen"
    echo "4) Beenden"
    read -p "Wählen Sie eine Option (1-4): " choice

#Erstellt die Konfigurationsdatei
    case $choice in
        1)
            echo "key=value" > "$CONFIG_FILE"
            clear
            echo "Konfigurationsdatei erstellt: $CONFIG_FILE"
            ;;
# Liest die Konfigurationsdatei vor
        2)
            if [ -f "$CONFIG_FILE" ]; then
            clear
                cat "$CONFIG_FILE"
                echo ""
# Fehlermeldung, Datei exestiert nicht, kann nicht vorgelesen werden.
            else
            clear
                echo "Konfigurationsdatei existiert nicht."
            fi
            ;;
# Löscht die Konfigurationsdatei
        3)
            if [ -f "$CONFIG_FILE" ]; then
            clear
                rm "$CONFIG_FILE"
                echo "Konfigurationsdatei gelöscht: $CONFIG_FILE"
# Fehlermeldung, Datei exestiert nicht, kann nicht gelöscht werden.
            else
            clear
                echo "Konfigurationsdatei existiert nicht."
            fi
            ;;
# Beendet das Programm
        4)
            echo "Beenden..."
            sleep 1
            exit 0
            ;;
# Fehlermeldung für ungültige Nummern
       *)
            clear
            echo "Ungültige Auswahl. Bitte erneut versuchen."
            ;;
    esac
    echo ""
done
