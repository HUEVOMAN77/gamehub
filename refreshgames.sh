#!/bin/bash
# Game Hub con Shizuku + nombres amigables + caché

CACHE=~/gamehub_cache.txt

# Verificar si 'sui' está disponible
if ! command -v sui >/dev/null 2>&1; then
    echo "⚠️ No se detectó 'sui'. Usa modo manual o instala el binario."
    exit 1
fi

# Si existe caché, usarlo
if [ -f "$CACHE" ]; then
    echo "⚡ Usando caché de juegos detectados..."
    mapfile -t lines < "$CACHE"
else
    echo "🎮 Detectando juegos instalados con Shizuku..."
    mapfile -t pkgs < <(sui pm list packages -f | sed 's/.*=//')

    lines=()
    for pkg in "${pkgs[@]}"; do
        if sui dumpsys package "$pkg" | grep -iq "category.*game"; then
            name=$(sui dumpsys package "$pkg" | grep -m1 "label=" | sed 's/.*label=//')
            [ -z "$name" ] && name="$pkg"
            lines+=("$name|$pkg")
        fi
    done

    # Guardar en caché
    printf "%s\n" "${lines[@]}" > "$CACHE"
fi

# Mostrar menú
i=1
declare -A GAME_LIST
for entry in "${lines[@]}"; do
    name="${entry%%|*}"
    pkg="${entry##*|}"
    GAME_LIST[$i]=$pkg
    echo "$i) $name"
    i=$((i+1))
done

read -p "👉 Ingresa el número del juego: " opcion
SELECTED=${GAME_LIST[$opcion]}

if [ -z "$SELECTED" ]; then
    echo "❌ Opción inválida."
    exit 1
fi

echo "🎮 Abriendo $SELECTED ..."
sui am start -n $SELECTED/.MainActivity 2>/dev/null || sui am start -n $SELECTED/.SplashActivity 2>/dev/null
