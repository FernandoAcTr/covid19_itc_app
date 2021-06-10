import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:covid19_itc/src/data/entities/alerta.dart';
import 'package:covid19_itc/src/data/providers/alerta/alerta_provider.dart';
import 'package:covid19_itc/src/ui/pages/alerts/widgets/alert.dart';

class TabPendings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlertaProvider>(context);
    List<Alerta> todayAlerts = provider.todayAlerts;
    List<Alerta> previousAlerts = provider.previousAlerts;

    return provider.state.loading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async => Provider.of<AlertaProvider>(context, listen: false).fetchAlerts(),
            child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: todayAlerts.length > 0 || previousAlerts.length > 0
                    ? _buildListView(todayAlerts, previousAlerts)
                    : Center(child: Text('No hay alertas nuevas'))),
          );
  }

  ListView _buildListView(List<Alerta> todayAlerts, List<Alerta> previousAlerts) {
    return ListView(
      children: [
        if (todayAlerts.length > 0) Text('Hoy'),
        ..._mapAlerts(todayAlerts),
        SizedBox(height: 20),
        if (previousAlerts.length > 0) Text('Anteriores'),
        ..._mapAlerts(previousAlerts),
      ],
    );
  }

  List<CusttomAlert> _mapAlerts(List<Alerta> alerts) {
    return alerts
        .map((item) => CusttomAlert(
              title: DateFormat.yMMMMEEEEd().format(item.createAt),
              content: item.alerta,
              actions: [
                TextButton(
                  child: Text('Marcar como leida'),
                  onPressed: () {},
                )
              ],
            ))
        .toList();
  }
}
