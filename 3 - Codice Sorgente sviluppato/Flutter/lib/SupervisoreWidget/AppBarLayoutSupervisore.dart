import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/MessaggiAdmin.dart';
import 'package:prova1/AdminWidgets/BadgeWidget.dart';
import 'package:prova1/Connection/AdminConnessioneDB.dart';
import 'package:prova1/Connection/SupervisoreConnessioneDB.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/MessaggiSupervisore.dart';
import 'package:prova1/main.dart';

class AppBarLayoutSupervisore {
  SupervisoreConnessioneDB connessioneDB = SupervisoreConnessioneDB();

  AppBar buildAppBar(BuildContext context, Supervisore supervisore) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 130,
      centerTitle: true,
      leadingWidth: 100,
      leading: Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Image.asset(
            'assets/images/supervisore.png',
            width: 130.0,
            height: 130.0,
          ),
        ),
      ),
      title: Image.asset('assets/images/logo.png'),
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
                size: 40,
              ),
            ),
            const SizedBox(width: 30),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessaggiSupervisore(
                          supervisore: supervisore,
                        )));
              },
              icon: BadgeWidget(
                initialCounter: connessioneDB.notifica(),
              ),
            ),
            const SizedBox(width: 50),
          ],
        ),
      ],
    );
  }
}
