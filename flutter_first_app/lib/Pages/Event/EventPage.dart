import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_first_app/config/api_config.dart';





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HTTP Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter HTTP Example'),
        ),
        body: CreateEvent(),
      ),
    );
  }
}

class CreateEvent extends StatefulWidget {
  @override
  CreateEventState createState() {
    return CreateEventState();
  }
}

class CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();
  final String baseUrl = ApiConfig.apiUrl;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController catergoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  void dispose() {
   
    super.dispose();
  }

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
   
    
      final type = typeController.text;
      final category = catergoryController.text;
      final description = descriptionController.text;

      // Call the method to send data to the backend
      try {
        final EventDTO newEventDTO = await createevent(
            type, category, description);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Description ${newEventDTO.description} created successfully."),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to create Event: $e"),
          ),
        );
      }
    }
  }

  Future<EventDTO> createevent( String type,String category,String description) async 
    {
    final String baseUrl = ApiConfig.apiUrl;
      final response = await http.post(
        Uri.parse('$baseUrl/api/events/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
        body: json.encode(<String, String>{
          
          'type':type,
          'category':category,
          'description':description,
        }),
      );
      if (response.statusCode == 201) {
      return EventDTO.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create event: ${response.statusCode} - ${response.body}');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
           /* TextFormField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please choose date';
                }
                return null;
              },
            ), */
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Type'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'What type';
                }
                return null;
              },
            ),
             TextFormField(
              controller: catergoryController,
              decoration: InputDecoration(labelText: 'Category'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'What category';
                }
                return null;
              },
            ),
             TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Descripe event';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

