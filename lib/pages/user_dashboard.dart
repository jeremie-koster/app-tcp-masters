import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tcp_masters/pages/add_result.dart';

import '../data/json/json_loader.dart';
import '../models/result.dart';

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
          ResultsTable()
        ],
        // Liste de résultats
      ),
    );
  }
}

class ResultsTable extends StatefulWidget {
  const ResultsTable({
    super.key,
  });

  @override
  State<ResultsTable> createState() => _ResultsTableState();
}

class _ResultsTableState extends State<ResultsTable> {
  // results = getResults()
  late Future<List<Result>> futureResults;

  @override
  void initState() {
    super.initState();
    futureResults = loadResults();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>>(
      future: futureResults,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No results found.'));
        } else {
          final results = snapshot.data!;
          return SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('League ID')),
                DataColumn(label: Text('Result ID')),
                DataColumn(label: Text('Winner ID')),
                DataColumn(label: Text('Loser ID')),
                DataColumn(label: Text('Winner Score')),
                DataColumn(label: Text('Loser Score')),
                DataColumn(label: Text('Date')),
              ],
              rows: results.map((result) {
                return DataRow(cells: [
                  DataCell(Text(result.leagueId.toString())),
                  DataCell(Text(result.resultId.toString())),
                  DataCell(Text(result.winnerId.toString())),
                  DataCell(Text(result.loserId.toString())),
                  DataCell(Text(result.winnerScore)),
                  DataCell(Text(result.loserScore)),
                  DataCell(Text(result.date)),
                ]);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
