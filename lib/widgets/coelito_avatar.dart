import 'package:flutter/material.dart';

/// Muestra una ilustración disponible o un reemplazo para que falte de imagen
/// nunca interrumpa la aplicación.
class CoelitoAvatar extends StatelessWidget {
  const CoelitoAvatar({
    super.key,
    this.nombreImagen = 'coelito_saludando.png',
    this.tamano = 132,
  });

  final String nombreImagen;
  /// Altura visual del retrato, en píxeles lógicos de Flutter.
  final double tamano;

  @override
  Widget build(BuildContext context) {
    return Container(
      // El archivo de Coelito es vertical: el marco también es vertical para
      // que el personaje se vea grande sin cortar su cara ni sus manos.
      width: tamano * 0.78,
      height: tamano,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(tamano * 0.16),
        boxShadow: [
          BoxShadow(color: const Color(0xFF102A43).withValues(alpha: 0.08), blurRadius: 24, offset: const Offset(0, 10)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/coelito/$nombreImagen',
        // contain conserva la imagen completa. Para una foto horizontal
        // puedes probar BoxFit.cover, que llena el marco pero recorta bordes.
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Text('🐰', style: TextStyle(fontSize: 76)),
        ),
      ),
    );
  }
}
