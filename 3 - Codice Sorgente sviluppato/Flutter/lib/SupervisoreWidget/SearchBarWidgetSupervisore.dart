/*import 'package:flutter/material.dart';
import 'package:prova1/Model/Ingrediente.dart';

Container searchBar(/*si potrebbe dover togliere*/void Function(List<Ingrediente>) updateDispensa) {
  return Container(
    width: 500.0,
    height: 50.0,
    child: SearchBar( 
      
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
        ),
      ],
      backgroundColor: MaterialStateProperty.all(
        Color.fromARGB(190, 255, 255, 255),
      ),
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      )),
      hintText: 'scrivi qui',
      hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
    ),
  );
}*/

/*import 'package:flutter/material.dart';
import 'package:prova1/Model/Ingrediente.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(List<Ingrediente>) update;
  List<Ingrediente> dispensa;
  bool filter = true; //true se è Nome, false se è codice

  SearchBarWidget({
    required this.update,
    required this.dispensa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 50.0,
      child: SearchBar(
        onChanged: (String newText) {
          // Qui puoi eseguire la logica di ricerca e aggiornare la dispensa
          // Esempio: updateDispensa(nuovaListaDispensa);
          List<Ingrediente> filteredList = [];

          if (filter == true) {
            for (int i = 0; i < dispensa.length; i++) {
              if (dispensa[i]
                  .nome
                  .toLowerCase()
                  .startsWith(newText.toLowerCase())) {
                filteredList.add(dispensa[i]);
              }
            }
          } else {
            for (int i = 0; i < dispensa.length; i++) {
              if (dispensa[i].codice.startsWith(newText)) {
                filteredList.add(dispensa[i]);
              }
            }
          }

          update(filteredList);
        },
        leading: const Icon(Icons.search),
        trailing: [
          /*IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt),
          ),*/
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.filter_alt),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Nome',
                    child: Text('Nome'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Codice',
                    child: Text('Codice'),
                  ),
                ],
                onSelected: (String value) {
                  if (value == 'Nome') {
                    filter = true;
                  } else if (value == 'Codice') {
                    filter = false;
                  }
                },
              ),
            ],
          ),
        ],
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(190, 255, 255, 255),
        ),
        shape: MaterialStateProperty.all(
          const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        hintText: 'scrivi qui',
        hintStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Tavolo.dart';

class SearchBarWidgetSupervisore extends StatefulWidget {
  final void Function(List<Tavolo>) update;
  List<Tavolo> tavoli;

  SearchBarWidgetSupervisore({
    required this.update,
    required this.tavoli,
  });

  @override
  _SearchBarWidgetSupervisoreState createState() =>
      _SearchBarWidgetSupervisoreState();
}

class _SearchBarWidgetSupervisoreState
    extends State<SearchBarWidgetSupervisore> {
  //true se è Nome, false se è codice

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 50.0,
      child: SearchBar(
        onChanged: (String newText) {
          // Qui puoi eseguire la logica di ricerca e aggiornare la dispensa
          // Esempio: updateDispensa(nuovaListaDispensa);
          List<Tavolo> filteredList = [];

          for (int i = 0; i < widget.tavoli.length; i++) {
            if (widget.tavoli[i].nome
                .toLowerCase()
                .startsWith(newText.toLowerCase())) {
              filteredList.add(widget.tavoli[i]);
            }
          }

          widget.update(filteredList);
        },
        leading: const Icon(Icons.search),
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(190, 255, 255, 255),
        ),
        shape: MaterialStateProperty.all(
          const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        hintText: 'scrivi il numero del tavolo',
        hintStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
      ),
    );
  }
}