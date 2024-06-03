import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:registrar_log_feedback_app/sorry_user.dart';
import 'package:registrar_log_feedback_app/thank_you_user.dart';

class RegistrarFeedback extends StatefulWidget {
  String staffName;
  int windowNum;
  RegistrarFeedback({super.key, required this.windowNum, required this.staffName});

  @override
  State<RegistrarFeedback> createState() => _RegistrarFeedbackState();
}

class _RegistrarFeedbackState extends State<RegistrarFeedback> {
  final TextEditingController _emailController = TextEditingController();
  String _name = '';
  String _email = '';
  String _feedback = '';
  String _staffName = '';
  final String _studentID = '2020300482';
  int _window = 0;
  double _rating = 0.0;
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _staffName = widget.staffName;
    _window = widget.windowNum + 1;
    return Scaffold(
      appBar:AppBar(
        title: const Text("Registrar Feedback",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF05046a),
        actions: [
          Image.asset('assets/logo.jpg')
        ],
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
                        itemBuilder: (context, _) => const Icon(
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
                decoration: const InputDecoration(labelText: 'Name (Optional)'),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter your name';
                //   }
                //   return null;
                // },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Remarks'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Remarks';
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
                  if (_formKey.currentState!.validate() && _window != 3) {
                    _formKey.currentState!.save();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ThankYouUser()),
                    );
                    // Process the feedback (e.g., send it to a server)
                  }else if (_window == 3){
                    _formKey.currentState!.save();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SorryUser()),
                    );
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
