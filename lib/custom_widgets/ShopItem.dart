import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final double price;
  final Function onTap;

  ShopItem({this.imageUrl, this.title, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    //wrap in GestureDetector, pass onTap
    //check price null
    if (Platform.isIOS) {
      return IOSShopItem(
        imageUrl: imageUrl,
        title: title,
        price: price,
        onTap: onTap,
      );
    } else {
      return AndroidShopItem(
        imageUrl: imageUrl,
        title: title,
        price: price,
        onTap: onTap,
      );
    }
  }
}

class AndroidShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final double price;
  final Function onTap;

  AndroidShopItem({this.imageUrl, this.title, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
              child: this.price == null
                ? Text(
                    title,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  )
                : Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        price.toString(),
                        style: TextStyle(color: Colors.black12, fontSize: 13)
                      )
                    ],
                  )
            )
          ],
        ),
      ),
    );
  }
}

class IOSShopItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final double price;
  final Function onTap;

  IOSShopItem({this.imageUrl, this.title, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
            padding: const EdgeInsets.symmetric(vertical: 10),
              child: this.price == null
                  ? Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
              )
                  : Column(
                children: [
                  Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                  ),
                  Text(
                      price.toString(),
                      style: TextStyle(color: Colors.black12, fontSize: 13)
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}


