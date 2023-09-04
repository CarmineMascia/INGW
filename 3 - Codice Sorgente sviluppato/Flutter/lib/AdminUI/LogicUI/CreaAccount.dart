import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeCreaAccount.dart';
import 'package:prova1/AdminWidgets/CreaAccountFieldsWidget.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import '../Themes/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import '../Themes/ThemeDatiAccount.dart';
import 'package:prova1/ClientsWidgets/CustomDropdown.dart';

class CreaAccount extends StatefulWidget {
  final Admin admin;
  const CreaAccount({super.key, required this.admin});

  @override
  _InputCreaAccount createState() => _InputCreaAccount();
}

class _InputCreaAccount extends State<CreaAccount> {
  @override
  //Oggetti per la creazione della schermata
  Controller controller = Controller();
  ControllerUI controllerUI = ControllerUI();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeCreaAccount themeDatiAccount = ThemeCreaAccount();
  List<String> fields = ["Nome", "Cognome", "Email", "Password"];
  List<String> jobs = ['Cucina', 'Supervisore', 'Sala'];
  String hint = 'Ruolo';

  //Stringhe per Account nuovo
  //creare superclasse account
  //fare come su chatgpt:
  /*Per aggiungere elementi di input testuale in Flutter, puoi utilizzare il widget `TextField`. Questo widget permette agli utenti di inserire testo attraverso la tastiera. Ecco un esempio di come puoi utilizzare il widget `TextField`:

```dart
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _textValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina di Input'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _textValue = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Inserisci testo',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Valore di input: $_textValue'),
          ],
        ),
      ),
    );
  }
}
```

Nell'esempio sopra, abbiamo utilizzato il widget `TextField` all'interno di un widget `Column` per creare una pagina con un campo di input testuale. Il valore inserito dall'utente viene memorizzato nella variabile `_textValue`.

All'interno di `TextField`, abbiamo utilizzato l'attributo `onChanged` per aggiornare il valore `_textValue` ogni volta che l'utente modifica il testo nell'input. Questo ci permette di visualizzare in tempo reale il valore inserito dall'utente.

L'attributo `decoration` viene utilizzato per personalizzare l'aspetto dell'input, ad esempio aggiungendo una label di testo.

Infine, abbiamo incluso un widget `Text` per visualizzare il valore di input `_textValue` in tempo reale sotto l'input text.

Puoi personalizzare ulteriormente il `TextField` e l'aspetto dei widget a tuo piacimento, ad esempio aggiungendo validazioni, limitando la lunghezza del testo, o applicando stili specifici.*/

  @override
  Widget build(BuildContext context) {
    CustomDropdown dropdownMenu = CustomDropdown(options: jobs, hint: hint);
    CreaAccountFieldsWidget fieldsWidget =
        CreaAccountFieldsWidget(keys: fields);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.admin),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
              controllerUI.ButtonBarAdmin(context, widget.admin),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.4),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      WhiteLine(),
                      const SizedBox(height: 5.0),
                      Text(
                        "CREA ACCOUNT",
                        style: ThemeCreaAccount.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 30.0),
                      fieldsWidget,
                      //CreaAccountFieldsWidget(keys: fields),
                      //controllerUI.CreaAccountFields(fields),
                      //CustomDropdown(options: jobs, hint: hint),
                      dropdownMenu,
                      const SizedBox(height: 30.0),
                      //mettere dropdownmenu dal ClientsWidgets
                      WhiteLine(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text(
                              "SALVA",
                              style: ThemeCreaAccount.textStyle2(),
                            ),
                            onPressed: () {
                              String? accountType =
                                  dropdownMenu.getSelectedValue();
                              Map<String, String?> formData =
                                  fieldsWidget.getData();
                              if (formData.length == 4 && accountType != null) {
                                controller.addEmployee(
                                    accountType, formData.values, context);
                              } else {
                                SnackBar snackBar = const SnackBar(
                                    content: Text('Inserisci tutti i campi'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(200, 40),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
