import 'package:final_project_flutter10/Class/Product.dart';
import 'package:final_project_flutter10/Component/Constant.dart';
import 'package:final_project_flutter10/Component/Custom_Container.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';
import 'Home.dart';
class Item_Screen extends StatefulWidget {
   Item_Screen({Key? key,this.detail}) : super(key: key);
Product? detail;
  @override
  _Item_ScreenState createState() => _Item_ScreenState();
}

class _Item_ScreenState extends State<Item_Screen> {
  double sum=0;
  double item_count=1;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
         
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network('${widget.detail!.image}',width: 500,height: 500,),
                  SizedBox(height: 20,),
                  Text('${widget.detail!.title}',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.none,),),
                  SizedBox(height: 5,),
                  Text('${widget.detail!.name}',style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                  SizedBox(height: 5,),
                  Divider(thickness: 4,color: Colors.black,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text((() {
                        if(sum==0){
                          return "${widget.detail!.price}";}

                        return "$sum";
                      })(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),

                      SizedBox(width:10),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          item_count++;
                          sum=widget.detail!.price*item_count;

                        });

                      },
                          child: Icon(Icons.add,color: Colors.white,),style: ElevatedButton.styleFrom(primary: Colors.pink)),

                      Text("$item_count",style: TextStyle(fontSize: 20,decoration: TextDecoration.none),),

                      ElevatedButton(onPressed: (){
                        setState(() {
                          if(item_count<=0)
                         sum;
                          else
                          {
                            item_count--;
                            sum=widget.detail!.price*item_count;}

                        });
                      }, child: Icon(Icons.remove,color: Colors.white,),style: ElevatedButton.styleFrom(primary: Colors.pink)),
                    ],
                  ),
                  Divider(thickness: 4,color: Colors.black,),
                  Flexible(child: Text('${widget.detail!.description}',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal,decoration: TextDecoration.none),)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return Home();
                              }));
                            },
                            child: Text('Back to Home', style: TextStyle(fontSize: 20,color: Colors.white)),
                            style: ElevatedButton.styleFrom(primary: Colors.pink) ,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              listofcart.add(widget.detail!);
                            },
                            child: Text('Add to Cart', style: TextStyle(fontSize: 20,color: Colors.white)),
                            style: ElevatedButton.styleFrom(primary: Colors.pink) ,
                          ),
                        ),
                      ],
                    ),
                  )
                ],),
            ),
          
    );
  }
}
