#!/bin/bash
clear 
echo "
████████╗██╗ ██████╗    ████████╗ █████╗  ██████╗    ████████╗ ██████╗ ███████╗██╗
╚══██╔══╝██║██╔════╝    ╚══██╔══╝██╔══██╗██╔════╝    ╚══██╔══╝██╔═══██╗██╔════╝██║
   ██║   ██║██║            ██║   ███████║██║            ██║   ██║   ██║█████╗  ██║
   ██║   ██║██║            ██║   ██╔══██║██║            ██║   ██║   ██║██╔══╝  ╚═╝
   ██║   ██║╚██████╗       ██║   ██║  ██║╚██████╗       ██║   ╚██████╔╝███████╗██╗
   ╚═╝   ╚═╝ ╚═════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝       ╚═╝    ╚═════╝ ╚══════╝╚═╝"
sleep 3
clear
# Spielfeld
board=("1" "2" "3" "4" "5" "6" "7" "8" "9")
currentPlayer="X"
gameWon=0
turns=0

# Funktion um das Spielfeld anzuzeigen
display_board() {
    echo "-------------"
    echo "| ${board[0]} | ${board[1]} | ${board[2]} |"
    echo "-------------"
    echo "| ${board[3]} | ${board[4]} | ${board[5]} |"
    echo "-------------"
    echo "| ${board[6]} | ${board[7]} | ${board[8]} |"
    echo "-------------"
}

# Für das überprüfen ob jemand gewonnen hat
check_winner() {
    # Überprüfung aller Gewinnkombinationen
    winPatterns=(
        "0 1 2"
        "3 4 5"
        "6 7 8"
        "0 3 6"
        "1 4 7"
        "2 5 8"
        "0 4 8"
        "2 4 6"
    )
    
    for pattern in "${winPatterns[@]}"; do
        set -- $pattern
        if [ "${board[$1]}" == "$currentPlayer" ] && [ "${board[$2]}" == "$currentPlayer" ] && [ "${board[$3]}" == "$currentPlayer" ]; then
            gameWon=1
            return
        fi
    done
}

# Hauptspiel Loop
while [ $gameWon -eq 0 ] && [ $turns -lt 9 ]; do
    clear
    display_board
    echo "Spieler $currentPlayer, wähle ein Feld (1-9): "
    read -r move

    # Überprüfen ob die Eingabe gültig ist
    if [[ ! "$move" =~ ^[1-9]$ ]] || [[ "${board[$move-1]}" == "X" ]] || [[ "${board[$move-1]}" == "O" ]]; then
        echo "Ungültiger Zug! Wähle ein freies Feld zwischen 1 und 9."
        continue
    fi

    # Zug auswählen
    board[$move-1]="$currentPlayer"
    ((turns++))

    # Überprüft ob jemanden gewonnen hat
    check_winner

    # Wechseln des Spielers nach der Überprüfung des Gewinners
    if [ "$currentPlayer" == "X" ]; then
        currentPlayer="O"
    else
        currentPlayer="X"
    fi
done

# Anzeigen vom Endstand
clear
display_board

if [ $gameWon -eq 1 ]; then
    # Der Gewinner wird korrekt angezeigt
    if [ "$currentPlayer" == "X" ]; then
        echo "Spieler O hat gewonnen!"
    else
        echo "Spieler X hat gewonnen!"
    fi
else
    echo "Das Spiel endet unentschieden!"
fi
sleep 2