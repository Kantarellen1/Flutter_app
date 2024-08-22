import 'package:flutter/material.dart';
import 'package:flutter_first_app/main.dart';



class DeleteUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Søren må nu gerne være med i hulen"),
                  ),
                );
              },
              child: const Text("Slet Bruger"),
            ),
          ],
        ),
      ),
    );
  }
}