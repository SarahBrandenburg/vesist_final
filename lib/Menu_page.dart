// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu';

  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //final _menuBloc = MenuBloc();
  List<String> items = ['English', 'Deutsch', 'Français', 'Español', 'Русский'];
  String? selectedItem = 'Deutsch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 40,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 6),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            const Text(
              'Menü\n\n',
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Text(
                  'Modus',
                  style: TextStyle(
                      decoration: TextDecoration.underline, height: 1.5),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Hell',
                  style: TextStyle(height: 1.5),
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {},
                  iconSize: 40,
                  icon: const Icon(Icons.toggle_on),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  '\nSprache\n',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      decoration: TextDecoration.underline, height: 1.5),
                ),
              ],
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 3, color: Colors.grey)),
              ),
              value: selectedItem,
              items: items
                  .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14),
                      )))
                  .toList(),
              onChanged: (item) => setState(() => selectedItem = item),
            ),
            Row(
              children: const [
                Text(
                  '\nImpressum',
                  style: TextStyle(
                      decoration: TextDecoration.underline, height: 1.5),
                ),
              ],
            ),
            Row(
              children: const [
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Vesist ',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, height: 2.0),
                      ),
                      TextSpan(
                          text:
                              'GmbH\nCEO: Karina Greb\nCOO: Helena Däsch\nCTO: Sarah Brandenburg\nCFO: Catalina Guzman Castro\nCCO: Jessica Stohler\n\n',
                          style: TextStyle(height: 1.5)),
                      TextSpan(
                          text:
                              'Anschrift:\nWürzburger Straße 45\n63743 Aschaffenburg\nGermany\n\n',
                          style: TextStyle(height: 1.5)),
                      TextSpan(
                          text:
                              'Kontakt:\n(+496021) 123456\n+49123456789\ninfo@vesist.de\n\n',
                          style: TextStyle(height: 1.5)),
                      TextSpan(
                          text:
                              'Datenschutz Verantwortlich \ngemäß § 5 TMG ist\nHelena Däsch COO\n\n',
                          style: TextStyle(height: 1.5)),
                      TextSpan(
                          text:
                              'Medizinische Zweckbestimmung:\nhttps://www.adliance.net/medizin-software/\nzweckbestimmung\n\n\n',
                          style: TextStyle(height: 1.5)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
