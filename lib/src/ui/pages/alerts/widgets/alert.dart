import 'package:flutter/material.dart';

class CusttomAlert extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget>? actions;

  const CusttomAlert({
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.title, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(this.content),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
