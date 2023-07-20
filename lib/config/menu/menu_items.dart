import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String  subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
  

}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Botones', subTitle: 'Varios botones en Flutter', link: '/buttons', icon: Icons.smart_button),
  MenuItem(title: 'Tarjetas', subTitle: 'Un contenedor Estilizado', link: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'Progress Indicators', subTitle: 'Generales y controlados', link: '/progress', icon: Icons.refresh_rounded),
  MenuItem(title: 'SnackBars y dialogos', subTitle: 'Indicadores en pantalla', link: '/snackbars', icon: Icons.info_outline),
  MenuItem(title: 'Animated Container', subTitle: 'Stateful widget animado', link: '/animated', icon: Icons.check_box_outlined),
  MenuItem(title: 'Ui Controlls + Tiles', subTitle: 'Una serie de controles en flutter', link: '/ui-controls', icon: Icons.equalizer_outlined),
  MenuItem(title: 'Introduccion a la aplicacion', subTitle: 'Pequeño tutorial introductorio', link: '/tutorial', icon: Icons.accessibility_rounded),
  MenuItem(title: 'Infinite Scroll y pull', subTitle: 'Listas infinitas y pull to refresh', link: '/infinite', icon: Icons.list_alt_rounded),
];