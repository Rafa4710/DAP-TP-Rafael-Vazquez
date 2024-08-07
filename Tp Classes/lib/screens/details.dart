import 'package:flutter/material.dart';
import 'package:tp1_screens/core/data.dart';
import '../entities/historygames.dart';

class TeamsDetailScreen extends StatelessWidget {
  const TeamsDetailScreen({
    super.key,
    required this.teamsId,
  });

  static const String name = 'Teams_details_screen';
  final String teamsId;

  @override
  Widget build(BuildContext context) {
    final teams = teamsList.firstWhere((teams) => teams.number == teamsId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: TeamsDetailView(teams: teams),
    );
  }
}

class TeamsDetailView extends StatelessWidget {
  const TeamsDetailView({
    super.key,
    required this.teams,
  });

  final HistoryGames teams;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (teams.portada != null) Image.network(teams.portada!, height: 400),
          const SizedBox(height: 16),
          Text(
            teams.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'DT: ${teams.desc}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'Fecha de creacion: ${teams.restrinctedTo}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
