import 'package:flutter/material.dart';

class CustomEmail extends StatefulWidget {
  CustomEmail(this.email,this.emailcontroller);

  String email;
  final emailcontroller;



  @override
  _CustomEmailState createState() => _CustomEmailState();
}

class _CustomEmailState extends State<CustomEmail> {
  void initState(){
    super.initState();
    widget.emailcontroller.addListener(() {setState(() {

    });});
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

              controller: widget.emailcontroller,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return ("please enter your Email");
                else if (!value.contains("@"))
                  return ("Email is incorrect ");
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(20))),

                suffixIcon:widget.emailcontroller.text.isEmpty
                    ? Container(width: 0,):



                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    widget.emailcontroller.clear();
                  },
                ),
                labelText: widget.email,
              ),
            )
        ) );
  }
}
