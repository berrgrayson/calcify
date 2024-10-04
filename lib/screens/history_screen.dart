// lib/screens/history_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/calc_state.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calcState = Provider.of<CalcState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Confirm before clearing history
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Clear History'),
                  content: Text('Are you sure you want to clear the history?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // calcState.clearHistory();
                        Navigator.pop(context);
                      },
                      child: Text('Clear'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: calcState.history.isEmpty
          ? Center(child: Text('No history yet.', style: TextStyle(color: Colors.white)))
          : ListView.builder(
              itemCount: calcState.history.length,
              itemBuilder: (context, index) {
                // Display the latest calculation at the top
                int reversedIndex = calcState.history.length - 1 - index;
                return ListTile(
                  title: Text(
                    calcState.history[reversedIndex],
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Reuse the history item in the main calculator
                    String expression = calcState.history[reversedIndex].split('=')[0].trim();
                    calcState.clear();
                    calcState.appendValue(expression);
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }
}
