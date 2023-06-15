import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/userPage.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _userIdController = TextEditingController();
  final _passWordController = TextEditingController();
  late DocumentSnapshot userData;
  Future<bool> checkExist(String docID, String passWord) async {
    bool userIdExist = false;
    bool passwordExist = false;
    try {
      await FirebaseFirestore.instance.doc("hsusers/$docID").get().
      then((doc) {
        userData = doc;
        if(userData.get('userPass').toString() == passWord){
          passwordExist = true;
        }
        userIdExist = userData.exists;
      });
      return passwordExist & userIdExist;
    } catch (e) {
      // If any error
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("User Details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    "Dashboard Login",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _userIdController,
                    decoration: InputDecoration(
                      labelText: "Enter User ID",
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _passWordController,
                    decoration: InputDecoration(
                      labelText: "Enter User password",
                    ),
                  ),
                  SizedBox(height: 45),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      minimumSize: Size(180, 40),
                    ),
                    onPressed: () async {

                      bool docExists = await checkExist(_userIdController.text.trim(), _passWordController.text);
                      print("Document exists in Firestore? " + docExists.toString());

                      if(docExists == true){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                          return UserPage(userData: userData,);
                        }));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Not found")));
                      }
                    },
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
