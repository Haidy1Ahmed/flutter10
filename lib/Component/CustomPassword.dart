import 'package:flutter/material.dart';
class CustomPassword extends StatefulWidget {
  @override
  String password;
  final passwordcontroller;

  CustomPassword(this.password, this.passwordcontroller);
  @override
  _CustomPasswordState createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  @override
  String password = '';

  bool PasswordVisible = false;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty)
              return ("please enter your E-mail");
            else if (value.length < 8)
              return ("password is not correct ");
          },
          onChanged: (value) {
            setState(() {
              this.password = value;
            });
          },
          onFieldSubmitted: (value) {
            setState(() {
              this.password = value;
            });
          },
          obscureText: PasswordVisible,
          controller: widget.passwordcontroller,

          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(20))),

            suffixIcon: IconButton(
              icon: PasswordVisible
                  ? Icon(Icons.visibility_off) :
              Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  PasswordVisible = !PasswordVisible;
                });
              },
            ),
            labelText: widget.password,
          ),
        ),
      ),
    );
  }
}
