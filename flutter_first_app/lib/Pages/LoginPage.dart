import 'package:flutter/material.dart';
import 'package:flutter_first_app/Http/getuser.dart';
import 'package:flutter_first_app/Pages/CreateUserPage.dart';





class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: "Email",
          ),
      ),
          const SizedBox(height: 16),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () 
            {  ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Søren din bandit kan du så stå op')),);
            fetchuser();
            }, 
            child: const Text('Login'),),

             const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateUserPage()),
                );
              }, 
              child: const Text("Opret Bruger"),
            
                ),
              ],
            ),
          ),
       );
  }
}