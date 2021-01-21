import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/ShopItem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;

import 'Category.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getValues() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_basket, color: Colors.black),
        title: Text('Shop', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: getValues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // childAspectRatio: Platform.isIOS ? 0.78 : 0.725,
                  childAspectRatio: ((MediaQuery.of(context).size.width - 60) / 2) / (((MediaQuery.of(context).size.width - 60) / 2) + 46),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2
              ),
              itemBuilder: (BuildContext context, int index) {
                return ShopItem(
                  imageUrl: snapshot.data[index]["image"],
                  title: snapshot.data[index]["name"],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Category(
                      category: snapshot.data[index]["name"],
                      imageUrl: snapshot.data[index]["image"],
                    )));
                    // heq bottom bar kur ben push
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("There was en error."),
            );
          } else {
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
                width: 60,
                height: 60,
              ),
            );
          }
        },
      ),
    );
  }
}
