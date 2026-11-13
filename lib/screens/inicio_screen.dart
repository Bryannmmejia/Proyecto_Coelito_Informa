import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/coelito_avatar.dart';

/// Portada con accesos directos a las funciones principales.
class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key, required this.onIrASeccion});

  final ValueChanged<int> onIrASeccion;

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _entrada = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 850),
  )..forward();
  late final Animation<double> _opacidad = CurvedAnimation(parent: _entrada, curve: Curves.easeOut);
  late final Animation<Offset> _desplazamiento = Tween<Offset>(
    begin: const Offset(0, 0.08),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _entrada, curve: Curves.easeOutCubic));

  @override
  void dispose() {
    _entrada.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacidad,
      child: SlideTransition(
        position: _desplazamiento,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(22, 28, 22, 28),
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: AppTheme.azulClaro, borderRadius: BorderRadius.circular(16)),
                      child: const Icon(Icons.shield_outlined, color: AppTheme.azulCoe),
                    ),
                    const SizedBox(width: 12),
                    const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('COE • República Dominicana', style: TextStyle(color: AppTheme.azulMarino, fontWeight: FontWeight.w700)),
                      Text('Aprendemos a estar preparados', style: TextStyle(color: Colors.black54, fontSize: 12)),
                    ]),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppTheme.azulMarino, AppTheme.azulCoe], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      // Cambia `tamano` para hacer más grande o pequeño a Coelito.
                      const CoelitoAvatar(tamano: 180),
                      const SizedBox(height: 18),
                      const Text('¡Hola! Soy Coelito', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      const Text('Estoy aquí para ayudarte a aprender cómo prepararte junto a tu familia.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.45, fontSize: 16)),
                      const SizedBox(height: 20),
                      FilledButton.tonalIcon(
                        onPressed: () => widget.onIrASeccion(1),
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Crear mi plan familiar'),
                        style: FilledButton.styleFrom(foregroundColor: AppTheme.azulMarino, backgroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                const Text('¿Qué hacemos hoy?', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
                const SizedBox(height: 14),
                Row(children: [
                  Expanded(child: _AccesoCard(imagen: 'familia.png', iconoRespaldo: Icons.people_alt_outlined, titulo: 'Plan familiar', detalle: '7 pasos guiados', color: const Color(0xFFE8F4FC), onTap: () => widget.onIrASeccion(1))),
                  const SizedBox(width: 12),
                  Expanded(child: _AccesoCard(imagen: 'mochila.png', iconoRespaldo: Icons.backpack_outlined, titulo: 'Mi mochila', detalle: '¡Vamos a prepararla!', color: const Color(0xFFFFF4DF), onTap: () => widget.onIrASeccion(2))),
                ]),
                const SizedBox(height: 18),
                const Text('Las alertas oficiales del COE estarán disponibles en una próxima etapa.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AccesoCard extends StatelessWidget {
  const _AccesoCard({required this.imagen, required this.iconoRespaldo, required this.titulo, required this.detalle, required this.color, required this.onTap});
  /// Nombre del PNG dentro de assets/iconos/.
  final String imagen;
  /// Icono de Flutter que se muestra si el PNG no está disponible.
  final IconData iconoRespaldo;
  final String titulo;
  final String detalle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(
            backgroundColor: color,
            // Los archivos propios viven en assets/iconos/. Mantener un
            // icono de respaldo evita que una imagen faltante rompa la tarjeta.
            child: Image.asset(
              'assets/iconos/$imagen',
              width: 38,
              height: 38,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(iconoRespaldo, color: AppTheme.azulCoe),
            ),
          ),
          const SizedBox(height: 16),
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
          const SizedBox(height: 4),
          Text(detalle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ]),
      ),
    ),
  );
}
