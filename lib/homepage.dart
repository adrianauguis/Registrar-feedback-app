import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = '';
  String _email = '';
  String _feedback = '';
  final String _staffName = 'Carel S. Bustamante';
  final String _studentID = '2020300482';
  final int _window = 6;
  double _rating = 0.0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Registrar Feedback"),
        backgroundColor: Colors.blue,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text('Staff name: $_staffName', style: const TextStyle(fontSize: 18),),
              Text('Student ID: $_studentID', style: const TextStyle(fontSize: 18),),
              Text('Window: $_window', style: const TextStyle(fontSize: 18),),
              const SizedBox(height: 10,),
              Center(
                child: Column(
                  children: [
                    const Text('Rate your Experience', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    RatingBar.builder(
                      initialRating: _rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 50,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                    Text('$_rating', style: const TextStyle(fontSize: 18),),
                  ],
                )
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Remarks'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
                onSaved: (value) {
                  _feedback = value!;
                },
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              Center(child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the feedback (e.g., send it to a server)
                    print('Name: $_name');
                    print('Email: $_email');
                    print('Feedback: $_feedback');
                  }
                },
                child: const Text('Submit'),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
