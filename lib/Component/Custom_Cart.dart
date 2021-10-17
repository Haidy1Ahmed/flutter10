import 'package:final_project_flutter10/Class/Product.dart';
import 'package:flutter/material.dart';
import 'package:final_project_flutter10/Component/Constant.dart';
class Custom_Cart extends StatefulWidget {

  Custom_Cart({required this.a,this.iD=5,this.images='https://m.media-amazon.com/images/I/61FjYLvjasL._AC_SY355_.jpg',this.title='Title', this.description='description', this.price=2.0});
  String images;
  String title;
  String description;
  double price;
  int iD;

  int a;
  @override
  _Custom_CartState createState() => _Custom_CartState();
}

class _Custom_CartState extends State<Custom_Cart> {
double sum=0;
double item_count=0;


  @override
  Widget  build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 10,),
          Image.network('${listofcart[widget.a].image}',width: 200,height: 200,),
          SizedBox(width: 20,),
          Column(
            children: [
              Text('${listofcart[widget.a].title}',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.none),maxLines: 1,),
              SizedBox(height:10),
              Text('${listofcart[widget.a].name}',style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.normal,decoration: TextDecoration.none),maxLines: 1,),
              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text('${sum} EGP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                  SizedBox(width:10),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      item_count++;
                      sum=listofcart[widget.a].price*item_count;
                      print('increment $item_count');
                    });

                    },
                      child: Icon(Icons.add,color: Colors.white,),style: ElevatedButton.styleFrom(primary: Colors.pink)),
                  Text("$item_count",style: TextStyle(fontSize: 20),),

                  ElevatedButton(onPressed: (){
                    setState(() {
                      item_count--;
                      sum=listofcart[widget.a].price*item_count;
                      print('decrement $item_count');
                    });
                  }, child: Icon(Icons.remove,color: Colors.white,),style: ElevatedButton.styleFrom(primary: Colors.pink)),
                ],
              ),

            ],
            
          )
        ],
      ),

    );
  }
}
