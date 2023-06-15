import 'package:finalapp/addingusers.dart';
import 'package:finalapp/createUser.dart';
import 'package:finalapp/features%20extra/creatingusers2.dart';
import 'package:finalapp/customersList.dart';
import 'package:finalapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Admin Panel"),
        ),

        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                Center(
                  child: LottieBuilder.asset('animations/admin.json'),
                ),
                SizedBox(height: 40),
                // Card 1
                Column(
                  children: [
                    Text(
                      "Namaste Admin",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let's manage our Users and expand them to both Domestic and Global Market",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12, right: 12, bottom: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateUser(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blueGrey,
                      elevation: 15,
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Create a new User",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Card 1 ends
                // Card 2
                Divider(
                  color: Colors.blueGrey,
                  indent: 40,
                  endIndent: 40,
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 12, right: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserPage(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blueGrey,
                      elevation: 50,
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Existing Users",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // card 2 ends
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => homePage(),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
