import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;

  ShopItem({this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return IOSShopItem(
        imageUrl: imageUrl,
        title: title,
      );
    } else {
      return AndroidShopItem(
        imageUrl: imageUrl,
        title: title,
      );
    }
  }
}

class AndroidShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;

  AndroidShopItem({this.imageUrl, this.title});

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
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )
      ],
    );
  }
}


