// import 'package:flutter/material.dart';

// class customersList extends StatefulWidget {
//   const customersList({super.key});

//   @override
//   State<customersList> createState() => _customersListState();
// }

// class _customersListState extends State<customersList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         title: Text("Existing Users"),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('hsusers').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Your Details"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                      child: Card(
                        // margin: EdgeInsets.all(8),
                        // elevation: 20,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius:
                              BorderRadius.circular(15.0), //<-- SEE HERE
                        ),
                        shadowColor: Colors.black,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 6,
                          // height: 130,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Text("Name : " + data['name']),
                                Text("Email : " + data['email']),
                                Text("User ID : " + data['userID']),
                                Text("Purchasing Date : " + data['purchase']),
                                Text("Expiry Date : " + data['expiry']),
                                Text("Price : " + data['price']),
                                Text("Services : " + data['services']),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
              // return container();
            }).toList(),
          );
        },
      ),
    );
  }
}

// ListTile(
//                 title: Text(data['name']),
//                 subtitle: Text(data['email']),
//               );
