import 'package:e_commerce_exam/Application/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../List.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            title: Text(
              'Healthy Life',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            actions: [
              Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Wrap(
                    children: [
                      ...List.generate(
                        ProductList.length,
                            (index) => GestureDetector(
                          onTap: () {
                            selectIndex = index;
                            Navigator.pushNamed(context, '/detail');
                          },
                          child: ProductsDetail(
                              Name: ProductList[index]['Name'],
                              Price: ProductList[index]['Price'],
                              img: ProductList[index]['img'],
                              des: ProductList[index]['des']),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget ProductsDetail(
      {required String Name,
        required int Price,
        required String img,
        required String des}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 250,
        width: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            Container(
              height: 150,
              width: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(img),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    overflow: TextOverflow.clip,
                    Name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                Text(
                  '\$'+Price.toString(),
                  style: TextStyle(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
