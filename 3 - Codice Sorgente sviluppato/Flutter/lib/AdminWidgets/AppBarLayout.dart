import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/MessaggiAdmin.dart';
import 'package:prova1/AdminWidgets/BadgeWidget.dart';
import 'package:prova1/Connection/AdminConnessioneDB.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/main.dart';

class AppBarLayout {
  AdminConnessioneDB connessioneDB = AdminConnessioneDB();

  AppBar buildAppBar(BuildContext context, Admin admin) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 130,
      centerTitle: true,
      leadingWidth: 100,
      leading: Container(
        alignment: Alignment.centerRight,
        child: Image.asset(
          'assets/images/admin.png',
          width: 70.0,
          height: 70.0,
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
                    builder: (context) => MessaggiAdmin(
                          admin: admin,
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
