import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserAddPage extends StatefulWidget {
  const UserAddPage({Key? key}) : super(key: key);

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  // text fields' controllers
  // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _userID = TextEditingController();
  TextEditingController _userPass = TextEditingController();
  TextEditingController _purchase = TextEditingController();
  TextEditingController _expiry = TextEditingController();
  TextEditingController _services = TextEditingController();
  TextEditingController _price = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('hsusers');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _name.text = documentSnapshot['name'];
      _email.text = documentSnapshot['email'];
      _phone.text = documentSnapshot['phone'];
      _userID.text = documentSnapshot['userID'];
      _userPass.text = documentSnapshot['userPass'];
      _purchase.text = documentSnapshot['purchase'];
      _expiry.text = documentSnapshot['expiry'];
      _services.text = documentSnapshot['services'];
      _price.text = documentSnapshot['price'];

      // _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  // keyboardType:
                  //     const TextInputType.numberWithOptions(decimal: true),
                  controller: _email,
                  decoration: const InputDecoration(
                    labelText: 'email',
                  ),
                ),
                TextField(
                  controller: _phone,
                  decoration: const InputDecoration(labelText: 'phone'),
                ),
                TextField(
                  controller: _userID,
                  decoration: const InputDecoration(labelText: 'userID'),
                ),
                TextField(
                  controller: _userPass,
                  decoration: const InputDecoration(labelText: 'userPass'),
                ),
                TextField(
                  controller: _purchase,
                  decoration: const InputDecoration(labelText: 'purchase date'),
                ),
                TextField(
                  controller: _expiry,
                  decoration: const InputDecoration(labelText: 'expiry date'),
                ),
                TextField(
                  controller: _services,
                  decoration: const InputDecoration(labelText: 'services'),
                ),
                TextField(
                  controller: _price,
                  decoration: const InputDecoration(labelText: 'price'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? name = _name.text;
                    final String? email = _email.text;
                    final String? phone = _phone.text;
                    final String? userID = _userID.text;
                    final String? userPass = _userPass.text;
                    final String? purchase = _purchase.text;
                    final String? expiry = _expiry.text;
                    final String? services = _services.text;
                    final String? price = _price.text;

                    // final double? price =
                    //     double.tryParse(_priceController.text);
                    if (name != null && price != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _products.add({
                          "name": name,
                          "email": email,
                          "phone": phone,
                          "userID": userID,
                          "userPass": userPass,
                          "puchase": purchase,
                          "expiry": expiry,
                          "services": services,
                          "price": price
                        });
                      }

                      if (action == 'update') {
                        // Update the product
                        await _products.doc(documentSnapshot!.id).update({
                          "name": name,
                          "email": email,
                          "phone": phone,
                          "userID": userID,
                          "userPass": userPass,
                          "puchase": purchase,
                          "expiry": expiry,
                          "services": services,
                          "price": price
                        });
                      }

                      // Clear the text fields
                      _name.text = '';
                      _email.text = '';
                      _phone.text = '';
                      _userID.text = '';
                      _userPass.text = '';
                      _purchase.text = '';
                      _expiry.text = '';
                      _services.text = '';
                      _price.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _products.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // Press this button to edit a single product
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          // This icon button is used to delete a single product
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
