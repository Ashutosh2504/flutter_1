import 'package:flutter/material.dart';
import 'package:flutter_1/util/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              // creates empty box of specified height and we can add child also in it.
              height: 20,
            ),
            Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              // creates empty box of specified height and we can add child also in it.
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        label: Text("Username"),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        label: Text("Password"),
                      ),
                    ),
                    SizedBox(
                      // creates empty box of specified height and we can add child also in it.
                      height: 40,
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
