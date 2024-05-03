// import 'dart:html';
// import 'dart:ui';

import 'package:e_commerce_exam/Application/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_exam/List.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            centerTitle: true,
            title: Text(
                'Detail'
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DetailScreen(
                    Name: ProductList[selectIndex]['Name'],
                    Price: ProductList[selectIndex]['Price'],
                    img: ProductList[selectIndex]['img'],
                    des: ProductList[selectIndex]['des']),
              ],
            ),
          ),
        ));
  }

  Widget DetailScreen(
      {required String Name,
        required int Price,
        required String img,
        required String des}) {
    return Column(
      children: [
        Container(
          height: 270,
          width: 410,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
              )),
        ),
        Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  Name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$'+Price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(width: 320, child: Text(des))
              ],
            )),
        GestureDetector(
          onTap: () {
            bool Status = false;
            int index=0;

            for(int i=0; i<Cartlist.length; i++)
            {
              if(Cartlist[i]['Price']==ProductList[selectIndex]['price'])
              {
                index=i;
                Status = true;
              }
            }
            if(Status)
            {
              Cartlist[index]['qty']++;
            }
            else
            {
              Cartlist.add(ProductList[selectIndex]);
            }

            Navigator.pushNamed(context, '/cart');

          },
          child: Container(
            height: 100,
            width: 400,
            decoration
                : BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart,color: Colors.black,size: 25,),
                Text('Add To Cart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
