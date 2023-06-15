import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  UserPage({required this.userData, super.key});
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('hsusers').snapshots();
  DocumentSnapshot userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Your Details"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.greenAccent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
              ),
              elevation: 50,
              shadowColor: Colors.black,
              margin: EdgeInsets.all(2),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Name : " + userData['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Email : " + userData['email'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Phone Number : " + userData['phone'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "User Password : " + userData['userPass'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Purchase Date : " + userData['purchase'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Expiry Date : " + userData['expiry'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Price : " + userData['price'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Services : " + userData['services'],
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: _usersStream,
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Something went wrong');
      //     }
      //
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Text("Loading");
      //     }
      //
      //     return ListView(
      //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
      //         Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      //         return ListTile(
      //           title: Text(data['name']),
      //           subtitle: Text(data['email']),
      //         );
      //       }).toList(),
      //     );
      //   },
      // ),
    );
  }
}
