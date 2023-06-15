import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/admin.dart';
import 'package:finalapp/userPage.dart';
import 'package:flutter/material.dart';

// class AdminLogin extends StatefulWidget {
//   const AdminLogin({super.key});

//   @override
//   State<AdminLogin> createState() => _AdminLoginState();
// }

// class _AdminLoginState extends State<AdminLogin> {
//   final String adminId = 'vikasgarg';
//   final String adminPassword = 'Solution@12';
//   final idController = TextEditingController();
//   final passwordController = TextEditingController();
//   late DocumentSnapshot userData;
//   Future<bool> checkExist(String docID, String passWord) async {
//     bool userIdExist = false;
//     bool passwordExist = false;
//     // try {
//     //   await FirebaseFirestore.instance.doc("hsusers/$docID").get().then((doc) {
//     //     // userData = doc;
//     //     if (userData.get('userPass').toString() == passWord) {
//     //       passwordExist = true;
//     //     }
//     //     userIdExist = userData.exists;
//     //   });
//     //   return passwordExist & userIdExist;
//     // } catch (e) {
//     //   // If any error
//     //   return false;
//     // }
//   }

//   bool isLoggedIn = false;
//   void login() {
//     String enteredId = idController.text.trim();
//     String enteredPassword = passwordController.text.trim();

//     if (enteredId == adminId && enteredPassword == adminPassword) {
//       setState(() {
//         isLoggedIn = true;

//       });
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Login Failed'),
//             content: Text('Invalid admin ID or password.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         title: Text("Admin Control"),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.all(20),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   Text(
//                     "Admin Login",
//                     textDirection: TextDirection.ltr,
//                     style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black54),
//                   ),
//                   SizedBox(height: 30),
//                   TextFormField(
//                     controller: idController,
//                     decoration: InputDecoration(
//                       labelText: "Enter Admin ID",
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: "Enter Admin password",
//                     ),
//                   ),
//                   SizedBox(height: 45),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey,
//                       minimumSize: Size(180, 40),
//                     ),
//                     onPressed: () async {
//                       bool docExists = await checkExist(
//                           idController.text.trim(), passwordController.text);
//                       print("Document exists in Firestore? " +
//                           docExists.toString());

//                       if (docExists == true) {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return AdminPanel();
//                         }));
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("User Not found")));
//                       }
//                     },
//                     child: const Text(
//                       "Submit",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final String adminId = 'vikasgarg';
  final String adminPassword = 'Solution@12';

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

  void login() {
    String enteredId = idController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (enteredId == adminId && enteredPassword == adminPassword) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid admin ID or password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdminPanel(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return AdminPanel();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Admin Control'),
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Admin Login",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(height: 45),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: 'Admin ID',
                  ),
                ),
                SizedBox(height: 25.0),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 45),
                // SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    minimumSize: Size(180, 40),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: login,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
