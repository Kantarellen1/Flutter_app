import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_intro/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 92, 208, 77)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // ↓ Add the code below.
  var users = <WordPair>[];

  void toggleFavorite() {
    if (users.contains(current)) {
      users.remove(current);
    } else {
      users.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LoginPage();
      case 1:
        page = CreateUserPage();
      case 2:
        page = DeleteUserPage();
      case 3:
        page = UpdateUserPage(); 
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,  // ← Here.
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.login),
                    label: Text('Login'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.create),
                    label: Text('Create Users'),
                  ),
                  NavigationRailDestination(
                    icon:  Icon(Icons.delete),
                    label: Text("Delete Users"),  
                  ),
                  NavigationRailDestination(
                    icon:  Icon(Icons.update),
                    label: Text("Update Users"),  
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}


class UpdateUserPage extends StatelessWidget {
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
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Søren er nu blevet leder af hulen"),
                  ),
                );
              },
              child: const Text("Opdater bruger"),
            ),
          ],
        ),
      ),
    );
  }
}
                   
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