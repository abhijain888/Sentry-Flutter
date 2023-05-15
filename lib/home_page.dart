import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sentry in Flutter"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text(
                "$index",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(names[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            double? value;
            value! + 100;
          } catch (exception, stackTrace) {
            debugPrint("catch error");
            await Sentry.captureException(
              exception,
              stackTrace: stackTrace,
            );
          }
        },
        child: const Icon(Icons.error),
      ),
    );
  }
}

List<String> names = [
  "James",
  "Guen",
  "Peter",
  "Andrew",
  "Emma",
  "John",
  "Steve",
  "Mark",
  "Patrick",
  "Naomi",
];
