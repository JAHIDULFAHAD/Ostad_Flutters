import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'football_match.dart';

class EditMatchWidget extends StatefulWidget {
  const EditMatchWidget({super.key, required this.match});
  final FootballMatch match;

  @override
  State<EditMatchWidget> createState() => _EditMatchWidgetState();
}

class _EditMatchWidgetState extends State<EditMatchWidget> {
  late TextEditingController _matchIdController;
  late TextEditingController _team1Controller;
  late TextEditingController _team2Controller;
  late TextEditingController _team1ScoreController;
  late TextEditingController _team2ScoreController;
  late TextEditingController _winnerController;
  bool? _isRunning;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _matchIdController = TextEditingController(text: widget.match.id);
    _team1Controller = TextEditingController(text: widget.match.team1);
    _team2Controller = TextEditingController(text: widget.match.team2);
    _team1ScoreController = TextEditingController(text: widget.match.team1_score.toString());
    _team2ScoreController = TextEditingController(text: widget.match.team2_score.toString());
    _winnerController = TextEditingController(text: widget.match.winner);
    _isRunning = widget.match.isRunning;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _matchIdController,
                decoration: const InputDecoration(labelText: 'Match Id'),
                enabled: false,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _team1Controller,
                decoration: const InputDecoration(labelText: 'Team 1 Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _team2Controller,
                decoration: const InputDecoration(labelText: 'Team 2 Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _team1ScoreController,
                decoration: const InputDecoration(labelText: 'Team 1 Score'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _team2ScoreController,
                decoration: const InputDecoration(labelText: 'Team 2 Score'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<bool>(
                value: _isRunning,
                decoration: const InputDecoration(labelText: 'Is Running'),
                items: const [
                  DropdownMenuItem(
                    value: true,
                    child: Text('Yes'),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text('No'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _isRunning = value!;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _winnerController,
                decoration: const InputDecoration(labelText: 'Winner Team'),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('football').doc(widget.match.id).update({
                        'team1_name': _team1Controller.text,
                        'team2_name': _team2Controller.text,
                        'team1_score': int.parse(_team1ScoreController.text),
                        'team2_score': int.parse(_team2ScoreController.text),
                        'is_running': _isRunning,
                        'winner_team': _winnerController.text,
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Update Match'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('football').doc(widget.match.id).delete();
                      Navigator.pop(context);
                      FirebaseCrashlytics.instance.recordError(Exception('Something went wrong'), null);
                      //throw Exception('Something went wrong');
                    },
                    child: const Text('Delete Match', style: TextStyle(color: Colors.red)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
