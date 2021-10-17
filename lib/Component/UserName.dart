import 'package:flutter/material.dart';
class UserName extends StatefulWidget {
  UserName(this.email,this.namecontroller);

  String email;
  final namecontroller;

  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {


  @override
  void initState() {
    super.initState();
    widget.namecontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: widget.namecontroller,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty)
                return ("please enter your name");
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(20))),

              suffixIcon: widget.namecontroller.text.isEmpty
                  ? Container(
                width: 0,
              )
                  :

//                email_controler.text.isEmpty           using to hidden close icon from text field
//                ? Container(width:0):

              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  widget.namecontroller.clear();
                },
              ),
              labelText: widget.email,
            ),
          ),
        ));
  }
}