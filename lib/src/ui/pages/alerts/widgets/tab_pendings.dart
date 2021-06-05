import 'package:flutter/material.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/alert.dart';

class TabPendings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Alert> todayAlerts = getTodayAlerts();
    List<Alert> pastAlerts = getPastAlerts();

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: ListView(
        children: [
          Text('Hoy'),
          ...todayAlerts,
          SizedBox(height: 20),
          Text('Anteriores'),
          ...pastAlerts,
        ],
      ),
    );
  }

  List<Alert> getTodayAlerts() {
    return [
      Alert(
        title: '21/04/21',
        content: 'Esse nisi deserunt dolor velit id dolor id ad pariatur commodo id qui esse.',
        actions: [TextButton(onPressed: () {}, child: Text('Marcar como leida'))],
      ),
      Alert(
        title: '21/04/21',
        content: 'Commodo non duis laborum sunt pariatur.',
        actions: [TextButton(onPressed: () {}, child: Text('Marcar como leida'))],
      )
    ];
  }

  List<Alert> getPastAlerts() {
    return [
      Alert(
        title: '21/04/21',
        content: 'Esse nisi deserunt dolor velit id dolor id ad pariatur commodo id qui esse.',
        actions: [TextButton(onPressed: () {}, child: Text('Marcar como leida'))],
      ),
      Alert(
        title: '21/04/21',
        content: 'Commodo non duis laborum sunt pariatur.',
        actions: [TextButton(onPressed: () {}, child: Text('Marcar como leida'))],
      )
    ];
  }
}
