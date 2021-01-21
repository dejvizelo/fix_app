import 'package:fix_app/custom_widgets/ShopItem.dart';
import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/my_flexible_space_bar.dart';

class Category extends StatefulWidget {

  final String category;
  final String imageUrl;

  Category({this.category, this.imageUrl});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {Navigator.pop(context);},
            ),
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: MyFlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(this.widget.category),
                  GestureDetector(
                      onTap: () {print("Touched");},
                      child: Text("Filtro", style: TextStyle(color: Colors.deepOrange, fontSize: 11))
                  )
                ],
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    this.widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5)
                    ),
                  )
                ],
              ),
              collapseMode: CollapseMode.pin,
              titlePaddingTween: EdgeInsetsTween(
                  begin: EdgeInsets.only(left: 20.0, bottom: 16, right: 10),
                  end: EdgeInsets.only(left: 60.0, bottom: 16, right: 10)
              ),
              foreground: Container(), //needed for MyFlexibleSpaceBar
            ),
            backgroundColor: Colors.black,
            floating: true,
            pinned: true,
            snap: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: ((MediaQuery.of(context).size.width - 60) / 2) / (((MediaQuery.of(context).size.width - 60) / 2) + 46),
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                crossAxisCount: 2
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      switch (this.widget.category) {
                        case "Grill & barbeque":
                          return ShopItem(
                            imageUrl: "https://storage.googleapis.com/fix-company-b2b.appspot.com/images/products/1595415940417-Bratwurst.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=ifvkgsw5xIbgfPYTSLNPGz3iY52N%2BuOiQlUSR4xScY%2BYDI7fDgc%2FNmqX%2BtFm4AOQzh7fYSFWJWAZy9%2FiUfG4qZVfZRXZvdZ5GFXPLQNntt%2B%2FqhHUyuq1W89kDCC7Z02HiRnvAWisgIFaYJgVNfBATwrgPwZkfMIKDJ4SeeT2mxRCkTIyiBNTulF43Yha%2FT9UkoFA%2BE81sDiSQqJtuzTf948m327BF%2F%2FBynFgJaP8XyLt4mFQd1q0G3v8wLcS5AcBIBPmEISmut1ICkvHX5xn0EVL1koRarmqx4izVoJu3W0iw3dveI1lIgU%2FHSi%2BSwXAZ%2FEca%2FbxiATGOT4gQ1%2F56Q%3D%3D",
                            title: "Bratwurst",
                          );
                          break;
                        case "Parizer":
                          return ShopItem(
                            imageUrl: "https://storage.googleapis.com/fix-company-b2b.appspot.com/images/products/1595415940422-parier1rrumbullaket.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=ZYZhlDrqFXMVwHWPgt1ujrV8AWhvmLKJCkP99NP7dCi%2FiWYHE%2BBgApGDF2NcwjkroYALXc%2BqCG1IWohD1aYJVp6e5suxTbAZxS%2Fr2FobuGUK5C7g6ckb%2BpLX%2FAnuH%2BhyuiriGcvfhLkZBR9jz9SJk6qrcBkmsOYotKUylQvK4UPOKWYpM1dUFmrDOsbIYvrRsaoSf5xUDwOOjS2OaLNeCnaA6kLZXtpk6JNMdS7%2BbL1DPup%2FH4SZfov%2FPQXEH8pUfjKPTCe5pZGAOqgjrVvn03jIe%2BDZCjDm3yoI6K7Zo0Ys9QbSw%2FJ5v2bPiRQMFBmfYXDsYNZks07CIMX78H3G2Q%3D%3D",
                            title: "Parizier 1 (rrumbullake)",
                          );
                          break;
                        case "Proshuta":
                          return ShopItem(
                            imageUrl: "https://storage.googleapis.com/fix-company-b2b.appspot.com/images/products/1595415940419-ProshutePule.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=ejqaYUb6%2Fe88v8Jt7AsYi0qtIPsfVn8v0QyBU1eND%2BS2N9ooke8BzJvVP1%2F8OSNpZ443gg3ceq63Nz26jttV33iqzdxGItGEUNy3426IdbKVmdiPChsLJ28UiGjN6g252H95VkkEfVb70JTu1s%2FJjcAs7anVx0IyhsJwzXl9jwKMLApckrM3kE2dA%2Fp5bcS8X3LNTXk%2FkG3shytIor7c41dzWE9jrTlw5BE1Rl5NBNXMDPGJ0J4jmetO2Di9dCsJIUdBuyyGIUfsIDwpM979djr9EiuCUxwL%2BxBYb3xRQPrTiFX6va760X2FEfNgUxQvZTZcJ7Jpa2Pt97PgKvg4sQ%3D%3D",
                            title: "Proshute  pule e  tymosur",
                          );
                          break;
                        case "Salçiçe":
                          return ShopItem(
                            imageUrl: "https://storage.googleapis.com/fix-company-b2b.appspot.com/images/products/1595415940421-salcicePule.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=DsGI%2BljXDI3H2p7Rqucs%2Fk%2FYlV9lzG4YwWWmTi4THgSpsRpVr1zljlj2XG3n5dd8gZXJ9pj0nbYy0RXIScI7A443X7FxDJ8wwuTbNV6OKHHo6lnh9PrA3IezBVejvsn2jVaW51qz%2Fxz0syRlRUO4K954GSmqHv1XHanf%2B2ae9GQ2lo7vIlZNkVfi1X1tInhp%2BLb%2BEZXx3gUyEKPqA54aKhJwxWRGbEeiKfVTopmSUB8MmRrsqD7hyZEaBBhhZVA65MrmH2tudq%2F4CstX7nBU%2FpgjnkB9itEdQqlp2SYw492EadOr6DDudYIaDJfqa3s4PExZQ8eoDttugCon3i99nQ%3D%3D",
                            title: "Salçiçe pule",
                          );
                          break;
                        case "Sallame":
                          return ShopItem(
                            imageUrl: "https://storage.googleapis.com/fix-company-b2b.appspot.com/images/products/1595415940413-Napolitan.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=RpuqLq5%2B6Lr9o1nSlFZs6K6sanOKOmZt63MXQJ2JGaqGFNfJ73mT9X2aFWk6BdhrKe65jLm8FTDNin%2FV%2FLx8dFRHdNcF4QCsKqDvb2zzIZKpf%2B7O8jXR%2B4bag5jQEMTVugwzsymDC8lc18RDGIOEs54LgKTZ6VQyJQSsx9Vob3DXJqVj6u%2BB%2FavtZ9tQHp1f68EFMICMRr2jtLR62%2BtKos8%2Fk5g4BEYUXJfDImhBG2pcrO3NC6I%2FEbFxIzb2IZPmCCKFDIN6%2B9kvmW0gVqpX98tMP9Y7CX%2BFN2xHXzYdUxhNx1hkXojB1ddV%2FB492ZetMyfYxjmX5a2XbOp9VotRUg%3D%3D",
                            title: "Sallam napolitan",
                          );
                          break;
                        default:
                          return ShopItem(
                            imageUrl: "https://storage.googleapis.com/fix-company-b2b.appspot.com/images/categories/1595415896663-gjysem-te-gatshme-small.jpg?GoogleAccessId=firebase-adminsdk-9356u%40fix-company-b2b.iam.gserviceaccount.com&Expires=16447014000&Signature=gTYjMpJZx7FjPHrw1MZj%2FvZ1aOTB%2FiqlM%2BWrc6NAj5Cbxa5Q%2B3AqOWXSyhpKz97InSfVlCGhqqh263KvbzG5VrS9C%2BpsMnW%2B4N4%2BbIu4wOMAlu22I%2BgY%2FGbOunZ3PX28mqKbda5I54Ju8YVNXJu9RIwBkoPom6YzG%2FRLaPgGAtUv7fa9FFUIjYgMcAN%2Ffv%2BZUPoLRF54J%2BaSQinGDx9GFqTLfB%2BcU93X%2BTwHIJoW2CgfMYOxWm1y2NSpyaZIu5HjJlYmgZ3Smj8%2F517aMd1P6K%2Fo5Fqmtbv45VeUp8eNew4znjAnOaNviOTBMqOKAhHFo7WgilMWRZ19609ZdNOvOw%3D%3D",
                            title: "Bratwurst",
                          );
                          break;
                      }
                    },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
