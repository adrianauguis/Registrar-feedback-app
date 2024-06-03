import 'package:flutter/material.dart';
import 'package:registrar_log_feedback_app/homepage.dart';

class SorryUser extends StatefulWidget {
  const SorryUser({super.key});

  @override
  State<SorryUser> createState() => _SorryUserState();
}

class _SorryUserState extends State<SorryUser> {
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
                    const Center(child: Text('Sorry!',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                    const Center(child: Text('You already send your feedback for this service! Thank you so much.',
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
