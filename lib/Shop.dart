import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/ShopItem.dart';
import 'dart:io' show Platform;

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_basket, color: Colors.black),
        title: Text('Shop', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        //childAspectRatio: Platform.isIOS ? 0.78 : 0.725,
        childAspectRatio: ((MediaQuery.of(context).size.width - 60) / 2) / (((MediaQuery.of(context).size.width - 60) / 2) + 63),
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          ShopItem(
            imageUrl: 'https://storage.googleapis.com/fix-company-b2b.appspot.com/images/categories/1595415896430-sallami-small.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=BOMPYDlJwEXarVsIaZ32iMQP34xji4lRc%2FDqAUXwLkiaF0MNZ9U%2BiZz0cyj%2BgFnAKNyg68svOJ%2F43TWj3KQ25wl2zdO%2F4zSgrWRG3lBlwAmYb%2F9DmP9ffVcrWI3ZkGcge7ajb2G3Z%2FVuJo9tYXyJMSyqDhytdMe7Q%2BJXM5A6Hd%2FqBvOxcY8WDP8iZQNbJ8Tfgpw0TkPnKCytzKviFgqsZQS8pzVr3MZ1PHLV9EfSAuCYe%2B8B8tpurqQaohL7fcckgnFmSPPk0eOQlUsOlFoawABO0Q4%2BZlbU4q38A4x3y5ufoj4Zd%2FVrGHgU9RKEfVB%2B%2F174KpIoqmgoXQg%2FpGsnWg%3D%3D',
            title: 'Sallame',
            itemCount: 10,
          ),
          ShopItem(
            imageUrl: 'https://storage.googleapis.com/fix-company-b2b.appspot.com/images/categories/1595415896663-gjysem-te-gatshme-small.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=gTYjMpJZx7FjPHrw1MZj%2FvZ1aOTB%2FiqlM%2BWrc6NAj5Cbxa5Q%2B3AqOWXSyhpKz97InSfVlCGhqqh263KvbzG5VrS9C%2BpsMnW%2B4N4%2BbIu4wOMAlu22I%2BgY%2FGbOunZ3PX28mqKbda5I54Ju8YVNXJu9RIwBkoPom6YzG%2FRLaPgGAtUv7fa9FFUIjYgMcAN%2Ffv%2BZUPoLRF54J%2BaSQinGDx9GFqTLfB%2BcU93X%2BTwHIJoW2CgfMYOxWm1y2NSpyaZIu5HjJlYmgZ3Smj8%2F517aMd1P6K%2Fo5Fqmtbv45VeUp8eNew4znjAnOaNviOTBMqOKAhHFo7WgilMWRZ19609ZdNOvOw%3D%3D',
            title: 'Grill & Barbeque',
            itemCount: 10,
          ),
          ShopItem(
            imageUrl: 'https://storage.googleapis.com/fix-company-b2b.appspot.com/images/categories/1595415896663-proshuta-small.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=a8QQWo9K5mKjRCFBGpJYzB940Ev7bVxxOHrrjMdVH7hrwdYb54vEb8%2FfOFQnQnJkajZGtXzin8ZwCTDllHFgj7lQYRS7iKMCPs6G%2BfaC3wnsrVKB3Q07ZlRCuj2fkqagINVhz1UI9Udq%2FxDsIvFZPaaya5VlJ1AmQMjtNprUTCsTbvDGJTNVMyn96IthfJqqVqDOo5worUQB7tIcFOdP8iwV7rKRJ7GjziGj4Uz6hn4fKH8%2BpgXe10S5n35YPhqVUuWG3PrLzsflw6vSadBDHYV%2F2GJA8D3xBQIVLiTtT%2FIB%2Bx0RsGLrEOjPNY%2B9vNLFriiVM4BIBtnMQuYfDIdTdw%3D%3D',
            title: 'Proshuta',
            itemCount: 10,
          ),
          ShopItem(
            imageUrl: 'https://storage.googleapis.com/fix-company-b2b.appspot.com/images/categories/1595415896663-proshuta-small.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=a8QQWo9K5mKjRCFBGpJYzB940Ev7bVxxOHrrjMdVH7hrwdYb54vEb8%2FfOFQnQnJkajZGtXzin8ZwCTDllHFgj7lQYRS7iKMCPs6G%2BfaC3wnsrVKB3Q07ZlRCuj2fkqagINVhz1UI9Udq%2FxDsIvFZPaaya5VlJ1AmQMjtNprUTCsTbvDGJTNVMyn96IthfJqqVqDOo5worUQB7tIcFOdP8iwV7rKRJ7GjziGj4Uz6hn4fKH8%2BpgXe10S5n35YPhqVUuWG3PrLzsflw6vSadBDHYV%2F2GJA8D3xBQIVLiTtT%2FIB%2Bx0RsGLrEOjPNY%2B9vNLFriiVM4BIBtnMQuYfDIdTdw%3D%3D',
            title: 'Salçiçe',
            itemCount: 10,
          ),
          ShopItem(
            imageUrl: 'https://storage.googleapis.com/fix-company-b2b.appspot.com/images/categories/1595415896664-parizier-small.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=jMPdjcP2j9OxYS%2B8Yfz6gOHyamLeFaSkMv4KTjZrxbmZ4ZCIlp0HmUk38MfCS1sdkmS6DQBFVo8T89aVHpNtaHNSdAtuGFm3N4IMySTt83jc%2BO6KwV%2FtSdA1RN9tIpjiIUpHvPYbDqzYe%2FbhDMEwWHGc37WYX3d1XIiJztd5gTMlo6mHMUguCihh16D2IMIvo8mQsdMSK%2B3RPrPtl9Dk3SXoHh%2FkZW%2F1j9cOA%2FrloSSg92RJCOQk6ujfa1Yr%2Fa5kO2g%2BxphFSUNgnVudW2OjYy%2B2vQ7ppL3uCp3mONVdrvLAQAu8omTb7GgDBiO25pPPMYqVJbkRKnagza9U0TM0Kg%3D%3D',
            title: 'Parizier',
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
