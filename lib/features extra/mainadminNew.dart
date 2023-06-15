// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class AdminPanel extends StatefulWidget {
//   @override
//   _AdminPanelState createState() => _AdminPanelState();
// }

// class _AdminPanelState extends State<AdminPanel> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _userIDController = TextEditingController();
//   TextEditingController _userPasswordController = TextEditingController();
//   TextEditingController _userNameController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   DateTime _buyingDate;
//   DateTime _expiryDate;
//   List<String> _selectedOptions = [];
//   List<String> _options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

//   Future<Database> _initializeDatabase() async {
//     final String path = join(await getDatabasesPath(), 'admin_panel.db');
//     return await openDatabase(path, version: 1, onCreate: _createDatabase);
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, '
//       'userID TEXT, userPassword TEXT, userName TEXT, '
//       'buyingDate TEXT, expiryDate TEXT, price REAL, options TEXT)',
//     );
//   }

//   Future<void> _insertUser(User user) async {
//     final Database db = await _initializeDatabase();
//     await db.insert(
//       'users',
//       user.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<User>> _getUsers() async {
//     final Database db = await _initializeDatabase();
//     final List<Map<String, dynamic>> maps = await db.query('users');
//     return List.generate(maps.length, (i) {
//       return User(
//         id: maps[i]['id'],
//         userID: maps[i]['userID'],
//         userPassword: maps[i]['userPassword'],
//         userName: maps[i]['userName'],
//         buyingDate: DateTime.parse(maps[i]['buyingDate']),
//         expiryDate: DateTime.parse(maps[i]['expiryDate']),
//         price: maps[i]['price'],
//         options: maps[i]['options'].toString().split(','),
//       );
//     });
//   }

//   Future<void> _deleteUser(int id) async {
//     final Database db = await _initializeDatabase();
//     await db.delete('users', where: 'id = ?', whereArgs: [id]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Admin Panel')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: _userIDController,
//                   decoration: InputDecoration(labelText: 'User ID'),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter a user ID';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _userPasswordController,
//                   decoration: InputDecoration(labelText: 'User Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter a user password';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _userNameController,
//                   decoration: InputDecoration(labelText: 'User Name'),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter a user name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Buying Date'),
//                 RaisedButton(
//                   onPressed: () async {
//                     final DateTime selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2100),
//                     );
//                     if (selectedDate != null) {
//                       setState(() {
//                         _buyingDate = selectedDate;
//                       });
//                     }
//                   },
//                   Text(_buyingDate == null
//                       ? 'Select Buying Date'
//                       : DateFormat('yyyy-MM-dd').format(_buyingDate)),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _priceController,
//                   decoration: InputDecoration(labelText: 'Price'),
//                   keyboardType: TextInputType.number,
//                   inputFormatters: <TextInputFormatter>[
//                     FilteringTextInputFormatter.allow(
//                         RegExp(r'^\d+\.?\d{0,2}')),
//                   ],
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter a price';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Expiry Date'),
//                 RaisedButton(
//                   onPressed: () async {
//                     final DateTime selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2100),
//                     );
//                     if (selectedDate != null) {
//                       setState(() {
//                         _expiryDate = selectedDate;
//                       });
//                     }
//                   },
//                   Text(
//                     _expiryDate == null
//                         ? 'Select Expiry Date'
//                         : DateFormat('yyyy-MM-dd').format(_expiryDate),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Options'),
//                 MultiSelectDialogField(
//                   buttonText: Text('Select Options'),
//                   items: _options
//                       .map((option) => MultiSelectItem<String>(option, option))
//                       .toList(),
//                   listType: MultiSelectListType.CHIP,
//                   onConfirm: (values) {
//                     setState(() {
//                       _selectedOptions = values;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 RaisedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       final User user = User(
//                         userID: _userIDController.text,
//                         userPassword: _userPasswordController.text,
//                         userName: _userNameController.text,
//                         buyingDate: _buyingDate,
//                         expiryDate: _expiryDate,
//                         price: double.parse(_priceController.text),
//                         options: _selectedOptions,
//                       );
//                       _insertUser(user);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('User added successfully')),
//                       );
//                       _formKey.currentState.reset();
//                       setState(() {
//                         _buyingDate = null;
//                         _expiryDate = null;
//                         _selectedOptions.clear();
//                       });
//                     }
//                   },
//                   child: Text('Add User'),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Users'),
//                 FutureBuilder<List<User>>(
//                   future: _getUsers(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       final List<User> users = snapshot.data;
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: users.length,
//                         itemBuilder: (context, index) {
//                           final user = users[index];
//                           return ListTile(
//                             title: Text(user.userName),
//                             subtitle: Text(user.userID),
//                             trailing: IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () {
//                                 _deleteUser(user.id);
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('User deleted')),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     } else {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class User {
//   final int id;
//   final String userID;
//   final String userPassword;
//   final String userName;
//   final DateTime buyingDate;
//   final DateTime expiryDate;
//   final double price;
//   final List<String> options;

//   User({
//     this.id,
//     this.userID,
//     this.userPassword,
//     this.userName,
//     this.buyingDate,
//     this.expiryDate,
//     this.price,
//     this.options,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'userID': userID,
//       'userPassword': userPassword,
//       'userName': userName,
//       'buyingDate': buyingDate.toIso8601String(),
//       'expiryDate': expiryDate.toIso8601String(),
//       'price': price,
//       'options': options.join(','),
//     };
//   }
// }
