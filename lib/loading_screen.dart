import 'package:flutter/material.dart';
import 'package:registrar_log_feedback_app/login_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome()async{
    await Future.delayed(const Duration(seconds: 3),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
  }

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
        const Padding(
          padding: EdgeInsets.all(5.0),
          child:
            Column(
              children: [
                SizedBox(height: 440),
                Center(child: CircularProgressIndicator())
              ],
            )
        ),
      ),
    );
  }
}
