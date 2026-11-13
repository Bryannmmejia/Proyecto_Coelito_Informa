import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Pantalla vacía reutilizable para las funciones planificadas de la fase 2.
class ProximamenteScreen extends StatelessWidget {
  const ProximamenteScreen({super.key, required this.titulo, required this.icono});

  final String titulo;
  final IconData icono;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(titulo)),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CircleAvatar(radius: 48, backgroundColor: AppTheme.azulClaro, foregroundColor: AppTheme.azulCoe, child: Icon(icono, size: 42)),
          const SizedBox(height: 20),
          Text(titulo, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
          const SizedBox(height: 8),
          const Text('Próximamente', style: TextStyle(fontSize: 17, color: AppTheme.azulCoe, fontWeight: FontWeight.w700)),
        ]),
      ),
    ),
  );
}
