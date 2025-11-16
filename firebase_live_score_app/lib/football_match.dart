class FootballMatch {
  final String id;
  final String team1;
  final String team2;
  final int team1_score;
  final int team2_score;
  final bool isRunning;
  final String winner;

  FootballMatch({
    required this.id,
    required this.team1,
    required this.team2,
    required this.team1_score,
    required this.team2_score,
    required this.isRunning,
    required this.winner,
  });
}