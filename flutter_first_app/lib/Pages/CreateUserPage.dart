import 'package:flutter/material.dart';
import 'package:flutter_first_app/Http/createuser.dart';

//Søren fixer det lige

class CreateUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: "First Name",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Confirm Email",
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Address",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Postal",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "City",
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    //createUser(String email, String username, String password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Søren du må ikke være med i vores hule"),
                      ),
                    );
                  },
                  child: const Text("Opret Bruger"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}