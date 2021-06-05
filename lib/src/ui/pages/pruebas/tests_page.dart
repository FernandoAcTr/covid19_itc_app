import 'package:flutter/material.dart';

class TestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pruebas de Covid-19'),
      ),
      body: _TestList(),
    );
  }
}

class _TestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, index) {
        return _TestItem(date: '21/05/21', result: 'Negativo');
      },
    );
  }
}

class _TestItem extends StatelessWidget {
  final bool positive;
  final String date;
  final String result;
  const _TestItem({
    this.positive = false,
    required this.date,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.date),
      subtitle: Text(this.result),
      leading: CircleAvatar(
        backgroundColor: this.positive ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
        child: Icon(
          this.positive ? Icons.add_alert : Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
