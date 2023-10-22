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
            FutureBuilder<int>(
  future: connessioneDB.notifica(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      // Return a loading indicator or placeholder if the future is still running.
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      // Handle error state if the future fails.
      return Text('Error: ${snapshot.error}');
    } else {
      // If the future succeeds, you can access the notification count using snapshot.data.
      int notificationCount = snapshot.data!;

      // Return the IconButton with the notification count.
      return IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MessaggiAdmin(
                    admin: admin,
                  )));
        },
        icon: BadgeWidget(
          initialCounter: notificationCount,
        ),
      );
    }
  },
),
            const SizedBox(width: 50),
          ],
        ),
      ],
    );
  }
}
