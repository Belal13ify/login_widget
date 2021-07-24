import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool secured = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    decoration:
                        kTextFieldDecoration.copyWith(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('name required');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 2,
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
                          secured
                              ? Icons.visibility_sharp
                              : Icons.visibility_off,
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
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
