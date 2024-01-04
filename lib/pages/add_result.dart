import 'package:flutter/material.dart';

// 1 model qui agrège les infos (nom adversaire, score, V/D, date). c'est un consumer
// la vue récap récupèrera les données de ce model en tant que Consumer
// chaque élément prendra l'input du user et enverra la donnée dans le model
// OU autre solution :
// toute la page est un stateful widget avec un state qui contient plusieurs variables (adversaire, etc.)
// les sous-widgets updatent l'état

class AddResultPage extends StatefulWidget {
  const AddResultPage({super.key});

  @override
  State<AddResultPage> createState() => _AddResultPageState();
}

class _AddResultPageState extends State<AddResultPage> {
  Opponent? selectedOpponent;
  Score? selectedScore;
  ResultType? selectedResult;
  final TextEditingController opponentController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    color: Theme.of(context).indicatorColor,
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text(
                'Ajouter un résultat',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SegmentedButton(
              emptySelectionAllowed: false,
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(
                    value: ResultType.victory,
                    label: Text('Victoire'),
                    icon: Icon(Icons.emoji_events)),
                ButtonSegment(
                    value: ResultType.defeat,
                    label: Text('Défaite'),
                    icon: Icon(Icons.close)),
              ],
              selected: {selectedResult},
              onSelectionChanged: (newResult) {
                setState(() {
                  selectedResult = newResult.first;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            DropdownMenu(
              controller: opponentController,
              leadingIcon: const Icon(Icons.person),
              label: const Text('Adversaire'),
              onSelected: (Opponent? opponent) {
                setState(() {
                  selectedOpponent = opponent!;
                });
              },
              dropdownMenuEntries: Opponent.values.map(
                (Opponent opponent) {
                  return DropdownMenuEntry(
                    value: opponent,
                    label: opponent.opponentName,
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownMenu(
              width: 170, // large enough to display 'Score' fully in the box
              controller: scoreController,
              leadingIcon: const Icon(Icons.scoreboard_outlined),
              label: const Text('Score'),
              onSelected: (Score? score) {
                setState(() {
                  selectedScore = score!;
                });
              },
              dropdownMenuEntries: Score.values.map(
                (Score score) {
                  return DropdownMenuEntry(
                    value: score,
                    label: score.scoreLabel,
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            if (selectedOpponent != null &&
                selectedScore != null &&
                selectedResult != null)
              Container(
                decoration: BoxDecoration(
                  color: selectedResult == ResultType.victory
                      ? Colors.green[200]
                      : Colors.red[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Text(
                    '${selectedResult?.resultLabel} J. KOSTER ${selectedScore?.scoreLabel} ${selectedOpponent?.opponentName}'),
              )
            else
              const Text('Merci de renseigner le résultat du match.'),
            Row(
              children: [
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Confirmer'),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Retour'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum ResultType {
  victory('Victoire'),
  defeat('Défaite');

  const ResultType(this.resultLabel);
  final String resultLabel;
}

enum Score {
  zero('6/0'),
  one('6/1'),
  two('6/2'),
  three('6/3'),
  four('6/4'),
  five('7/5'),
  size('7/6');

  const Score(this.scoreLabel);
  final String scoreLabel;
}

enum Opponent {
  arthur('Arthur Gaillard'),
  romain('Romain Valabrègue'),
  frederic('Frédéric Jeangirard'),
  gwenaael('Gwenael Baro'),
  paul('Paul Lefort');

  const Opponent(this.opponentName);
  final String opponentName;
}



// class ResultModel extends ChangeNotifier {
//   ResultType result;

//   //
// }

// class ResultDisplay extends StatelessWidget {
//   const ResultDisplay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var resultState = context.watch<_VictoryLoseState>();

//     return Text(resultState.userResult.toString());
//   }
// }
