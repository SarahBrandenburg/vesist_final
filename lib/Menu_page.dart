import 'package:flutter/material.dart';
//import 'package:test_appliction/index.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu';

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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
                Column(children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],), 
            ),
            const Text(
              '\nMenü\n\n',
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
                              'Datenschutz\nVerantwortlich gemäß § 5 TMG ist Helena Däsch COO\n\n',
                          style: TextStyle(height: 1.5)),
                      TextSpan(
                          text:
                              'Medizinische Zweckbestimmung:\nhttps://www.adliance.net/medizin-software/zweckbestimmung\n\n\n',
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
