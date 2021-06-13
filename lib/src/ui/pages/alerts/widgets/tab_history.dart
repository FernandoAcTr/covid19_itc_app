import 'package:covid19_itc/src/data/entities/alerta.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/data/providers/alerta/alerta_provider.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/alert.dart';

class TabHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlertaProvider>(context);
    final alerts = provider.historyAlerts;
    return provider.state.loading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () => provider.fetchAlerts(),
            child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: alerts.length > 0
                    ? _ListAlerts(alerts: alerts)
                    : ListView(
                        children: [
                          SizedBox(height: 200),
                          Center(child: Text('No tienes ninguna alerta en tu historial')),
                        ],
                      )),
          );
  }
}

class _ListAlerts extends StatelessWidget {
  const _ListAlerts({
    required this.alerts,
  });

  final List<Alerta> alerts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alerts.length,
      itemBuilder: (_, index) {
        return CusttomAlert(
          title: DateFormat.yMMMMEEEEd().format(alerts[index].createAt),
          content: alerts[index].alerta,
        );
      },
    );
  }
}
