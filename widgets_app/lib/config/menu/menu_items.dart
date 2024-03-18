import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button),
  MenuItems(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'ProgressIndicators',
      subTitle: 'Generales y ontrolados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'SnackBars y diálogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItems(
      title: 'Container animated',
      subTitle: 'Contenedor animado con botón',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItems(
      title: 'Ui controls',
      subTitle: 'Checkboxes, radioButtons y expanded',
      link: '/controls',
      icon: Icons.control_camera_sharp),
  MenuItems(
      title: 'App Tutorial',
      subTitle: 'App turorial with slides',
      link: '/tutorial',
      icon: Icons.help_outline_outlined),
  MenuItems(
      title: 'Infinite Scroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
