import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{
  @override

  var nameEditingController = TextEditingController();
  var departmentEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var addressEditingController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Page"),),
        body: Center(
          child: Column(
            children: [
              Text("Please fill in the information"),
              TextField(decoration: InputDecoration(hintText: "Enter employee name"), controller: nameEditingController, ),
              TextField(decoration: InputDecoration(hintText: "Enter employee email"), controller: emailEditingController, keyboardType: TextInputType.emailAddress,),
              TextField(decoration: InputDecoration(hintText: "Enter employee address"), controller: addressEditingController,),
              TextField(decoration: InputDecoration(hintText: "Enter employee department"), controller: departmentEditingController,),

              ElevatedButton(onPressed: (){
                print(nameEditingController.text);
                print(emailEditingController.text);
                print(addressEditingController.text);
                print(departmentEditingController.text);

                // it will go back to previous page

                // 2 In sender, passed the item as second argument of navigator, pop

                var newItem = {
                  "name":nameEditingController.text,
                  "department":departmentEditingController.text,
                  "email":emailEditingController.text,
                  "address":addressEditingController.text,
                };

                Navigator.pop(context, newItem);

              }, child: Text("Add new employee"))
            ],
          ),
        )
    );
  }
}

