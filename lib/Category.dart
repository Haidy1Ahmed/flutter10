import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'Class/CategoryModel.dart';
import 'package:final_project_flutter10/Component/Container_Category.dart';
class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var ListofCategory = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(

          child: FutureBuilder(
              future: getCategory(),
              builder: (context, snapshot) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20
                  ),
                  itemBuilder: (context, index) {
                    return Container_Category(
                      id: ListofCategory[index].id,
                      category: ListofCategory[index].Name,
                      images: ListofCategory[index].Avatar,
                    );
                  },
                  itemCount:6,
                );
              })
      ),
    );
  }

  @override
  void initState() {
    getCategory();
  }

  Future<dynamic> getCategory() async {
    final response = await http
        .get(Uri.parse('http://retail.amit-learning.com/api/categories'));

    if (response.statusCode == 200) {

      var listofMapsCategory =
      jsonDecode(response.body)['categories'];
      print(jsonDecode(response.body)['categories']);

      for (var n in listofMapsCategory) {
        ListofCategory.add(CategoryModel.fromJson(n));
      }
      for (var m in ListofCategory) {}
    }

  }
}