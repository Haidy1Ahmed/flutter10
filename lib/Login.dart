import 'dart:convert';
import 'package:final_project_flutter10/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Component/CustomEmail.dart';
import 'Component/UserName.dart';
import 'Component/CustomPassword.dart';
import 'Registers.dart';

class Login extends StatelessWidget {
  @override
  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TextEditingController password;
    TextEditingController email;
    return Scaffold(
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.network(
                            'https://www.amit-learning.com/assets/logo.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),

                    ],
                  )),
              Expanded(
                  child: Column(
                    children: [
                      CustomEmail("Email",email=TextEditingController()),
                      CustomPassword("password",password=TextEditingController()),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(

                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red, // background
//                            onPrimary: Colors.yellow, // foreground
                                  ),
                                  onPressed: () {
                                    login(email.text, password.text);

                                    if (_formkey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text("prossing data")));
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (BuildContext) {
                                            return Home();
                                          }));
                                    }
                                  },
                                  child: Text("Login")),
                              SizedBox(width: 20),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext) {
                                      return Register();
                                    }));
                              },
                              child: Text("Go SignUp",
                                style: TextStyle(
                                    color: Colors.black),
                              ))
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

login(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://retail.amit-learning.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{

      'email': email,
      'password': password,

    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("user logged in successfully");
    print(jsonDecode(response.body)['token']);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
//    print(jsonDecode(response.body));

    throw Exception('Failed to login ');
  }
}
