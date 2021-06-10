import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/data/providers/alerta/alerta_provider.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/tab_history.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/tab_pendings.dart';

class AlertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlertaProvider()),
        ChangeNotifierProvider(create: (_) => _NavigationModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mis Alertas'),
        ),
        body: _Pages(),
        bottomNavigationBar: _BottomNavBar(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: Provider.of<_NavigationModel>(context).pageController,
      onPageChanged: (index) => Provider.of<_NavigationModel>(context, listen: false).currentPage = index,
      children: [
        TabPendings(),
        TabHistory(),
      ],
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: navigationModel.currentPage,
      onTap: (index) => navigationModel.currentPage = index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: 'Pendientes'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historial'),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = new PageController();

  int get currentPage => _currentPage;

  set currentPage(int page) {
    this._currentPage = page;
    _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
