class Result {
  final int resultId;
  final int leagueId;
  final int winnerId;
  final int loserId;
  final String winnerScore;
  final String loserScore;
  final String date;

  const Result(
      {required this.resultId,
      required this.leagueId,
      required this.winnerId,
      required this.loserId,
      required this.winnerScore,
      required this.loserScore,
      required this.date});

  static Result fromJson(Map<String, dynamic> json) => Result(
      resultId: json["result_id"],
      leagueId: json["league_id"],
      winnerId: json["winner_id"],
      loserId: json["loser_id"],
      winnerScore: json["winner_score"],
      loserScore: json["loser_score"],
      date: json["date"]);
}
