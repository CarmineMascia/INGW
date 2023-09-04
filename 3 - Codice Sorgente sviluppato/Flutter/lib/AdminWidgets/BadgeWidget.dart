import 'package:flutter/material.dart';

/*BadgeWidget badgeWidget = BadgeWidget(initialCounter: 10);
badgeWidget.setCounter(5);*/

/* va fatto in modo che ci sia una classe che ascolti i messaggi che arrivano e se 
sono un aumento di notifiche inviare il messaggio qui. usare probabilmente i provider */

class BadgeWidget extends StatefulWidget {
  final int initialCounter;

  const BadgeWidget({Key? key, this.initialCounter = 0}) : super(key: key);

  @override
  _BadgeWidgetState createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialCounter;
  }

  void setCounter(int value) {
    setState(() {
      _counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      //backgroundColor: Colors.transparent,
      label: Text('$_counter'),
      child: const Icon(
        Icons.notifications,
        size: 40,
      ),
    );
  }
}
