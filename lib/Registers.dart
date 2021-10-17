import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Component/CustomEmail.dart';
import 'Login.dart';
import 'Component/UserName.dart';
import 'Component/CustomPassword.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TextEditingController password;
    TextEditingController email;
    TextEditingController name;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:2,
                      child: Image.network(
                        "https://www.amit-learning.com/assets/logo.png",width: 200,height: 200,),
                    ) ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UserName("name", name = TextEditingController())),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomEmail(
                          "E-mail", email = TextEditingController()),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPassword(
                            "password", password = TextEditingController())),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
//                      onPrimary: Colors.yellow, // foreground
                        ),
                        onPressed: () {
                          print(name.text);
                          print(email.text);
                          print(password.text);
                          register(name.text, email.text, password.text);
                          setState(() {
                            if (_formkey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("prossing data")));
                            }
                          });
                        },
                        child: Text("Login")),
                    SizedBox(
                      height: 10,
                    ),

                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext) {
                                return Login();
                              }));
                        },
                        child: Text(
                          "Have an account? Go login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

register(String name, String email, String password) async {
  BuildContext context;

  final response = await http.post(
    Uri.parse('https://retail.amit-learning.com/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {


    print("user registered successfully");
    print(jsonDecode(response.body)['token']);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create account.');
  }
}
