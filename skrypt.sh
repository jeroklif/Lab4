#!/bin/bash
# skrypt.sh

case "$1" in
    --date|-d)
        date +"%Y-%m-%d"
        ;;
    --logs|-l)
        count=${2:-100}
        for ((i=1; i<=$count; i++)); do
            echo "log$i.txt created by $0 on $(date)" > log$i.txt
        done
        ;;
    --error|-e)
        count=${2:-100}
        for ((i=1; i<=$count; i++)); do
            mkdir -p error$i
            echo "error$i.txt created by $0 on $(date)" > error$i/error$i.txt
        done
        ;;
    --help|-h)
        echo "Dostępne opcje:"
        echo "  --date, -d      Wyświetla dzisiejszą datę"
        echo "  --logs, -l [N]  Tworzy N plików log (domyślnie 100)"
        echo "  --error, -e [N] Tworzy N plików error (domyślnie 100)"
        echo "  --init          Klonuje repozytorium i ustawia ścieżkę"
        echo "  --help, -h      Wyświetla pomoc"
        ;;
    --init)
        git clone https://github.com/jeroklif/Lab4.git .
        echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
        ;;
    *)
        echo "Nieznana opcja. Użyj --help"
        ;;
esac
