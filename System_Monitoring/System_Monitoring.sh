#!/bin/bash

# System Monitoring Skript für Linux

# Log Ordner und Log Datei
LOG_ORDNER="logs"
AUSGABE_DATEI="$LOG_ORDNER/system_gesundheitsbericht.log"

# Sicherstellen, dass der Log Ordner existiert
if [ ! -d "$LOG_ORDNER" ]; then
    mkdir -p "$LOG_ORDNER"
    echo "Log Ordner erstellt: $LOG_ORDNER"
fi

# Funktionen zur Erfassung von Systeminformationen
function system_info {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')]"
    echo "Systeminformationen:"
    echo "Hostname: $(hostname), OS: $(lsb_release -d | awk -F'\t' '{print $2}'), Kernel: $(uname -r), Architektur: $(uname -m)"
}

function system_uptime {
    echo "Systemlaufzeit: $(uptime -p | sed 's/up/Seit/')"
}

function cpu_auslastung {
    CPU_INFO=$(top -bn1 | grep "Cpu(s)" | awk '{print "Benutzer: "$2"%, System: "$4"%, Leerlauf: "$8"%"}')
    echo "CPU-Auslastung: $CPU_INFO"
}

function speicher_auslastung {
    MEM_INFO=$(free -h | awk 'NR==2 {print "Genutzt: "$3", Frei: "$4", Gesamt: "$2}')
    echo "Speicherauslastung: $MEM_INFO"
}

function festplatten_auslastung {
    DISK_INFO=$(df -h | grep -E "^/dev" | awk '{print $1": "$5" belegt"}' | paste -sd ", ")
    echo "Festplattenauslastung: $DISK_INFO"
}

function netzwerk_info {
    NET_INFO=$(ip -brief addr | grep -v "LOOPBACK" | awk '{print $1": "$3}' | paste -sd ", ")
    echo "Netzwerkinformationen: $NET_INFO"
}

function aktive_prozesse {
    echo "Top-5-Prozesse (CPU-Nutzung):"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk 'NR>1 {print "  PID: "$1", Prozess: "$2", CPU: "$3"%"}'
}

# Bericht erstellen und an die Datei anhängen
{
    system_info
    system_uptime
    cpu_auslastung
    speicher_auslastung
    festplatten_auslastung
    netzwerk_info
    aktive_prozesse
    echo "----------------------------------------"
} >> $AUSGABE_DATEI

# Hinweis für den Benutzer
echo "System-Gesundheitsbericht wurde aktualisiert: $AUSGABE_DATEI"
