import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: _UiControlsViewState(),
    );
  }
}

class _UiControlsViewState extends StatefulWidget {
  @override
  State<_UiControlsViewState> createState() => _UiControlsViewStateState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewStateState extends State<_UiControlsViewState> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreackfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(selectedTransportation.toString()),
          children: [
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Transporting by Boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Transporting by Car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('Transporting by Plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('Transporting by Submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile.adaptive(
          title: const Text('¿Desayuno?'),
          value: wantsBreackfast,
          onChanged: (value) => setState(() {
            wantsBreackfast = !wantsBreackfast;
          }),
        ),
        CheckboxListTile.adaptive(
          title: const Text('Comida?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile.adaptive(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
