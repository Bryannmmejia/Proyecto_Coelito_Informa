import 'package:flutter/material.dart';

import 'screens/inicio_screen.dart';
import 'screens/mas_screen.dart';
import 'screens/mochila_screen.dart';
import 'screens/plan_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CoelitoApp());
}

/// Punto de entrada y navegación principal de Coelito.
class CoelitoApp extends StatefulWidget {
  const CoelitoApp({super.key});

  @override
  State<CoelitoApp> createState() => _CoelitoAppState();
}

class _CoelitoAppState extends State<CoelitoApp> {
  int _seccionActual = 0;

  late final List<Widget> _pantallas = [
    InicioScreen(onIrASeccion: _irASeccion),
    const PlanScreen(),
    const MochilaScreen(),
    const MasScreen(),
  ];

  void _irASeccion(int indice) => setState(() => _seccionActual = indice);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coelito | COE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      home: Scaffold(
        body: SafeArea(
          child: IndexedStack(index: _seccionActual, children: _pantallas),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _seccionActual,
          onDestinationSelected: _irASeccion,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Inicio'),
            NavigationDestination(icon: Icon(Icons.people_outline), selectedIcon: Icon(Icons.people), label: 'Mi plan'),
            NavigationDestination(icon: Icon(Icons.backpack_outlined), selectedIcon: Icon(Icons.backpack), label: 'Mochila'),
            NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Más'),
          ],
        ),
      ),
    );
  }
}
