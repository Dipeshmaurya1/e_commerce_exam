import 'package:e_commerce_exam/Application/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_exam/List.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              'Cart'
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CartScreenUDF(index),
            ],
          ),
        ),
      ),
    );
  }

  Container CartScreenUDF(int index) {
    return Container(
      height: 170,
      width: 345,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.cyan
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 160,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Cartlist[index]['img']),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text(Cartlist[index]['Name'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
              Text('\$'+Cartlist[index]['Price'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

            ],
          )
        ],
      ),
    );
  }
}
//Name: ProductList[index]['Name'], Price: ProductList[index]['Price'], img: ProductList[index]['img']
//,{required String Name, required int Price, required String img}