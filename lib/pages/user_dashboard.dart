import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tcp_masters/pages/add_result.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(60, 8, 60, 8),
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: Text('Jérémie, tu es dans la poule 6')),
                  ],
                ),
                SizedBox(height: 40),
                UserDashboardStats(),
                SizedBox(height: 40),
                MatchResults(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDashboardStats extends StatelessWidget {
  const UserDashboardStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LastResultCard(),
        WinLoseRatioCard(),
      ],
    );
  }
}

class LastResultCard extends StatelessWidget {
  const LastResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Dernier résultat',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text('Victoire vs. Aurélien BUCHET 7/5',
                  style: Theme.of(context).textTheme.bodyLarge),
            )
          ],
        ),
      ),
    );
  }
}

class WinLoseRatioCard extends StatelessWidget {
  const WinLoseRatioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(margin: EdgeInsets.all(10), child: Text('Ratio V/D')),
            WinLosePieChart(),
          ],
        ),
      ),
    );
  }
}

class WinLosePieChart extends StatelessWidget {
  const WinLosePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 3,
              color: Colors.red,
              title: 'Défaite',
            ),
            PieChartSectionData(
              value: 2,
              color: Colors.lightGreen,
              title: 'Victoire',
            ),
          ],
          startDegreeOffset: 0,
        ),
      ),
    );
  }
}

class MatchResults extends StatelessWidget {
  const MatchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddResultPage()));
                },
                icon: Icon(Icons.add),
                label: Text('Ajouter un résultat'),
              )
            ],
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Score')),
              DataColumn(label: Text('Date')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('J. KOSTER 7/5 A. BUCHET')),
                DataCell(Text('26/12/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('B. GROUCHKO 6/2 J. KOSTER')),
                DataCell(Text('21/12/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 6/4 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('J. KOSTER 2/6 A. GAILLARD')),
                DataCell(Text('11/10/2023')),
              ]),
            ],
          )
        ],
        // Liste de résultats
      ),
    );
  }
}
