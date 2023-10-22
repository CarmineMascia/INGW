import 'package:flutter/material.dart';
import 'package:prova1/Model/Piatti.dart';

class SearchBarWidgetSala extends StatefulWidget {
  final void Function(Map<String, List<Piatti>>) update;
  final Map<String, List<Piatti>> categoriePiatti;

  SearchBarWidgetSala({
    required this.update,
    required this.categoriePiatti,
  });

  @override
  _SearchBarWidgetSalaState createState() => _SearchBarWidgetSalaState();
}

class _SearchBarWidgetSalaState extends State<SearchBarWidgetSala> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 50.0,
      child: SearchBar(
        onChanged: (String newText) {
          Map<String, List<Piatti>> filteredList = {};

          for (var categoria in widget.categoriePiatti.keys) {
            List<Piatti> originalList = widget.categoriePiatti[categoria] ?? [];
            List<Piatti> filteredCategoria = originalList
                .where((piatto) =>
                    piatto.nome.toLowerCase().contains(newText.toLowerCase()))
                .toList();

            if (filteredCategoria.isNotEmpty) {
              filteredList[categoria] = filteredCategoria;
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
        hintText: 'cerca il piatto',
        hintStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
