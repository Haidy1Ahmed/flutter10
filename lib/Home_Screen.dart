
import 'dart:convert';
import 'package:final_project_flutter10/Class/Product.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart'as http;
import 'package:final_project_flutter10/Component/Custom_Container.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var ListofProduct= [];

  @override
  Widget build(BuildContext context) {
    return Center(

        child:FutureBuilder(
            future: getProduct(),
            builder: (context,snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,

                ),
                itemBuilder: (context,index){
                  return CustomContiner(
                    detail:ListofProduct[index] ,
                      name: ListofProduct[index].name,
                      price: ListofProduct[index].price,
                      images: ListofProduct[index].image,
                    title: ListofProduct[index].title,
                    description: ListofProduct[index].description,
                  );
                },
                itemCount: ListofProduct.length,
              );
            })
    );
  }

  @override
  void initState() {
    getProduct();
  }
  Future<dynamic>getProduct() async {


    var response = await http.get(
        Uri.parse('http://retail.amit-learning.com/api/products'));
    if (response.statusCode == 200) {
      print("Suess");

      var listofMapsProducts = jsonDecode(response.body)['products'];
      print('length of list of product :${ListofProduct.length}');
      for (var n in listofMapsProducts) {
        ListofProduct.add(Product.fromJson(n));
      }
      for (var m in ListofProduct) {}
    }
  }
}


