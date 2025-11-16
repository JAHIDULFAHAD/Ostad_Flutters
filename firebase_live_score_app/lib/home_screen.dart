import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'add_match_widget.dart';
import 'edit_match_widget.dart';
import 'football_match.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FootballMatch> _matchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseCrashlytics.instance.log("Entered home screen ");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Live Score App'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('football').snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshots.hasError) {
            return Center(child: Text('Error: ${snapshots.error}'));
          } else if (snapshots.hasData) {
            _matchList.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
                in snapshots.data!.docs) {
              _matchList.add(
                FootballMatch(
                  id: doc.id,
                  team1: doc.get('team1_name'),
                  team2: doc.get('team2_name'),
                  team1_score: doc.get('team1_score'),
                  team2_score: doc.get('team2_score'),
                  isRunning: doc.get('is_running'),
                  winner: doc.get('winner_team'),
                ),
              );
            }
            return ListView.builder(
              itemCount: _matchList.length,
              itemBuilder: (context, index) {
                final footballMatch = _matchList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: footballMatch.isRunning
                        ? Colors.green
                        : Colors.grey,
                    radius: 8,
                  ),
                  title: Text(
                    '${footballMatch.team1} vs ${footballMatch.team2}',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    '${footballMatch.team1_score}-${footballMatch.team2_score}',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Winner: ${footballMatch.isRunning ? 'Pending' : footballMatch.winner}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return EditMatchWidget(match: footballMatch);
                      });
                    },
                );
              },
            );
          }
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddMatchWidget();
            },
          );
          FirebaseCrashlytics.instance.recordError(Exception('Something went wrong'), null);
          FirebaseAnalytics.instance.logEvent(name: "tap-add_button",parameters: {},);
        },
      ),
    );
  }
}




