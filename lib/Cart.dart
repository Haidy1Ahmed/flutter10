import 'dart:convert';
import 'package:final_project_flutter10/Class/Product.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart'as http;
import 'package:final_project_flutter10/Component/Custom_Container.dart';
import 'package:final_project_flutter10/Component/Constant.dart';

import 'Component/Custom_Cart.dart';

class Cart extends StatefulWidget {
   Cart({Key? key,}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {


  @override
  Widget build(BuildContext context) {
    return Center(


              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Custom_Cart(
                    a: index,
                  );
                },
                itemCount: listofcart.length,

              )

    );
  }

}