import 'package:flutter/material.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/tab_history.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/tab_pendings.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Alertas'),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: PageView(
        children: [
          TabPendings(),
          TabHistory(),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).accentColor,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: 'Pendientes'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historial'),
      ],
    );
  }
}
