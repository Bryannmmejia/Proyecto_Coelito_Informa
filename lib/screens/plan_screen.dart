import 'package:flutter/material.dart';
import '../data/pasos_plan_familiar.dart';
import '../theme/app_theme.dart';
import '../widgets/coelito_avatar.dart';

/// Presenta los siete pasos en tarjetas que se pueden deslizar.
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final _controlador = PageController();
  int _pasoActual = 0;

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  void _irAlPaso(int paso) {
    _controlador.animateToPage(paso, duration: const Duration(milliseconds: 280), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final paso = pasosPlanFamiliar[_pasoActual];
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 12),
              child: Row(children: [
                const CoelitoAvatar(tamano: 64),
                const SizedBox(width: 14),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Plan familiar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppTheme.azulMarino)),
                  Text('Desliza para recorrer los 7 pasos', style: TextStyle(color: Colors.black54)),
                ])),
                Text('${_pasoActual + 1}/${pasosPlanFamiliar.length}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppTheme.azulCoe)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(value: (_pasoActual + 1) / pasosPlanFamiliar.length, minHeight: 8),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controlador,
                itemCount: pasosPlanFamiliar.length,
                onPageChanged: (indice) => setState(() => _pasoActual = indice),
                itemBuilder: (context, indice) {
                  final elemento = pasosPlanFamiliar[indice];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(22, 16, 22, 12),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: AppTheme.azulClaro, borderRadius: BorderRadius.circular(20)), child: Text(elemento.titulo, style: const TextStyle(color: AppTheme.azulCoe, fontWeight: FontWeight.w800))),
                            const Spacer(),
                            Center(child: Icon(indice == 0 ? Icons.family_restroom : Icons.checklist_rounded, size: 72, color: AppTheme.azulCoe.withValues(alpha: 0.8))),
                            const SizedBox(height: 24),
                            Text(elemento.descripcion, style: const TextStyle(fontSize: 19, height: 1.5, fontWeight: FontWeight.w600, color: AppTheme.azulMarino)),
                            const SizedBox(height: 14),
                            const Text('Este espacio se completará con la guía oficial del COE.', style: TextStyle(color: Colors.black54, height: 1.4)),
                            const Spacer(),
                            Row(children: [
                              OutlinedButton.icon(onPressed: indice > 0 ? () => _irAlPaso(indice - 1) : null, icon: const Icon(Icons.arrow_back), label: const Text('Anterior')),
                              const Spacer(),
                              FilledButton.icon(onPressed: indice < pasosPlanFamiliar.length - 1 ? () => _irAlPaso(indice + 1) : null, icon: const Icon(Icons.arrow_forward), label: const Text('Siguiente')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 4, 22, 18),
              child: Wrap(spacing: 8, children: List.generate(pasosPlanFamiliar.length, (indice) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: indice == _pasoActual ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(color: indice == _pasoActual ? AppTheme.azulCoe : Colors.black26, borderRadius: BorderRadius.circular(8)),
              ))),
            ),
          ],
        ),
      ),
    );
  }
}
