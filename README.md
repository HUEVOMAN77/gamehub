🎮 Game Hub para Android con Shizuku

Un menú rápido y elegante para detectar y lanzar tus juegos instalados en Android, usando permisos del sistema vía Shizuku.  
Muestra nombres amigables, guarda caché para carga instantánea y ofrece un comando de refresco para actualizar la lista cuando cambias tus juegos.  
Funciona sin root y está optimizado para Android modernos. 🚀

---

✨ Para qué sirve

- 🔍 Detección automática: Lista solo los juegos instalados en tu dispositivo.  
- 🏷️ Nombres amigables: Muestra el nombre visible del juego en lugar del package name.  
- ⚡ Arranque directo: Lanza el juego seleccionado desde el menú.  
- 💾 Caché inteligente: Guarda la lista detectada para que el menú cargue al instante.  
- 🔄 Refresco sencillo: Actualiza la lista con un comando cuando instalas o desinstalas juegos.  
- 📱 Sin edición manual: Ya está todo listo en el repo; solo clonas y ejecutas.  

---

📦 Requisitos

- 📲 Termux instalado y actualizado.  
- 🛠️ Git para clonar el repositorio.  
- 🔒 Shizuku instalado y en ejecución.  
- ⚙️ Cliente sui accesible en el PATH de Termux.  
- 📡 Android 10 o superior (compatible con Android 15), sin root.  

---

🛠️ Instalación paso a paso

1️⃣ Clonar el repositorio y preparar scripts
`bash
pkg install git -y
git clone https://github.com/HUEVOMAN77/gamehub.git
cd gamehub
chmod +x gamehub.sh refreshgames.sh
`

2️⃣ Configurar Shizuku
- 📥 Instala Shizuku desde su fuente oficial.  
- ⚙️ Activa depuración inalámbrica en opciones de desarrollador.  
- 🔗 Empareja por código en Shizuku.  
- ✅ Verifica que aparezca “Shizuku está en ejecución”.  
- 📲 Concede acceso a Termux como cliente con permisos.  

3️⃣ Instalar el cliente sui
- 🔎 Comprobar arquitectura:
  `bash
  uname -m
  `
  - aarch64 → ARM64  
  - armv7l → ARM32  
  - x86_64 → Intel/AMD  

- 📥 Instalar sui:
  `bash
  chmod +x sui
  mv sui ~/../usr/bin/
  `

- ✅ Verificar funcionamiento:
  `bash
  sui version
  sui pm list packages | head
  `

---

🚀 Uso

- 🎮 Abrir el menú de juegos:
  `bash
  ./gamehub.sh
  `

- 🔄 Refrescar la lista (después de instalar o borrar juegos):
  `bash
  ./refreshgames.sh
  `

> 💡 El caché se guarda en ~/gamehub_cache.txt. Se regenera automáticamente al ejecutar refreshgames.sh.

---

📂 Qué hace cada archivo

- gamehub.sh  
  - 🔍 Detecta juegos instalados con sui pm.  
  - 🏷️ Extrae nombres amigables vía dumpsys.  
  - 💾 Guarda caché para arrancar más rápido.  
  - 🎮 Lanza el juego seleccionado con sui am start.  

- refreshgames.sh  
  - 🗑️ Borra el caché (~/gamehub_cache.txt).  
  - 🔄 Ejecuta Game Hub para regenerar la lista.  

---

🛠️ Solución de problemas

- ❌ No se detecta sui:
  - Verifica con command -v sui.  
  - Asegúrate de que el binario esté en ~/../usr/bin/.  

- ❌ Shizuku no está en ejecución:  
  - Reinicia el servicio desde la app.  
  - Confirma depuración inalámbrica activa.  

- ❌ Menú vacío:  
  - Algunas apps no están marcadas como categoría “game”.  
  - Refresca con ./refreshgames.sh.  

- ❌ Nombres no amigables:  
  - Algunas apps no exponen label= en dumpsys.  
  - Se mostrará el package name como respaldo.  

---

🤝 Contribuciones e ideas

- 💡 Si notas algún error o tienes ideas para nuevos scripts útiles, ¡escríbeme!  
- 🔧 Pull requests bienvenidos para mejoras de compatibilidad y nuevas funciones.  
- 📌 Futuras mejoras:  
  - ⭐ Favoritos para priorizar juegos.  
  - ⚙️ Perfiles de optimización por juego.  
  - 🔍 Detección avanzada de actividades específicas.  

---

📬 Contacto

- 🌐 Facebook: Mi perfil  
- 💬 Telegram: @Huevoman77  

👉 Tu feedback ayuda a mejorar el Game Hub para todos.  
