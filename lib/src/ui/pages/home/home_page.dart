import 'package:flutter/material.dart';
import 'package:covid19_itc/src/ui/pages/home/widgets/card_table.dart';
import 'package:covid19_itc/src/ui/pages/home/widgets/page_title.dart';
import 'package:covid19_itc/src/ui/pages/home/widgets/background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202333),
      body: Stack(
        children: [
          Background(),
          _HomeBody(),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //
          PageTitle(),
          //
          CardTable()
        ],
      ),
    );
  }
}
