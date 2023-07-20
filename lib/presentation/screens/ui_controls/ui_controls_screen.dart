import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui controlls'),
      ),
      body: _UiControllsView(),
    );
  }
}

class _UiControllsView extends StatefulWidget {

    const _UiControllsView();

  @override
  State<_UiControllsView> createState() => _UiControllsViewState();
}

enum Transportation {
Car,
Plane,
Boat,
Submarine
}

class _UiControllsViewState extends State<_UiControllsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.Car;
  @override
  Widget build(BuildContext context) {   

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          value: isDeveloper, 
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adicionales'),
          onChanged: (value){
            setState(() {
              isDeveloper = !isDeveloper;
              print('value is: $value');
            });
          }
          ),

          RadioListTile(
            title: const Text('By car'),
            subtitle: const Text('viajar por carro'),
            value: Transportation.Car, 
            groupValue: selectedTransportation, 
            onChanged: (value) {              
               setState(() {
                 selectedTransportation = Transportation.Car;
               });
            },            
            ),

          RadioListTile(
            title: const Text('By boat'),
            subtitle: const Text('viajar por bote'),
            value: Transportation.Boat, 
            groupValue: selectedTransportation, 
            onChanged: (value) {              
               setState(() {
                 selectedTransportation = Transportation.Boat;
               });
            },            
            ),

          RadioListTile(
            title: const Text('By plane'),
            subtitle: const Text('viajar por avion'),
            value: Transportation.Plane, 
            groupValue: selectedTransportation, 
            onChanged: (value) {              
               setState(() {
                 selectedTransportation = Transportation.Plane;
               });
            },            
            ),

          RadioListTile(
            title: const Text('By submarine'),
            subtitle: const Text('viajar por submarino'),
            value: Transportation.Submarine, 
            groupValue: selectedTransportation, 
            onChanged: (value) {              
               setState(() {
                 selectedTransportation = Transportation.Submarine;
               });
            },            
            ),
      ],
    );
  }
}