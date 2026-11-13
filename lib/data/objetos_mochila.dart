import 'package:flutter/material.dart';

/// Elementos editables para la actividad de armado de la mochila.
class ObjetoMochila {
  const ObjetoMochila({
    required this.id,
    required this.nombre,
    required this.icono,
    required this.esencial,
  });

  final String id;
  final String nombre;
  final IconData icono;
  final bool esencial;
}

const objetosMochila = <ObjetoMochila>[
  ObjetoMochila(id: 'agua', nombre: 'Agua', icono: Icons.water_drop_outlined, esencial: true),
  ObjetoMochila(id: 'comida', nombre: 'Alimentos no perecederos', icono: Icons.lunch_dining_outlined, esencial: true),
  ObjetoMochila(id: 'botiquin', nombre: 'Botiquín', icono: Icons.medical_services_outlined, esencial: true),
  ObjetoMochila(id: 'linterna', nombre: 'Linterna', icono: Icons.flashlight_on_outlined, esencial: true),
  ObjetoMochila(id: 'radio', nombre: 'Radio y pilas', icono: Icons.radio_outlined, esencial: true),
  ObjetoMochila(id: 'documentos', nombre: 'Documentos importantes', icono: Icons.folder_open_outlined, esencial: true),
  ObjetoMochila(id: 'medicinas', nombre: 'Medicamentos personales', icono: Icons.medication_outlined, esencial: true),
  ObjetoMochila(id: 'silbato', nombre: 'Silbato', icono: Icons.campaign_outlined, esencial: false),
  ObjetoMochila(id: 'cargador', nombre: 'Cargador portátil', icono: Icons.battery_charging_full, esencial: false),
  ObjetoMochila(id: 'ropa', nombre: 'Ropa de cambio', icono: Icons.checkroom_outlined, esencial: false),
];
