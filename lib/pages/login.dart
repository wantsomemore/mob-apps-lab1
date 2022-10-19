import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userName = '';

  void handleUserForm(value) {
    setState(() {
      userName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                  onChanged: (value) {
                    handleUserForm(value);
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              color: Colors.black,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard',
                      arguments: {"userName": userName});
                },
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
