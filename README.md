# Coelito

Aplicación Flutter educativa sobre preparación ante emergencias. La portada, el plan familiar y la actividad de mochila están en la Fase 1. Las pantallas de Fase 2 muestran «Próximamente» hasta que se incorpore contenido oficial.

## Imágenes de Coelito

Guarda las imágenes PNG en `assets/coelito/` con estos nombres:

- `coelito_saludando.png`: imagen predeterminada de portada y guía.
- `coelito_senalando.png`: pose para futuras indicaciones.
- `coelito_feliz.png`: pose para futuros mensajes positivos.
- `coelito_preocupado.png`: pose para futuras alertas educativas.

La app usa `coelito_saludando.png` si está disponible. Si falta, aparece un conejito de reemplazo y la app sigue funcionando. El retrato se adapta en `lib/widgets/coelito_avatar.dart`: cambia `tamano` en las pantallas para ajustar su altura; el ancho se calcula automáticamente para mantener el retrato vertical. `BoxFit.contain` conserva la imagen completa.

Los iconos que añadiste están en su carpeta correcta, `assets/iconos/`: `familia.png` se usa en el acceso al plan familiar y `mochila.png` en el acceso y en la zona para soltar objetos. Si reemplazas esos archivos, conserva exactamente los nombres para que la app los encuentre. Si falta alguno, aparece un icono de Flutter de respaldo. Las carpetas `assets/infografias/`, `assets/fotos/` y `assets/videos/` quedan listas para contenido posterior. Todas están registradas en `pubspec.yaml`.

## Editar contenido

- Los siete textos del plan están en `lib/data/pasos_plan_familiar.dart`. Reemplaza los textos pendientes solo con el contenido oficial validado del COE.
- Los objetos y su marca de esenciales están en `lib/data/objetos_mochila.dart`.
- Los colores están en `lib/theme/app_theme.dart`.
- Los textos y accesos de la portada están en `lib/screens/inicio_screen.dart`.
- Los iconos PNG y sus respaldos están en la clase `_AccesoCard` de `lib/screens/inicio_screen.dart`; ajusta `width` y `height` para cambiar su tamaño.
- La lista de secciones futuras está en `lib/screens/mas_screen.dart`.

## Ejecutar en Windows

Abre la terminal integrada de VS Code en la carpeta del proyecto. Ejecuta cada comando por separado.

1. Si quieres actualizar tu instalación a la última versión estable antes de empezar, selecciona el canal estable:

   ```powershell
   flutter channel stable
   ```

2. Actualiza Flutter y el Dart incluido en el SDK:

   ```powershell
   flutter upgrade
   ```

3. Obtener dependencias:

   ```powershell
   flutter pub get
   ```

4. Abrir en Chrome:

   ```powershell
   flutter run -d chrome
   ```

5. Para Android, inicia un emulador en Android Studio y consulta sus identificadores:

   ```powershell
   flutter devices
   ```

6. Ejecuta con el identificador que apareció para tu emulador:

   ```powershell
   flutter run -d ID_DEL_EMULADOR
   ```

## Agregar una pantalla

1. Crea un archivo en `lib/screens/`, por ejemplo `mi_pantalla_screen.dart`.
2. Implementa ahí un widget de pantalla.
3. Si necesita datos editables, crea o actualiza un archivo de `lib/data/`.
4. Añade la pantalla a la navegación en `lib/main.dart` o crea un acceso desde `lib/screens/mas_screen.dart`.

## Paquetes

No se añadieron paquetes externos. La Fase 1 usa los widgets y APIs incluidos en Flutter, como `PageView`, `Draggable` y `DragTarget`.
