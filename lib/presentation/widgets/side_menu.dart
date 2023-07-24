import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scafoldfKey;

  const SideMenu({super.key, required this.scafoldfKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;    

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scafoldfKey.currentState?.closeDrawer();        
      },
      children: [
        
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 30, 16, 10),
          child: const Text('Menu'),
          ),

        const NavigationDrawerDestination(
          icon: Icon( Icons.add ), 
          label: Text('Home Screen')
          ),

          ...appMenuItems
          .sublist(0, 3)
          .map((m) {
            return NavigationDrawerDestination(
            icon: Icon(m.icon), 
            label: Text(m.title)
            );
          }),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
            ),

          const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More Options'),
          ),
                      ...appMenuItems
          .sublist(3)
          .map((m) {
            return NavigationDrawerDestination(
            icon: Icon(m.icon), 
            label: Text(m.title)
            );
          }),

        const NavigationDrawerDestination(
            icon: Icon(Icons.add_shopping_cart_rounded), 
            label: Text('otra pantalla')
            )
      ]
      );
  }
}