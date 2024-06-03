import 'package:flutter/material.dart';
import 'package:registrar_log_feedback_app/homepage.dart';

class ThankYouUser extends StatefulWidget {
  const ThankYouUser({super.key});

  @override
  State<ThankYouUser> createState() => _ThankYouUserState();
}

class _ThankYouUserState extends State<ThankYouUser> {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 400),
                    const Center(child: Text('Thank you, User!',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                    const Center(child: Text('We have received your reviews and we are happy for trusting our services! Till then, keep safe!',
                      textAlign: TextAlign.center,)),
                    const SizedBox(height: 14),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        child: const Text('Back to Home'),
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
