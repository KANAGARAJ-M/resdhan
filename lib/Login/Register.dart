// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _usernameOrEmailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   void _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         final String usernameOrEmail = _usernameOrEmailController.text.trim();
//         final String password = _passwordController.text;
//         UserCredential userCredential;
//         // Check if the input is an email
//         if (usernameOrEmail.contains('@')) {
//           userCredential =
//               await FirebaseAuth.instance.signInWithEmailAndPassword(
//             email: usernameOrEmail,
//             password: password,
//           );
//         } else {
//           // If not an email, assume it's a username
//           // Here you would implement your own logic to fetch the user's email using their username
//           // For demonstration, let's just pretend we have a function `getUserEmailByUsername` that returns the email associated with the username
//           final String email = await getUserEmailByUsername(usernameOrEmail);
//           userCredential =
//               await FirebaseAuth.instance.signInWithEmailAndPassword(
//             email: email,
//             password: password,
//           );
//         }
//         if (userCredential != null) {
//           // Login successful
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Login successful'),
//             ),
//           );
//           // Navigate to the next screen or perform any other action
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: $e'),
//           ),
//         );
//       }
//     }
//   }

//   // Function to get user's email by username
//   Future<String> getUserEmailByUsername(String username) async {
//     // Replace this with your own logic to fetch user email from username
//     // For demo purpose, return a hardcoded email
//     return "user@example.com";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _usernameOrEmailController,
//                 decoration: InputDecoration(labelText: 'Username or Email'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a username or email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//                 obscureText: true,
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();

//   void _register() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await FirebaseAuth.instance.sendSignInLinkToEmail(
//           email: _emailController.text,
//           actionCodeSettings: ActionCodeSettings(
//             url: "https://shareearn.page.link/gnpR",
//             handleCodeInApp: true,
//           ),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Verification email sent. Please check your inbox.'),
//           ),
//         );
//       } catch (e) {
//         print('$e');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: $e'),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a username';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter an email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _register,
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }