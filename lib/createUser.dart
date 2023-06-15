import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController userID = TextEditingController();
  final TextEditingController userPass = TextEditingController();
  final TextEditingController purchase = TextEditingController();
  final TextEditingController expiry = TextEditingController();
  final TextEditingController services = TextEditingController();
  final TextEditingController price = TextEditingController();

  // final CollectionReference _productss =
  //     FirebaseFirestore.instance.collection('hsusers');

  // Future<void> insertrecord() async {
  //   if (name.text != "" ||
  //       email.text != "" ||
  //       phone.text != "" ||
  //       userID.text != "" ||
  //       userPass.text != "" ||
  //       purchase.text != "" ||
  //       expiry.text != "" ||
  //       services.text != "" ||
  //       price.text != "") {
  //     try {
  //       String uri = "http://192.168.164.82/apicreationforfinalapp/insert.php";
  //       var res = await http.post(Uri.parse(uri), body: {
  //         "name": name.text,
  //         "email": email.text,
  //         "phone": phone.text,
  //         "userId": userID.text,
  //         "userPass": userPass.text,
  //         "purchase": purchase.text,
  //         "expiry": expiry.text,
  //         "services": services.text,
  //         "price": price.text,
  //       });

  //       var response = jsonDecode(res.body);
  //       if (response["success"] == "true") {
  //         print("insert record");
  //       } else {
  //         print("some issue");
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     print("please fill all fields");
  //   }
  // }

  CollectionReference users = FirebaseFirestore.instance.collection('hsusers');

  // late String nameText;
  // late String emailText;
  // late String phoneText;
  // late String userIDText;
  // late String userPasstext;
  // late String purchaseText;
  // late String expiryText;
  // late String servicesText;
  // late String priceText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Create User"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   name.text = value;
                // },
                controller: name,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the Partner Name',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your email';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   email.text = value;
                // },
                controller: email,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the Email',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your email';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   userID.text = value;
                // },
                controller: userID,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the User ID',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your ID';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   userPass.text = value;
                // },
                controller: userPass,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the User Password',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your Password';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   phone.text = value;
                // },
                controller: phone,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the User Phone Number',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your phone Number';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   purchase.text = value;
                // },
                controller: purchase,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Purchase date - (DD/MM/YYYY)',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your phone Number';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   expiry.text = value;
                // },
                controller: expiry,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Expiry Date - (DD/MM/YYYY)',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your phone Number';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   services.text = value;
                // },
                controller: services,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the Services Bought - In Bullet Points',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your phone Number';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextFormField(
                // onChanged: (value) {
                //   price.text = value;
                // },
                controller: price,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  label: Text(
                    'Enter the Price to be offered',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Your phone Number';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  //   FirebaseFirestore.instance
                  //       .collection('hsusers')
                  //       .doc("nice")
                  //       .get()
                  //       .then((DocumentSnapshot documentSnapshot) {
                  //     if (documentSnapshot.exists) {
                  //       print('Document data: ${documentSnapshot.get('phone').toString()}');
                  //     } else {
                  //       print('Document does not exist on the database');
                  //     }
                  //   });
                  users
                      .doc(userID.text)
                      .set({
                        'email': email.text,
                        'expiry': expiry.text,
                        'name': name.text,
                        'phone': phone.text,
                        'price': price.text,
                        'purchase': purchase.text,
                        'services': services.text,
                        'userID': userID.text,
                        'userPass': userPass.text,
                      })
                      .then(
                        (value) => showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Success"),
                            content: const Text("Scuccessfully added a user"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => (),
                                  //   ),
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text(
                                    "Okay",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .catchError((error) => print("error"));

                  // insertrecord();
                  // await users.add({
                  //   'name': nameText,
                  //   'email': emailText,
                  //   'password': userPasstext,
                  //   'userid': userIDText,
                  //   'phone': phoneText,
                  //   'purchase': purchaseText,
                  //   'expiry': expiryText,
                  //   'services': servicesText,
                  //   'price': priceText
                  // }).then((value) => print('user Added'));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
