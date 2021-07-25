import 'package:flutter/material.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool secured = true;

  SnackBar mySnackBar = SnackBar(
      duration: Duration(seconds: 8),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You have Successfully logged in !',
              style: TextStyle(fontSize: 18, color: Colors.limeAccent)),
        ],
      ));
  Future<void> openAlert() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login?!'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Are you sure you want to sign in?!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('name required');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  obscureText: secured,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          secured = !secured;
                        });
                      },
                      icon: Icon(
                        secured ? Icons.visibility_sharp : Icons.visibility_off,
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('password required');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    onPressed: () => openAlert(),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
