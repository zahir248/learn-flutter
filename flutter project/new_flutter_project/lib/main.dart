import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // 2) For each textfield create the textEditingController
  var nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("First App"), backgroundColor: Colors.lightBlue, centerTitle: true, // Add this line to center-align the title
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
          Text("Welcome to my app", style: GoogleFonts.maShanZheng (textStyle: TextStyle(color: Colors.blueAccent, fontSize: 32)),),
          SizedBox(height: 8,),
          Container(
            width: 300, // Set the desired width
            height: 200, // Set the desired height
            child : Image.network("https://butwhytho.net/wp-content/uploads/2023/09/Gojo-Jujutsu-Kaisen-But-Why-Tho-2.jpg", fit: BoxFit.cover, // You can use different BoxFit options
            ),
          ),
          SizedBox(height: 8,),
          Text("Gojo Satoru", style: GoogleFonts.oswald (textStyle: TextStyle(color:Colors.blue, fontSize: 24)),),
          SizedBox(height: 8,),
          Text("Please enjoy my app", style: TextStyle(color: Colors.black, fontSize: 18),),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is left"),
              SizedBox(width: 16),
              Text("This is right")
            ],
          ),
              Padding(
                padding: EdgeInsets.all(16.0), // Adjust the value as needed
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter your name"),
                  controller: nameEditingController,
                ),
              ),        TextButton(onPressed: (){
          Fluttertoast.showToast(
              msg: "Hello ${nameEditingController.text}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          }, child: Text("Press me"))
      ],
      )),
    );
  }
}



