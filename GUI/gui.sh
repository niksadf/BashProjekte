!#/bin/bash
while true; do
clear
# GUI
echo "
 __| |____________________________________________| |__
(__   ____________________________________________   __)
   | |                                            | |
   | |   1. ip a                                  | |
   | |   2. top                                   | |
   | |   3. system settings                       | |
   | |                                            | |
   | |                                            | |
 __| |____________________________________________| |__
(__   ____________________________________________   __)
   | |                                            | | 
"


# Liest welche Nummer man auswählt.
read -p "Bitte gebe eine Zahl ein: " programs

# öffnet in dem fall ip a, top oder gnome-control-center welches die settings app ist für gnome
case $programs in
    1)
        echo ""
        echo "Du hast ip a gewählt."
        sleep 1
        echo ""
        ip a
        break
        ;;
    2)
        echo ""
        echo "Du hast top gewählt."
        sleep 1
        echo ""
        top
        break
        ;;
    3)
        echo ""
        echo "Du hast system settings gewählt."
        sleep 1
        echo ""
        # gnome only
        gnome-control-center
        break
        ;;
    *)
        echo ""
        echo "Ungültige Auswahl."
        echo "Versuche es nochmals."
        sleep 2
        echo ""
        ;;
esac
done