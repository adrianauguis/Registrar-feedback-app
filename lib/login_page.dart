import 'package:flutter/material.dart';
import 'package:registrar_log_feedback_app/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _realotp = '123456';
  String _otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/TRAX.png'),
              fit: BoxFit.cover,
            )
        ),
        child:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 400),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter OTP',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the OTP';
                            }else if(value != _realotp){
                              return 'Please enter a valid OTP';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _otp = value!;
                          },
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Process the OTP (e.g., verify it with the server)
                                print('Entered OTP: $_otp');
                                // If OTP is correct, navigate to the next screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
                                );
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
        ),
      ),
    );
  }
}
