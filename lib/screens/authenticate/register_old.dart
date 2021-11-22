// import 'package:flutter/material.dart';
// import 'package:meditationapp/services/auth.dart';
//
//
// class Register extends StatefulWidget {
//
//   final Function toggleView;
//   Register({ required this.toggleView });
//
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//
//   final AuthService _auth = AuthService();
//   final _formkey = GlobalKey<FormState>();
//
//   String email = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Register"),
//         backgroundColor: Colors.deepPurple,
//       ),
//
//       body: SingleChildScrollView(
//         child: Form(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     child: Image.asset('assets/images/meditationlogo.jpg')),
//               ),
//             ),
//
//             Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextFormField(
//                   key: _formkey,
//                 validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     email = val;
//                   });
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText: 'Enter valid email'),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextFormField(
//                   key: _formkey,
//                 validator: (val) => val!.length < 6 ? 'Enter a Password 6+ Chars long' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     password = val;
//                   });
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter password'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//             ),
//
//
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.deepPurpleAccent,
//                   borderRadius: BorderRadius.circular(20)),
//               child: TextButton(
//                 onPressed: () async {
//                   if (_formkey.currentState!.validate()) {
//
//                   }
//                 },
//                 child: Text(
//                   'Register',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//             ),
//
//           ],
//         ),
//       ),
//     ),
//     );
//   }
// }
