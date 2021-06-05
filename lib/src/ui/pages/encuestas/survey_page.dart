import 'package:flutter/material.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encuestas aplicadas'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ListItem('21/05/23'),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;

  const _ListItem(this.text);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(this.text),
      leading: Icon(Icons.text_snippet),
      textColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      children: [
        ListTile(
          title: Text('¿Tienes diarrea?'),
          subtitle: Text('No'),
        ),
        ListTile(
          title: Text('¿Tienes problemas al respirar?'),
          subtitle: Text('No'),
        ),
        ListTile(
          title: Text('¿Tienes secresión nasal?'),
          subtitle: Text('Si'),
        ),
      ],
    );
  }
}
