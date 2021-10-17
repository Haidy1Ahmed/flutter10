import 'package:final_project_flutter10/Login.dart';
import 'package:flutter/material.dart';
import 'Category.dart';
import 'Cart.dart';
import 'Login.dart';
import 'Home_Screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex=0;
  var myscreen=[Home_Screen(),Category(),Cart(),Login()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myscreen[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState((

              ) {
            myIndex=index;
          });
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label:'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label:'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label:'Account',
          ),

        ],),
    );
  }
}


