import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/ShopItem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  @override
  void initState() {
    super.initState();
    getValues();
}

  void getValues() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .get();
    print("values: ${querySnapshot.docs}" );
  }

  @override
  Widget build(BuildContext context) {
    List categories;
    // FirebaseFirestore.instance
    //     .collection('categories')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) => {
    //         querySnapshot.docs.forEach((doc) {
    //           print(doc["id"]);
    //       })
    //   });

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_basket, color: Colors.black),
        title: Text('Shop', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // childAspectRatio: Platform.isIOS ? 0.78 : 0.725,
          childAspectRatio: ((MediaQuery.of(context).size.width - 60) / 2) / (((MediaQuery.of(context).size.width - 60) / 2) + 50),
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          crossAxisCount: 2
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(

          );
        },
      ),
    );
  }
}
