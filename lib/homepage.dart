import 'package:flutter/material.dart';
import 'package:registrar_log_feedback_app/registrar_feedback.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> staffNames = [
    'Ms. Rizza Cagare-Bernal',
    'Ms. Dean Dagondon',
    'Mr. Adrian Auguis',
    'Ms. Soccoro C. Falle',
    'Ms. Carel S. Bustamante',
    'Ms. Carel S. Bustamante'
  ];
  List<String> status = [
    'Available',
    'Available',
    'Available',
    'Available',
    'Available',
    'Unavailable'
  ];
  MaterialColor color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color(0xFF05046a),
        title: const Text("Registrar Staffs", style: TextStyle(color: Colors.white),),
        leading: Image.asset('assets/logo.jpg'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_student.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            6, (index) {
              if (status[index] == "Available"){color = Colors.green;}else{ color = Colors.red;}
              return GestureDetector(
                onTap: (){
                  const snackBar = SnackBar(
                    content: Text('This Staff is not Available'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1),
                  );
                  // Handle tap for the grid item
                  // print('Clicked on Item ${index + 1}');
                  if (status[index] == "Available"){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegistrarFeedback(staffName: staffNames[index], windowNum: index,)));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  },
                child: Opacity(
                  opacity: 0.85,
                  child: Card(
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/profile_image.jpg'),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          staffNames[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Window ${index + 1}'),
                        Text('Status: ${status[index]}',style: TextStyle(color: color)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    );
  }
}
