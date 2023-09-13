import 'package:flutter/material.dart';

class AlertDialogCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Conferma Azione'),
      content: Text('Sei sicuro di voler eseguire questa azione?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Azione da eseguire se l'utente annulla la conferma.
            Navigator.of(context)
                .pop(false); // Chiudi il popup e ritorna false.
          },
          child: Text('ANNULLA'),
        ),
        TextButton(
          onPressed: () {
            // Azione da eseguire se l'utente conferma.
            Navigator.of(context).pop(true); // Chiudi il popup e ritorna true.
          },
          child: Text('CONFERMA'),
        ),
      ],
    );
  }
}
