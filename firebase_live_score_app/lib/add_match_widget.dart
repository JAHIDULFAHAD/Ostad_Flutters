import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class AddMatchWidget extends StatefulWidget {
  const AddMatchWidget({super.key});

  @override
  State<AddMatchWidget> createState() => _AddMatchWidgetState();
}

class _AddMatchWidgetState extends State<AddMatchWidget> {

  @override
  void initState() {
    super.initState();
    FirebaseCrashlytics.instance.log("Entered add match ");
  }
  final TextEditingController _matchIdController = TextEditingController();
  final TextEditingController _team1Controller = TextEditingController();
  final TextEditingController _team2Controller = TextEditingController();
  final TextEditingController _team1ScoreController = TextEditingController();
  final TextEditingController _team2ScoreController = TextEditingController();
  final TextEditingController _winnerController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool? _isRunning;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _matchIdController,
                decoration: const InputDecoration(labelText: 'Match Id'),
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
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  FirebaseFirestore.instance.collection('football').doc(_matchIdController.text).set({
                    'team1_name': _team1Controller.text,
                    'team2_name': _team2Controller.text,
                    'team1_score': int.parse(_team1ScoreController.text),
                    'team2_score': int.parse(_team2ScoreController.text),
                    'is_running': _isRunning,
                    'winner_team': _winnerController.text,
                  });
                  Navigator.pop(context);
                },
                child: const Text('Add Match'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
