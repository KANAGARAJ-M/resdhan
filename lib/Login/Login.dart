// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../Screens/Home.dart';

// class AuthWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         if (snapshot.hasData) {
//           return MHomePage();
//         }
//         return AuthPage();
//       },
//     );
//   }
// }

// class AuthPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[400],
//         title: Center(
//             child: Text(
//           // 'Sign In/Sign Up',
//           'ResDhan',
//           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
//         )),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Sign In / Sign Up",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 6,
//             ),
//             Text(
//               "Already Have an Account. Sign In Now",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//               child: Text(
//                 'Sign In',
//                 style: TextStyle(color: Colors.green, fontSize: 20),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Don't Have an Account. Please Sign Up",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterPage()),
//                 );
//               },
//               child: Text(
//                 'Sign Up',
//                 style: TextStyle(color: Colors.red, fontSize: 20),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 12,
//             ),
//             Container(
//               alignment: Alignment.bottomCenter,
//               height: 90,
//               // color: Colors.black,
//               width: 165,
//               child: Image.asset(
//                 'assets/kaizen_logo/kaizen_transparent.png',
//                 // color: Colors.white,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool passwordVisible = true;

//   void _login(BuildContext context) async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       print('User logged in: ${userCredential.user!.uid}');
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MHomePage()),
//       );
//     } catch (e) {
//       print('Failed to log in: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 144, 202, 249),
//       appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 66, 165, 245),
//           title: Center(
//             child: Text(
//               'Sign In',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 30,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           )),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               // alignment: Alignment.bottomCenter,
//               height: 90,
//               // color: Colors.black,
//               width: 165,
//               child: Image.asset(
//                 'assets/kaizen_logo/kaizen_transparent.png',
//                 // color: Colors.white,
//               ),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.email),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _passwordController,
//               obscureText: passwordVisible,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 suffixIcon: Icon(Icons.password),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () => _login(context),
//               child: Text(
//                 'Sign In',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 23,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   String _errorText = '';
//   bool passwordVisible = true;
//   TextEditingController conpasswordController = TextEditingController();
//   bool conpasswordVisible = true;

//   void _register(BuildContext context) async {
//     try {
//       bool isUsernameTaken = await _isUsernameTaken(_usernameController.text);
//       if (isUsernameTaken) {
//         setState(() {
//           _errorText = 'Username is already taken or go to login';
//         });
//         return;
//       }

//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );

//       String userId = userCredential.user!.uid;
//       await FirebaseFirestore.instance.collection('users').doc(userId).set({
//         'email': _emailController.text,
//         'username': _usernameController.text,
//       });

//       print('User registered: $userId');
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     } catch (e) {
//       print('Failed to register: $e');
//     }
//   }

//   Future<bool> _isUsernameTaken(String username) async {
//     final QuerySnapshot result = await FirebaseFirestore.instance
//         .collection('users')
//         .where('username', isEqualTo: username)
//         .get();
//     final List<DocumentSnapshot> documents = result.docs;
//     return documents.isNotEmpty;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[400],
//         title: Center(
//           child: Text(
//             'Sign Up',
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.supervised_user_circle_outlined),
//                 labelText: 'Username',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.email),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _passwordController,
//               obscureText: passwordVisible,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.password),
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       passwordVisible = !passwordVisible;
//                     });
//                   },
//                   icon: Icon(passwordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: conpasswordController,
//               obscureText: conpasswordVisible,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.password),
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       conpasswordVisible = !conpasswordVisible;
//                     });
//                   },
//                   icon: Icon(conpasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off),
//                 ),
//                 labelText: 'Confirm Password',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             if (_errorText.isNotEmpty)
//               Text(
//                 _errorText,
//                 style: TextStyle(color: Colors.red),
//               ),
//             ElevatedButton(
//               onPressed: () => _register(context),
//               child: Text(
//                 'Sign Up',
//                 style: TextStyle(color: Colors.red, fontSize: 23),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Screens/Home.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          return MHomePage();
        }
        return AuthPage();
      },
    );
  }
}

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Center(
            child: Text(
          // 'Sign In/Sign Up',
          'ResDhan',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In / Sign Up",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              "Already Have an Account. Sign In Now",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Don't Have an Account. Please Sign Up",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 90,
              // color: Colors.black,
              width: 165,
              child: Image.asset(
                'assets/kaizen_logo/kaizen_transparent.png',
                // color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;

  void _login(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (!_validateEmail(email)) {
      _showErrorDialog(context, 'Invalid email. Use @gmail.com or @email.com');
      return;
    }

    if (!_validatePassword(password)) {
      _showErrorDialog(context, 'Password must be at least 6 characters long');
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user!.uid}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MHomePage()),
      );
    } catch (e) {
      // _showErrorDialog(context, 'Failed to log in: $e');
      _showErrorDialog(context,
          'Failed to Sign In.\nPlease check your email and password you entered correctly.\nIf you are new to this app please SignUp Now');
    }
  }

  bool _validateEmail(String email) {
    return email.endsWith('@gmail.com') || email.endsWith('@email.com');
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(
              color: Colors.red[400],
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: Colors.black87,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK!'),
              
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 202, 249),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 66, 165, 245),
          title: Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // alignment: Alignment.bottomCenter,
              height: 90,
              // color: Colors.black,
              width: 165,
              child: Image.asset(
                'assets/kaizen_logo/kaizen_transparent.png',
                // color: Colors.white,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String _errorText = '';
  bool passwordVisible = true;
  TextEditingController conpasswordController = TextEditingController();
  bool conpasswordVisible = true;

  void _register(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (!_validateEmail(email)) {
      setState(() {
        _errorText = 'Invalid email. Use @gmail.com or @email.com';
      });
      return;
    }

    if (!_validatePassword(password)) {
      setState(() {
        _errorText =
            'Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character';
      });
      return;
    }

    if (password != conpasswordController.text) {
      setState(() {
        _errorText = 'Passwords do not match';
      });
      return;
    }

    if (await _isUsernameTaken(_usernameController.text)) {
      setState(() {
        _errorText =
            'Username is already taken. Please choose another username';
      });
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'email': email,
        'username': _usernameController.text,
      });

      print('User registered: $userId');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MHomePage()),
      );
    } catch (e) {
      print('Failed to register: $e');
      setState(() {
        _errorText = 'Failed to register: $e';
      });
    }
  }

  bool _validateEmail(String email) {
    return email.endsWith('@gmail.com') || email.endsWith('@email.com');
  }

  bool _validatePassword(String password) {
    final regex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return regex.hasMatch(password);
  }

  Future<bool> _isUsernameTaken(String username) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: conpasswordController,
              obscureText: conpasswordVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      conpasswordVisible = !conpasswordVisible;
                    });
                  },
                  icon: Icon(conpasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (_errorText.isNotEmpty)
              Text(
                _errorText,
                style: TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.red, fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
