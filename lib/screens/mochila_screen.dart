import 'package:flutter/material.dart';
import '../data/objetos_mochila.dart';
import '../theme/app_theme.dart';
import '../widgets/coelito_avatar.dart';

/// Actividad para arrastrar objetos y revisar los elementos esenciales.
class MochilaScreen extends StatefulWidget {
  const MochilaScreen({super.key});

  @override
  State<MochilaScreen> createState() => _MochilaScreenState();
}

class _MochilaScreenState extends State<MochilaScreen> {
  final Set<String> _agregados = {};

  List<ObjetoMochila> get _faltantes => objetosMochila
      .where((objeto) => objeto.esencial && !_agregados.contains(objeto.id))
      .toList();

  String get _mensaje {
    if (_faltantes.isEmpty) return '¡Muy bien! Ya añadiste todos los elementos marcados como esenciales.';
    if (_agregados.isEmpty) return 'Arrastra algunos objetos a la mochila. Yo te ayudaré a revisar lo que falta.';
    return '¡Buen trabajo! Aún faltan ${_faltantes.length} elementos esenciales.';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
          children: [
            Row(children: [
              const CoelitoAvatar(tamano: 64),
              const SizedBox(width: 14),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Mi mochila', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
                Text('Toca y mantén un objeto para arrastrarlo', style: TextStyle(color: Colors.black54)),
              ])),
              IconButton(tooltip: 'Vaciar mochila', onPressed: _agregados.isEmpty ? null : () => setState(_agregados.clear), icon: const Icon(Icons.restart_alt)),
            ]),
            const SizedBox(height: 18),
            DragTarget<ObjetoMochila>(
              onWillAcceptWithDetails: (detalle) => !_agregados.contains(detalle.data.id),
              onAcceptWithDetails: (detalle) => setState(() => _agregados.add(detalle.data.id)),
              builder: (context, candidatas, rechazadas) {
                final resaltada = candidatas.isNotEmpty;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  constraints: const BoxConstraints(minHeight: 190),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: resaltada ? const Color(0xFFDFF4E8) : AppTheme.azulClaro,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: resaltada ? Colors.green : AppTheme.azulCoe.withValues(alpha: 0.25), width: 2),
                  ),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      // Reutilizamos el icono que puedes reemplazar en assets/iconos/.
                      Image.asset(
                        'assets/iconos/mochila.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.backpack,
                          size: 44,
                          color: resaltada ? Colors.green.shade700 : AppTheme.azulCoe,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Arrastra aquí', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: resaltada ? Colors.green.shade800 : AppTheme.azulMarino)),
                    ]),
                    const SizedBox(height: 12),
                    if (_agregados.isEmpty)
                      const Text('Tu mochila está vacía', style: TextStyle(color: Colors.black54))
                    else
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: objetosMochila
                            .where((objeto) => _agregados.contains(objeto.id))
                            .map((objeto) => Chip(
                                  avatar: Icon(objeto.icono, size: 18),
                                  label: Text(objeto.nombre),
                                  onDeleted: () => setState(() => _agregados.remove(objeto.id)),
                                ))
                            .toList(),
                      ),
                  ]),
                );
              },
            ),
            const SizedBox(height: 14),
            Card(child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [const CoelitoAvatar(tamano: 54), const SizedBox(width: 12), Expanded(child: Text(_mensaje, style: const TextStyle(color: AppTheme.azulMarino, height: 1.4, fontWeight: FontWeight.w600)))]))),
            const SizedBox(height: 18),
            const Text('Objetos disponibles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
            const SizedBox(height: 8),
            const Text('Los elementos esenciales están marcados. Adapta la mochila a las necesidades de tu familia.', style: TextStyle(color: Colors.black54, height: 1.4)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: objetosMochila.where((objeto) => !_agregados.contains(objeto.id)).map((objeto) => _ObjetoArrastrable(objeto: objeto)).toList(),
            ),
            const SizedBox(height: 12),
            Text('Esenciales pendientes: ${_faltantes.length}', style: const TextStyle(color: AppTheme.azulCoe, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class _ObjetoArrastrable extends StatelessWidget {
  const _ObjetoArrastrable({required this.objeto});
  final ObjetoMochila objeto;

  @override
  Widget build(BuildContext context) {
    final ficha = Chip(
      avatar: Icon(objeto.icono, size: 19, color: AppTheme.azulCoe),
      label: Text(objeto.nombre),
      backgroundColor: Colors.white,
      side: BorderSide(color: objeto.esencial ? AppTheme.azulCoe.withValues(alpha: 0.28) : Colors.black12),
    );
    return Draggable<ObjetoMochila>(
      data: objeto,
      feedback: Material(color: Colors.transparent, child: ficha),
      childWhenDragging: Opacity(opacity: 0.3, child: ficha),
      child: ficha,
    );
  }
}
