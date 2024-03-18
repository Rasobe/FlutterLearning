import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerSelection = 0;

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).viewPadding.top;

    return NavigationDrawer(
      selectedIndex: navDrawerSelection,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerSelection = value;
        });
        context.push(appMenuItems[value].link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(28, paddingTop > 0 ? 20 : 0, 16, 10),
            child: const Text('Main')),
        ...appMenuItems.sublist(0, 3).map(
              (e) => NavigationDrawerDestination(
                  icon: Icon(e.icon), label: Text(e.title)),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
          child: Divider(),
        ),
        const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('More options')),
        ...appMenuItems.sublist(3).map(
              (e) => NavigationDrawerDestination(
                  icon: Icon(e.icon), label: Text(e.title)),
            ),
      ],
    );
  }
}
