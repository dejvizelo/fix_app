import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final int itemCount;

  ShopItem({this.imageUrl, this.title, this.itemCount});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return IOSShopItem(
        imageUrl: imageUrl,
        title: title,
        itemCount: itemCount,
      );
    } else {
      return AndroidShopItem(
        imageUrl: imageUrl,
        title: title,
        itemCount: itemCount,
      );
    }
  }
}

class AndroidShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final int itemCount;

  AndroidShopItem({this.imageUrl, this.title, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: (MediaQuery.of(context).size.width - 60) / 2,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  itemCount.toString() + ' produkte',
                  style: TextStyle(color: Colors.black38, fontSize: 13)
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

class IOSShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final int itemCount;

  IOSShopItem({this.imageUrl, this.title, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: (MediaQuery.of(context).size.width - 60) / 2,
          ),
        ),
        Container(height: 10),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          itemCount.toString() + ' produkte',
          style: TextStyle(color: Colors.black38, fontSize: 13),
        ),
      ],
    );
  }
}


