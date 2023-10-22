import 'package:flutter/material.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/main.dart';

class AppBarLayoutCucina {
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 130,
      centerTitle: true,
      leadingWidth: 100,
      leading: Container(
          alignment: Alignment.centerRight,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Calcola la larghezza desiderata in base alla larghezza dello schermo
              double width = constraints.maxWidth *
                  0.5; // Ad esempio, il 50% dello schermo

              return Image.asset(
                'assets/images/cucina.png',
                width: width,
              );
              // Altezza in base al rapporto dell'immagine originale
              // Puoi modificarla in base alle tue esigenze.
            },
          )),
      title: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Calcola la larghezza desiderata in base alla larghezza dello schermo
          double width =
              constraints.maxWidth * 0.5; // Ad esempio, il 50% dello schermo

          return Image.asset(
            ('assets/images/logo.png'),
            width: width,
          );
          // Altezza in base al rapporto dell'immagine originale
          // Puoi modificarla in base alle tue esigenze.
        },
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 50.0,
        )
      ],
    );
  }
}
