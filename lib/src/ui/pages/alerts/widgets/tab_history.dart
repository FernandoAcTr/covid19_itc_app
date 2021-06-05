import 'package:covid19_itc/src/ui/pages/alerts/widgets/alert.dart';
import 'package:flutter/material.dart';

class TabHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return Alert(
            title: '21/04/21',
            content: 'Esse nisi deserunt dolor velit id dolor id ad pariatur commodo id qui esse.',
          );
        },
      ),
    );
  }
}
