import 'dart:async';
import 'package:finalapp/admin.dart';
import 'package:finalapp/adminLogin.dart';
import 'package:finalapp/user.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Hosting Safari",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset('animations/hs.jpg'),
                  Column(
                    children: [
                      SizedBox(height: 15),
                      // LottieBuilder.asset('animations/starter.json'),
                      // Image.asset('animations/hs.jpg'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "Most Trusted & Affordable Dedicated Server Provider in India",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 15),
                          ListTile(
                            leading: MyBullet(),
                            title: Text(
                              "Fully Customizable Dedicated Server Hosting with Quick Provisioning",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: MyBullet(),
                            title: Text(
                              "Tally on Cloud Service & Competitive Pricing",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserDetails(),
                        ),
                      );
                    },
                    icon: Icon(Icons.bubble_chart),
                    label: Text(
                      "Login to see your Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontFeatures:
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 215,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          //change width and height on your need width = 200 and height = 50

                          // minimumSize: Size(200, 40),
                          ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AdminLogin(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.admin_panel_settings),
                          SizedBox(width: 10),
                          Text(
                            "Admin Panel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        // minimumSize: Size(200, 40),
                      ),
                      onPressed: () async {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: 'Info@hostingsafari.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject': 'Seeking Help',
                              'body':
                                  'Hi, Hosting Safari. I need help. This is the issue : ',
                            }));
                        if (await canLaunchUrl(emailUri)) {
                          launchUrl(emailUri);
                        } else {
                          throw Exception('Could not Launch $emailUri');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.support_agent),
                          SizedBox(width: 10),
                          Text(
                            "Contact Support",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
    );
  }
}
