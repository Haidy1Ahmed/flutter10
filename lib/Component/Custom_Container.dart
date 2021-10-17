import 'package:final_project_flutter10/Class/Product.dart';
import 'package:final_project_flutter10/Item_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';
class CustomContiner extends StatefulWidget {
  CustomContiner({this.name='name',this.detail,this.images='https://cdn.cliqueinc.com/posts/295272/new-york-fashion-week-spring-summer-2022-295272-1631825649004-main.700x0c.jpg',this.title='title',this.description='description',this.price=200}) ;
  String images;
  String title;
  dynamic description;
  int price;
  Product? detail;
  String name;

  @override
  _CustomContinerState createState() => _CustomContinerState();
}

class _CustomContinerState extends State<CustomContiner> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Item_Screen(detail:widget.detail ,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(

          //alignment: Alignment.center,
          //  margin:EdgeInsets.all(5.0),
            color: Colors.white,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex: 3,
                    child:
                    Image.network("${widget.images}")
                ),

                Text('${widget.title}',style:TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 15 ) ,),
                Text('${widget.name}',style:TextStyle(color: Colors.grey,fontSize: 10),maxLines: 1,),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox( width: 50,
                        height: 20,
                        child:
                        ElevatedButton(onPressed: (){
                          listofcart.add(widget.detail!);
                        },
                            child:Icon(Icons.add,color: Colors.white,),style : ElevatedButton.styleFrom(primary: Colors.pink,) )),

                    Text('${widget.price} EGP',style:TextStyle(color: Colors.pinkAccent,fontWeight:FontWeight.bold,fontSize:20 ),),

                  ],
                ),
              ],
            )
        ),
      ),
    );
  }}