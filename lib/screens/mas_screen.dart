import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'proximamente_screen.dart';

/// Accesos a las secciones previstas para la fase 2.
class MasScreen extends StatelessWidget {
  const MasScreen({super.key});

  static const _secciones = <({String titulo, IconData icono})>[
    (titulo: 'Videos del COE', icono: Icons.play_circle_outline),
    (titulo: 'Infografías', icono: Icons.image_outlined),
    (titulo: 'Noticias', icono: Icons.newspaper_outlined),
    (titulo: 'Alertas por provincia', icono: Icons.warning_amber_outlined),
    (titulo: 'Quiz y mini juegos', icono: Icons.extension_outlined),
    (titulo: 'Misiones de la semana', icono: Icons.flag_outlined),
    (titulo: 'Refugios y contactos', icono: Icons.map_outlined),
    (titulo: 'Plan descargable', icono: Icons.picture_as_pdf_outlined),
    (titulo: 'Compartir por WhatsApp', icono: Icons.share_outlined),
    (titulo: 'Pregúntale a Coelito', icono: Icons.question_answer_outlined),
  ];

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 820),
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(22, 26, 22, 8),
            sliver: SliverToBoxAdapter(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Explora Coelito', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
              SizedBox(height: 6),
              Text('Más recursos para aprender y prepararnos en familia.', style: TextStyle(color: Colors.black54)),
            ])),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
            sliver: SliverLayoutBuilder(builder: (context, constraints) {
              final ancho = constraints.crossAxisExtent;
              final columnas = ancho > 650 ? 3 : 2;
              return SliverGrid.builder(
                itemCount: _secciones.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnas, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.28),
                itemBuilder: (context, indice) {
                  final seccion = _secciones[indice];
                  return Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ProximamenteScreen(titulo: seccion.titulo, icono: seccion.icono))),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Icon(seccion.icono, color: AppTheme.azulCoe, size: 28),
                          Text(seccion.titulo, style: const TextStyle(fontWeight: FontWeight.w700, color: AppTheme.azulMarino)),
                          const Text('Próximamente', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        ]),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    ),
  );
}
